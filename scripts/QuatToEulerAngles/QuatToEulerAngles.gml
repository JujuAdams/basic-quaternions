/// @param quaternion
/// @param [resultArray]

function QuatToEulerAngles(_quat, _resultArray = [])
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    var _t = 2*(_x*_z + _w*_y);
    if (_t <= -1)
    {
        var _clampedAsine = -pi/2;
    }
    else if (_t >= 1)
    {
        var _clampedAsine = pi/2;
    }
    else
    {
        var _clampedAsine = arcsin(_t);
    }
    
    _resultArray[@ 0] = radtodeg(-arctan2(2 * (_y*_z - _w*_x), 1 - 2 * (_x*_x + _y*_y)));
    _resultArray[@ 1] = radtodeg(_clampedAsine);
    _resultArray[@ 2] = radtodeg(-arctan2(2 * (_x*_y - _w*_z), 1 - 2 * (_y*_y + _z*_z)));
    return _resultArray;
}