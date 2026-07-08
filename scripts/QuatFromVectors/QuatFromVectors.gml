/// Return the quaternion that maps vector 1 onto vector 2.
/// 
/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param [resultQuaternion]

function QuatFromVectors(_x1, _y1, _z1, _x2, _y2, _z2, _resultQuaternion = [])
{
    var _length = sqrt(_x1*_x1 + _y1*_y1 + _z1*_z1);
    if (_length > 0)
    {
        _x1 /= _length;
        _y1 /= _length;
        _z1 /= _length;
    }
    
    var _length = 1 / sqrt(_x2*_x2 + _y2*_y2 + _z2*_z2);
    if (_length > 0)
    {
        _x2 /= _length;
        _y2 /= _length;
        _z2 /= _length;
    }
    
    var _dot = dot_product_3d(_x1, _y1, _z1,   _x2, _y2, _z2);
    if (_dot <= -1)
    {
        //Opposite
        if (abs(_x1) > abs(_z1))
        {
            var _length = sqrt(_x1*_x1 + _y1*_y1);
            return [-_y1/_length, _x1/_length, 0, 0];
        }
        else
        {
            var _length = sqrt(_y1*_y1 + _z1*_z1);
            return [0, -_z1/_length, _y1/_length, 0];
        }
    }
    else if (_dot >= 1)
    {
        //Parallel
        return [0, 0, 0, 1];
    }
    
    //TODO - This cross product is the opposite way round to what I'm familiar with...
    _resultQuaternion[@ 0] = _z2*_y1 - _y2*_z1;
    _resultQuaternion[@ 1] = _x2*_z1 - _z2*_x1;
    _resultQuaternion[@ 2] = _y2*_x1 - _x2*_y1;
    _resultQuaternion[@ 3] = _dot;
    
    return _resultQuaternion;
}