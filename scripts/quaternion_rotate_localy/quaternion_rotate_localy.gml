/// @desc Rotates around the model's local y-axis.
/// @param quaternion
/// @param angle

function quaternion_rotate_localy(argument0, argument1) {

	return quaternion_multiply(argument0[0], argument0[1], argument0[2], argument0[3],
	                           dcos(argument1/2), 0, 0, dsin(argument1/2));


}
