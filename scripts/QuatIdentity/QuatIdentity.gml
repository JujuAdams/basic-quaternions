/// @desc Returns a new, empty quaternion that represents no rotation
///
/// Quaternions are expressed as vec4s with the format [x, y, z, w]

function QuatIdentity()
{
    return [0, 0, 0, 1];
}