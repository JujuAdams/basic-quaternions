/// @desc Multiplies two quaternions together, adding one rotation onto another.
/// @param r1
/// @param x1
/// @param y1
/// @param z1
/// @param r2
/// @param x2
/// @param y2
/// @param z2
///
/// Quaternion library
/// 5th May 2019
/// @jujuadams
function quaternion_multiply(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	return [argument0*argument4 - argument1*argument5 - argument2*argument6 - argument3*argument7,
	        argument0*argument5 + argument1*argument4 + argument2*argument7 - argument3*argument6,
	        argument0*argument6 + argument2*argument4 + argument3*argument5 - argument1*argument7,
	        argument0*argument7 + argument3*argument4 + argument1*argument6 - argument2*argument5];



}
