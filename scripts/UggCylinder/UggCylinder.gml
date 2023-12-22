/// @param x
/// @param y
/// @param z
/// @param height
/// @param radius
/// @param [color]

function UggCylinder(_x, _y, _z, _height, _radius, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    static _cylinder = __Ugg().__cylinder;
    __UGG_COLOR_UNIFORM
    
    var _worldMatrix = matrix_get(matrix_world);
    var _matrix = matrix_build(_x, _y, _z,   0, 0, 0,   _radius, _radius, _height);
        _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
    vertex_submit(_cylinder, pr_trianglelist, -1);
    shader_reset();
    
    matrix_set(matrix_world, _worldMatrix);
}