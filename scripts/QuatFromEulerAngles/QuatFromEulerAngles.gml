/// @desc Returns a quaternion that represents the rotation given by the provided Euler angles
/// Assumes XYZ ordering
/// 
/// @param xAngle  In degrees
/// @param yAngle  In degrees
/// @param zAngle  In degrees
/// @param [resultQuaternion]

function QuatFromEulerAngles(_xAngle, _yAngle, _zAngle, _resultQuaternion = [])
{
    var _sinX = dsin(0.5*_xAngle);
    var _sinY = dsin(0.5*_yAngle);
    var _sinZ = dsin(0.5*_zAngle);
    var _cosX = dcos(0.5*_xAngle);
    var _cosY = dcos(0.5*_yAngle);
    var _cosZ = dcos(0.5*_zAngle);
    
    _resultQuaternion[@ 0] = _sinX*_cosY*_cosZ + _cosX*_sinY*_sinZ;
    _resultQuaternion[@ 1] = _cosX*_sinY*_cosZ - _sinX*_cosY*_sinZ;
    _resultQuaternion[@ 2] = _cosX*_cosY*_sinZ + _sinX*_sinY*_cosZ;
    _resultQuaternion[@ 3] = _cosX*_cosY*_cosZ - _sinX*_sinY*_sinZ;
    
    return _resultQuaternion;
}