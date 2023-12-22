/// @param quaternion
/// @param x
/// @param y
/// @param z
/// @param step

function QuatRotateTowards(_quat, _x, _y, _z, _step)
{
    var _angle = QuatAngleTo(_quat, _x, _y, _z);
    if (_angle == 0) return QuatDuplicate(_quat);
    
    var _t = min(1, _step/_angle);
    return QuatSlerp(_quat, [_x, _y, _z, 0], _t);
}