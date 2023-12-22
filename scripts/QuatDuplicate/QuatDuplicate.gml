/// @desc Makes an identical copy of the given quaternion
/// 
/// @param quaternion

function QuatDuplicate(_quat)
{
    var _new = array_create(4);
    array_copy(_new, 0, _quat, 0, 4);
    return _new;
}