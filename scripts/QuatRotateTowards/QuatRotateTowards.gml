/// @param quaternion
/// @param x
/// @param y
/// @param z
/// @param step
/// @param [resultQuaternion]

function QuatRotateTowards(_quat, _x, _y, _z, _step, _resultQuaternion = [])
{
    static _staticQuat = [_x, _y, _z, 0];
    
    var _angle = QuatAngleTo(_quat, _x, _y, _z);
    if (_angle == 0) return QuatDuplicate(_quat, _resultQuaternion);
    
    _staticQuat[@ 0] = _x;
    _staticQuat[@ 1] = _y;
    _staticQuat[@ 2] = _z;
    
    return QuatSlerp(_quat, _staticQuat, min(1, _step/_angle), _resultQuaternion);
}