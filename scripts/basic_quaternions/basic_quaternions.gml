/// Quaternion library
/// 5th May 2019
/// @jujuadams

/// @desc Creates a quaternion (4-element 1D array).
function quaternion_create() {

	return [1.0, 0.0, 0.0, 0.0000001];
	
}
/// @desc Makes a 4x4 column-major transform matrix from a quaternion.
/// @param quaternion
function quaternion_matrix(_quaternion) {

	var _r = _quaternion[0];
	var _x = _quaternion[1];
	var _y = _quaternion[2];
	var _z = _quaternion[3];

	var _length = sqrt(_x*_x + _y*_y + _z*_z);
	var _hyp_sqr = _length*_length + _r*_r;

	//Calculate trig coefficients
	var _c   = 2*_r*_r / _hyp_sqr - 1;
	var _s   = 2*_length*_r*_hyp_sqr;
	var _omc = 1 - _c;

	//Normalise the input vector
	_x /= _length;
	_y /= _length;
	_z /= _length;

	//Build matrix
	return [_omc*_x*_x + _c   , _omc*_x*_y + _s*_z,  _omc*_x*_z - _s*_y, 0,
	        _omc*_x*_y - _s*_z, _omc*_y*_y + _c   ,  _omc*_y*_z + _s*_x, 0,
	        _omc*_x*_z + _s*_y, _omc*_y*_z - _s*_x,  _omc*_z*_z + _c   , 0,
	                         0,                  0,                   0, 1];
							 
}
/// @desc Multiplies two quaternions together, adding one rotation onto another.
/// @param r1
/// @param x1
/// @param y1
/// @param z1
/// @param r2
/// @param x2
/// @param y2
/// @param z2
function quaternion_multiply(r1, x1, y1, z1, r2, x2, y2, z2) {

	return [r1*r2 - x1*x2 - y1*y2 - z1*z2,
	        r1*x2 + x1*r2 + y1*z2 - z1*y2,
	        r1*y2 + y1*r2 + z1*x2 - x1*z2,
	        r1*z2 + z1*r2 + x1*y2 - y1*x2];
			
}
/// @desc Rotates around the model's local x-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_localx(_quaternion, _angle) {

	return quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                           dcos(_angle/2), dsin(_angle/2), 0, 0);
							   
}
/// @desc Rotates around the model's local y-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_localy(_quaternion, _angle) {

	return quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                           dcos(_angle/2), 0, 0, dsin(_angle/2));
							   
}
/// @desc Rotates around the model's local z-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_localz(_quaternion, _angle) {

	return quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                           dcos(_angle/2), 0, dsin(_angle/2), 0);
							   
}
/// @desc Rotates a 3D vector (3-element 1D array) by a quaternion.
/// @param vector
/// @param quaternion
function quaternion_rotate_vector(_vector, _quaternion) {

	_vector = quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                                           0,     _vector[0],     _vector[1],     _vector[2]);

	_vector = quaternion_multiply(_quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3],
	                                           0,    -_vector[1],    -_vector[2],    -_vector[3]);

	return [_vector[1], _vector[2], _vector[3]];
	
}
/// @desc Rotates around the world's x-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_worldx(_quaternion, _angle) {

	return quaternion_multiply(dcos(_angle/2), dsin(_angle/2), 0, 0,
	                           _quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3]);
							   
}
/// @desc Rotates around the world's y-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_worldy(_quaternion, _angle) {

	return quaternion_multiply(dcos(_angle/2), 0, dsin(_angle/2), 0,
	                           _quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3]);
							   
}
/// @desc Rotates around the world's z-axis.
/// @param quaternion
/// @param angle
function quaternion_rotate_worldz(_quaternion, _angle) {

	return quaternion_multiply(dcos(_angle/2), 0, 0, dsin(_angle/2),
	                           _quaternion[0], _quaternion[1], _quaternion[2], _quaternion[3]);
							   
}
