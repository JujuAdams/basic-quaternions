/// @param quaternion
/// @param [resultQuaternion]

function QuatInvert(_quat, _resultQuaternion = [])
{
    _resultQuaternion[@ 0] = -_quat[0];
    _resultQuaternion[@ 1] = -_quat[1];
    _resultQuaternion[@ 2] = -_quat[2];
    _resultQuaternion[@ 3] =  _quat[3];
    
    return _resultQuaternion;
}