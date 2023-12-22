/// @desc Rotates around the world's x-axis.
/// @param quaternion
/// @param angle

function quaternion_rotate_worldx(argument0, argument1) {

	return quaternion_multiply(dcos(argument1/2), dsin(argument1/2), 0, 0,
	                           argument0[0], argument0[1], argument0[2], argument0[3]);



}
