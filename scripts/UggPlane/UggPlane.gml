/// @param x
/// @param y
/// @param z
/// @param normalX
/// @param normalY
/// @param normalZ
/// @param [color]

function UggPlane(_x, _y, _z, _normalX, _normalY, _normalZ, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    static _vertexFormat = __Ugg().__vertexFormat;
    __UGG_COLOR_UNIFORM
    
    //TODO - Optimise this and draw it relative to the camera's position
    
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin( _vertexBuffer, _vertexFormat);
    
    //Ensure normalisation
    var _factor = 1 / sqrt(_normalX*_normalX + _normalY*_normalY + _normalZ*_normalZ);
    _normalX *= _factor;
    _normalY *= _factor;
    _normalZ *= _factor;
    
    if ((_normalX == 0) && (_normalY == 0) && (abs(_normalZ) != 1))
    {
        //tangent = cross(normal, [0, 0, 1])
        var _tangentX = -_normalY;
        var _tangentY = _normalX;
        var _tangentZ = 0;
    }
    else
    {
        //tangent = cross(normal, [1, 0, 0])
        var _tangentX = 0;
        var _tangentY = -_normalZ;
        var _tangentZ = _normalY;
    }
    
    //bitangent = cross(normal, tangent)
    var _bitangentX = _normalZ*_tangentY - _normalY*_tangentZ;
    var _bitangentY = _normalX*_tangentZ - _normalZ*_tangentX;
    var _bitangentZ = _normalY*_tangentX - _normalX*_tangentY;
    
    _tangentX *= UGG_PLANE_SIZE;
    _tangentY *= UGG_PLANE_SIZE;
    _tangentZ *= UGG_PLANE_SIZE;
    
    _bitangentX *= UGG_PLANE_SIZE;
    _bitangentY *= UGG_PLANE_SIZE;
    _bitangentZ *= UGG_PLANE_SIZE;
    
    var _x1 = _x + _tangentX + _bitangentX;
    var _y1 = _y + _tangentY + _bitangentY;
    var _z1 = _z + _tangentZ + _bitangentZ;
    
    var _x2 = _x + _tangentX - _bitangentX;
    var _y2 = _y + _tangentY - _bitangentY;
    var _z2 = _z + _tangentZ - _bitangentZ;
    
    var _x3 = _x - _tangentX + _bitangentX;
    var _y3 = _y - _tangentY + _bitangentY;
    var _z3 = _z - _tangentZ + _bitangentZ;
    
    var _x4 = _x - _tangentX - _bitangentX;
    var _y4 = _y - _tangentY - _bitangentY;
    var _z4 = _z - _tangentZ - _bitangentZ;
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    vertex_position_3d(_vertexBuffer, _x4, _y4, _z4); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    vertex_position_3d(_vertexBuffer, _x4, _y4, _z4); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    vertex_position_3d(_vertexBuffer, _x3, _y3, _z3); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
    
    vertex_end(_vertexBuffer);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
    vertex_submit(_vertexBuffer, pr_trianglelist, -1);
    shader_reset();
    
    vertex_delete_buffer(_vertexBuffer);
}