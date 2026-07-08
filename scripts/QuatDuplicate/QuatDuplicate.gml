/// @desc Makes an identical copy of the given quaternion
/// 
/// @param quaternion
/// @param [resultQuaternion]

function QuatDuplicate(_quat, _resultQuaternion = [])
{
    array_copy(_resultQuaternion, 0, _resultQuaternion, 0, 4);
    return _resultQuaternion;
}