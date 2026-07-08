/// @param quaternion
/// @param [resultQuaternion]

function QuatNormalize(_quat, _resultQuat = [])
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    var _length = sqrt(_x*_x + _y*_y + _z*_z + _w*_w);
    if (_length == 0) return QuatIdentity();
    
    var _inverseLength = 1/_length;
    _resultQuat[@ 0] = _x*_inverseLength;
    _resultQuat[@ 1] = _y*_inverseLength;
    _resultQuat[@ 2] = _z*_inverseLength;
    _resultQuat[@ 3] = _w*_inverseLength;
    
    return _resultQuat;
}