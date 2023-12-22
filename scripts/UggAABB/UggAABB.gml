/// Draws an axis-aligned bounding box
/// 
/// @param  xCentre   x-coordinate of the centre of the AABB
/// @param  yCentre   y-coordinate of the centre of the AABB
/// @param  zCentre   z-coordinate of the centre of the AABB
/// @param  xSize     Size of the AABB in the x-axis
/// @param  ySize     Size of the AABB in the y-axis
/// @param  zSize     Size of the AABB in the z-axis
/// @param  [color]   Colour of the AABB (standard GameMaker 24-integer)

function UggAABB(_x, _y, _z, _xSize, _ySize, _zSize, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    static _aabb = __Ugg().__aabb;
    __UGG_COLOR_UNIFORM
    
    var _worldMatrix = matrix_get(matrix_world);
    var _matrix = matrix_build(_x, _y, _z,   0, 0, 0,   _xSize, _ySize, _zSize);
        _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
    vertex_submit(_aabb, pr_trianglelist, -1);
    shader_reset();
    
    matrix_set(matrix_world, _worldMatrix);
}