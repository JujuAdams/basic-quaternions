/// @param axisX   x-component of rotation axis
/// @param axisY   y-component of rotation axis
/// @param axisZ   z-component of rotation axis
/// @param angle   Angle of rotation, in degrees
/// @param [resultQuaternion]

function QuatFromAxisAngle(_axisX, _axisY, _axisZ, _angle, _resultQuaternion = [])
{
    var _length = sqrt(_axisX*_axisX + _axisY*_axisY + _axisZ*_axisZ);
    if (_length == 0)
    {
        return [0, 0, 0, 1];
    }
    
    var _inverseLength = 1 / _length;
    _axisX *= _inverseLength;
    _axisY *= _inverseLength;
    _axisZ *= _inverseLength;
    
    var _sin = dsin(0.5*_angle);
    var _cos = dcos(0.5*_angle);
    
    _resultQuaternion[@ 0] = _axisX*_sin;
    _resultQuaternion[@ 1] = _axisY*_sin;
    _resultQuaternion[@ 2] = _axisZ*_sin;
    _resultQuaternion[@ 3] = _cos;
    
    return _resultQuaternion;
}