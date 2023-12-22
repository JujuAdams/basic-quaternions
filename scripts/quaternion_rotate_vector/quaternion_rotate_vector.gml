/// @desc Rotates a 3D vector (3-element 1D array) by a quaternion.
/// @param vector
/// @param quaternion

function quaternion_rotate_vector(argument0, argument1) {

	var _vector     = argument0;
	var _quaternion = argument1;

	_vector = quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                                           0,     _vector[0],     _vector[1],     _vector[2]);

	_vector = quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                                           0,    -_vector[1],    -_vector[2],    -_vector[3]);

	return [_vector[1], _vector[2], _vector[3]];


}
