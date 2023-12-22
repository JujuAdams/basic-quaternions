/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param [color]
/// @param [thickness]

function UggRay(_x1, _y1, _z1, _x2, _y2, _z2, _color = UGG_DEFAULT_DIFFUSE_COLOR, _thickness = UGG_RAY_THICKNESS)
{
    static _ray = __Ugg().__ray;
    __UGG_COLOR_UNIFORM
    
    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _dz = _z2 - _z1;
    
    var _length = sqrt(_dx*_dx + _dy*_dy + _dz*_dz);
    if (_length == 0) return false;

    var _plane_length = sqrt(_dx*_dx + _dy*_dy);
    var _z_angle = point_direction(0, 0, _plane_length, _dz);
    var _p_angle = point_direction(0, 0, _dx, _dy);
    
    var _worldMatrix = matrix_get(matrix_world);
    var _matrix = matrix_build(0,0,0,   0,0,0,   _thickness, _thickness, _length);
       _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, -90 - _z_angle, 0,   1,1,1));
       _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, 0, _p_angle,   1,1,1));
       _matrix = matrix_multiply(_matrix, matrix_build(_x1, _y1, _z1,   0,0,0,   1,1,1));
       _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
    vertex_submit(_ray, pr_trianglelist, -1);
    shader_reset();
    
    matrix_set(matrix_world, _worldMatrix);
}