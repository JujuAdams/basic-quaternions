/// @param axisX   x-component of rotation axis
/// @param axisY   y-component of rotation axis
/// @param axisZ   z-component of rotation axis
/// @param angle   Angle of rotation, in degrees

function QuatFromAxisAngle(_axisX, _axisY, _axisZ, _angle)
{
    var _inverseLength = 1 / sqrt(_axisX*_axisX + _axisY*_axisY + _axisZ*_axisZ);
    _axisX *= _inverseLength;
    _axisY *= _inverseLength;
    _axisZ *= _inverseLength;
    
    var _sin = dsin(0.5*_angle);
    var _cos = dcos(0.5*_angle);
    
    return [ _axisX*_sin,
             _axisY*_sin,
             _axisZ*_sin,
             _cos        ];
}