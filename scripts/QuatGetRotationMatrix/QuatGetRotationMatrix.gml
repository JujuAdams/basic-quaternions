/// @param quaternion
/// @param [resultMatrix]

function QuatGetRotationMatrix(_quat, _resultMatrix = [])
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    _resultMatrix[@  0] = 2*(_w*_w + _x*_x) - 1;
    _resultMatrix[@  1] = 2*(_x*_y - _w*_z);
    _resultMatrix[@  2] = 2*(_x*_z + _w*_y);
    _resultMatrix[@  3] = 0;
    
    _resultMatrix[@  4] = 2*(_x*_y + _w*_z);
    _resultMatrix[@  5] = 2*(_w*_w + _y*_y) - 1;
    _resultMatrix[@  6] = 2*(_y*_z - _w*_x);
    _resultMatrix[@  7] = 0;
    
    _resultMatrix[@  8] = 2*(_x*_z - _w*_y);
    _resultMatrix[@  9] = 2*(_y*_z + _w*_x);
    _resultMatrix[@ 10] = 2*(_w*_w + _z*_z) - 1;
    _resultMatrix[@ 11] = 0;
    
    _resultMatrix[@ 12] = 0;
    _resultMatrix[@ 13] = 0;
    _resultMatrix[@ 14] = 0;
    _resultMatrix[@ 15] = 1;
    
    return _resultMatrix;
}