/// @param vertex0
/// @param vertex1
/// @param vertex2
/// @param color

function UggTriangle(_x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3, _color = UGG_DEFAULT_DIFFUSE_COLOR) 
{
    static _vertexFormat = __Ugg().__vertexFormat;
    __UGG_COLOR_UNIFORM
    
    var _oldCullmode = gpu_get_cullmode();
    gpu_set_cullmode(cull_noculling);
    
    
    
    var _dx12 = _x2 - _x1;
    var _dy12 = _y2 - _y1;
    var _dz12 = _z2 - _z1;
    var _dx13 = _x3 - _x1;
    var _dy13 = _y3 - _y1;
    var _dz13 = _z3 - _z1;
    
    var _normalX = -(_dz12*_dy13 - _dy12*_dz13);
    var _normalY = -(_dx12*_dz13 - _dz12*_dx13);
    var _normalZ = -(_dy12*_dx13 - _dx12*_dy13);
    
    
    
	var _vertexBuffer = vertex_create_buffer();
	vertex_begin(_vertexBuffer, _vertexFormat);
	vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
	vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
	vertex_position_3d(_vertexBuffer, _x3, _y3, _z3); vertex_normal(_vertexBuffer, _normalX, _normalY, _normalZ);
	vertex_end(_vertexBuffer);
    
    
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
    vertex_submit(_vertexBuffer, pr_trianglelist, -1);
    shader_reset();
    
    
    
    vertex_delete_buffer(_vertexBuffer);
    gpu_set_cullmode(_oldCullmode);
}
