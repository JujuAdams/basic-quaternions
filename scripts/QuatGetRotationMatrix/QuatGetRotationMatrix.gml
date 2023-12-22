function QuatGetRotationMatrix(_quat)
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    return [2*(_w*_w + _x*_x) - 1, 2*(_x*_y - _w*_z),     2*(_x*_z + _w*_y),     0,
            2*(_x*_y + _w*_z),     2*(_w*_w + _y*_y) - 1, 2*(_y*_z - _w*_x),     0,
            2*(_x*_z - _w*_y),     2*(_y*_z + _w*_x),     2*(_w*_w + _z*_z) - 1, 0,
            0,                     0,                     0,                     1 ];
}