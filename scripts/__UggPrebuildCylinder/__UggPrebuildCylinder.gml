// Feather disable all

function __UggPrebuildCylinder()
{
    var _x1 = -1;
    var _y1 = -1;
    var _z1 = -0.5;
    var _x2 = 1;
    var _y2 = 1;
    var _z2 = 0.5;
    
	var _cc = array_create(UGG_CYLINDER_STEPS, 0);
	var _ss = array_create(UGG_CYLINDER_STEPS, 0);

	for(var _i = 0; _i <= UGG_CYLINDER_STEPS; _i++)
	{
		var _deg = 360*_i / UGG_CYLINDER_STEPS;
		_cc[_i] = dcos(_deg);
		_ss[_i] = dsin(_deg);
	}

	var _mx = 0.5*( _x2 + _x1 );
	var _my = 0.5*( _y2 + _y1 );
	var _rx = 0.5*( _x2 - _x1 );
	var _ry = 0.5*( _y2 - _y1 );

	var _vertexBuffer = vertex_create_buffer();
	vertex_begin(_vertexBuffer, __Ugg().__vertexFormat);
  
	var _bx = _mx + _cc[0]*_rx;
	var _by = _my + _ss[0]*_ry;
    
	for(var _i = 1; _i <= UGG_CYLINDER_STEPS; _i++)
	{
	    var _j = (_i+1) mod UGG_CYLINDER_STEPS;
    
	    var _ax = _bx;
	    var _ay = _by;
	    var _bx = _mx + _cc[_i]*_rx;
	    var _by = _my + _ss[_i]*_ry;
        
        //Top cap
	    vertex_position_3d(_vertexBuffer, _mx, _my, _z2); vertex_normal(_vertexBuffer, 0, 0,  1);
	    vertex_position_3d(_vertexBuffer, _ax, _ay, _z2); vertex_normal(_vertexBuffer, 0, 0,  1);
	    vertex_position_3d(_vertexBuffer, _bx, _by, _z2); vertex_normal(_vertexBuffer, 0, 0,  1);
        
        //Bottom cap
	    vertex_position_3d(_vertexBuffer, _mx, _my, _z1); vertex_normal(_vertexBuffer, 0, 0, -1);
	    vertex_position_3d(_vertexBuffer, _bx, _by, _z1); vertex_normal(_vertexBuffer, 0, 0, -1);
	    vertex_position_3d(_vertexBuffer, _ax, _ay, _z1); vertex_normal(_vertexBuffer, 0, 0, -1);
        
        //Wall
	    vertex_position_3d(_vertexBuffer, _ax, _ay, _z1); vertex_normal(_vertexBuffer, _cc[_i], _ss[_i], 0);
	    vertex_position_3d(_vertexBuffer, _bx, _by, _z1); vertex_normal(_vertexBuffer, _cc[_j], _ss[_j], 0);
	    vertex_position_3d(_vertexBuffer, _bx, _by, _z2); vertex_normal(_vertexBuffer, _cc[_j], _ss[_j], 0);
        
	    vertex_position_3d(_vertexBuffer, _bx, _by, _z2); vertex_normal(_vertexBuffer, _cc[_j], _ss[_j], 0);
	    vertex_position_3d(_vertexBuffer, _ax, _ay, _z2); vertex_normal(_vertexBuffer, _cc[_i], _ss[_i], 0);
	    vertex_position_3d(_vertexBuffer, _ax, _ay, _z1); vertex_normal(_vertexBuffer, _cc[_i], _ss[_i], 0);
	}

	vertex_end(_vertexBuffer);
	vertex_freeze(_vertexBuffer);
	return _vertexBuffer;
}