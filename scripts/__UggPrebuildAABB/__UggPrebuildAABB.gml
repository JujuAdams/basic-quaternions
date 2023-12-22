// Feather disable all

/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2

function __UggPrebuildAABB(_x1, _y1, _z1, _x2, _y2, _z2)
{
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin( _vertexBuffer, __Ugg().__vertexFormat);
    
    
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer, -1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2); vertex_normal(_vertexBuffer, -1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2); vertex_normal(_vertexBuffer, -1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer, -1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2); vertex_normal(_vertexBuffer, -1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1); vertex_normal(_vertexBuffer, -1,  0,  0);
    
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1); vertex_normal(_vertexBuffer,  1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1); vertex_normal(_vertexBuffer,  1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1); vertex_normal(_vertexBuffer,  1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  1,  0,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2); vertex_normal(_vertexBuffer,  1,  0,  0);
    
    
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer,  0, -1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2); vertex_normal(_vertexBuffer,  0, -1,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2); vertex_normal(_vertexBuffer,  0, -1,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer,  0, -1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1); vertex_normal(_vertexBuffer,  0, -1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2); vertex_normal(_vertexBuffer,  0, -1,  0);
    
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1); vertex_normal(_vertexBuffer,  0,  1,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2); vertex_normal(_vertexBuffer,  0,  1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  0,  1,  0);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1); vertex_normal(_vertexBuffer,  0,  1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  0,  1,  0);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1); vertex_normal(_vertexBuffer,  0,  1,  0);
    
    
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1); vertex_normal(_vertexBuffer,  0,  0, -1);
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer,  0,  0,  1);
    
    
    
    vertex_end(_vertexBuffer);
	vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}