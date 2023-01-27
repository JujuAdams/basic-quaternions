/// @desc Creates a quaternion struct containing a 4-element 1D array and various manipulation functions.
///
/// Quaternion library
/// 5th May 2019
/// @jujuadams
function quaternion_create() constructor{

	q = [1.0, 0.0, 0.0, 0.0000001];
	
	///@func get_matrix()
	///@desc Makes and returns a 4x4 column-major transform matrix from this quaternion
	static get_matrix = function(){
		var _r = q[0];
		var _x = q[1];
		var _y = q[2];
		var _z = q[3];

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
	///@func rotate_localx(angle)
	///@desc Rotates around the local X axis
	///@param angle
	static rotate_localx = function(angle){
		q_multiply(q[0], q[1], q[2], q[3],dcos(angle/2), dsin(angle/2), 0, 0);
		}
	///@func rotate_localy(angle)
	///@desc Rotates around the local Y axis
	///@param angle
	static rotate_localy = function(angle){
		q_multiply(q[0], q[1], q[2], q[3],dcos(angle/2), 0, 0, dsin(angle/2));
		}
	///@func rotate_localz(angle)
	///@desc Rotates around the local Z axis
	///@param angle
	static rotate_localz = function(angle){
		q_multiply(q[0], q[1], q[2], q[3],dcos(angle/2), 0, dsin(angle/2), 0);
		}
	///@func rotate_worldx(angle)
	///@desc Rotates around the world X axis
	///@param angle
	static rotate_worldx = function(angle){
		q_multiply(dcos(angle/2), dsin(angle/2), 0, 0,q[0], q[1], q[2], q[3]);
		}
	///@func rotate_worldy(angle)
	///@desc Rotates around the world Y axis
	///@param angle
	static rotate_worldy = function(angle){
		q_multiply(dcos(angle/2), 0, dsin(angle/2), 0,q[0], q[1], q[2], q[3]);
		}
	///@func rotate_worldz(angle)
	///@desc Rotates around the world Z axis
	///@param angle
	static rotate_worldz = function(angle){
		q_multiply(dcos(angle/2), 0, 0, dsin(angle/2),q[0], q[1], q[2], q[3]);
		}
		
	///@func rotate_vector(vector)
	///@desc Rotate a 3D vector (either a 3-element 1D array or a struct with x, y and z values) by a quaternion. Returns the vector in the form submitted
	///@param vector
	static rotate_vector = function(vector){
		//check if it's an array or struct
		var isStruct = is_struct(vector)
		if isStruct{
			var vvec;
			vvec[2] = vector.z
			vvec[1] = vector.y
			vvec[0] = vector.x
			vector = vvec
			}
		vector = quaternion_multiply(q[0], q[1], q[2], q[3], 0, vector[0],vector[1],vector[2]);
		vector = quaternion_multiply(q[0], q[1], q[2], q[3], 0, -vector[1],-vector[2],-vector[3]);
		if !isStruct{
			return [vector[1], vector[2], vector[3]];
			}else{
			return {
				x : vector[1],
				y : vector[2],
				z : vector[3],
				}
			}
		}
	///@func q_multiply(r1,x1,y1,z1,r2,x2,y2,z2)
	///@desc used internally by the rotate_* fuctions - don't call this directly
	static q_multiply = function(r1, x1, y1, z1, r2, x2, y2, z2){
		q = [r1*r2 - x1*x2 - y1*y2 - z1*z2,
	        r1*x2 + x1*r2 + y1*z2 - z1*y2,
	        r1*y2 + y1*r2 + z1*x2 - x1*z2,
	        r1*z2 + z1*r2 + x1*y2 - y1*x2];
		}
}