/// @param quaternion
/// @param x
/// @param y
/// @param z

function QuatAngleTo(_quat, _x, _y, _z)
{
    return 2*darccos(abs(clamp(QuatDot(_quat, [_x, _y, _z, 0]), -1, 1)));
}