/// @param x
/// @param y
/// @param z
/// @param [color]

function UggPoint(_x, _y, _z, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    return UggSphere(_x, _y, _z, UGG_POINT_RADIUS, _color);
}