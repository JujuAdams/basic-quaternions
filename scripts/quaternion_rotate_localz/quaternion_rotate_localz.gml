/// @desc Rotates around the model's local z-axis.
/// @param quaternion
/// @param angle
///
/// Quaternion library
/// 7th Nov 2016
/// @jujuadams

return quaternion_multiply( argument0, [ dcos(argument1/2), 0, dsin(argument1/2), 0 ] );