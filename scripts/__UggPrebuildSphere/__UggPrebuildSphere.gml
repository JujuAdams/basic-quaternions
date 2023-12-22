// Feather disable all

function __UggPrebuildSphere()
{
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, __Ugg().__vertexFormat);
    
    var _rows = 0.5*UGG_SPHERE_STEPS + 0.5;
    
    // Create sin and cos tables
    var _cc;
    var _ss;
    _cc[UGG_SPHERE_STEPS] = 0;
    _ss[UGG_SPHERE_STEPS] = 0;
    
    for( var _i = 0; _i <= UGG_SPHERE_STEPS; _i++)
    {
        var _rad = _i*360/UGG_SPHERE_STEPS;
        _cc[_i] = dcos(_rad);
        _ss[_i] = dsin(_rad);
    }
    
    for(var _j = 0; _j < _rows; _j++)
    {
        var _row1rad = (_j  )*180/_rows;
        var _row2rad = (_j+1)*180/_rows;
        var _rh1 = dcos(_row1rad);
        var _rd1 = dsin(_row1rad);
        var _rh2 = dcos(_row2rad);
        var _rd2 = dsin(_row2rad);
        
        var _i = 0;
        var _this_a = [_rd1*_cc[_i], _rd1*_ss[_i], _rh1,    _rd1*_cc[_i], _rd1*_ss[_i], _rh1];
        var _this_b = [_rd2*_cc[_i], _rd2*_ss[_i], _rh2,    _rd2*_cc[_i], _rd2*_ss[_i], _rh2];
        
        for( var _i = 1; _i <= UGG_SPHERE_STEPS; _i++ )
        {
            var _prev_a = _this_a;
            var _prev_b = _this_b;
            
            var _this_a = [_rd1*_cc[_i], _rd1*_ss[_i], _rh1,    _rd1*_cc[_i], _rd1*_ss[_i], _rh1];
            var _this_b = [_rd2*_cc[_i], _rd2*_ss[_i], _rh2,    _rd2*_cc[_i], _rd2*_ss[_i], _rh2];
            
            vertex_position_3d(_vertexBuffer, _prev_a[0], _prev_a[1], _prev_a[2]); vertex_normal(_vertexBuffer, _prev_a[3], _prev_a[4], _prev_a[5]);
            vertex_position_3d(_vertexBuffer, _prev_b[0], _prev_b[1], _prev_b[2]); vertex_normal(_vertexBuffer, _prev_b[3], _prev_b[4], _prev_b[5]);
            vertex_position_3d(_vertexBuffer, _this_a[0], _this_a[1], _this_a[2]); vertex_normal(_vertexBuffer, _this_a[3], _this_a[4], _this_a[5]);
            
            vertex_position_3d(_vertexBuffer, _prev_b[0], _prev_b[1], _prev_b[2]); vertex_normal(_vertexBuffer, _prev_b[3], _prev_b[4], _prev_b[5]);
            vertex_position_3d(_vertexBuffer, _this_b[0], _this_b[1], _this_b[2]); vertex_normal(_vertexBuffer, _this_b[3], _this_b[4], _this_b[5]);
            vertex_position_3d(_vertexBuffer, _this_a[0], _this_a[1], _this_a[2]); vertex_normal(_vertexBuffer, _this_a[3], _this_a[4], _this_a[5]);
        }
    }
    
    vertex_end(_vertexBuffer);
	vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}