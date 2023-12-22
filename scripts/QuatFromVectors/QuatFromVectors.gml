/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2

function QuatFromVectors(_x1, _y1, _z1, _x2, _y2, _z2)
{
    var _inverseLength = 1 / sqrt(_x1*_x1 + _y1*_y1 + _z1*_z1);
    _x1 *= _inverseLength;
    _y1 *= _inverseLength;
    _z1 *= _inverseLength;
    
    var _inverseLength = 1 / sqrt(_x2*_x2 + _y2*_y2 + _z2*_z2);
    _x2 *= _inverseLength;
    _y2 *= _inverseLength;
    _z2 *= _inverseLength;
    
    var _dot = dot_product_3d(_x1, _y1, _z1, _x2, _y2, _z2);
    if (_dot <= 0)
    {
        _dot = 0;
    }
    else
    {
        //TODO - This cross product is the opposite way round to what I'm familiar with...
        return [ _z2*_y1 - _y2*_z1,
                 _x2*_z1 - _z2*_x1,
                 _y2*_x1 - _x2*_y1,
                 _dot              ];
    }
}