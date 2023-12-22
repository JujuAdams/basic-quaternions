function QuatGetAxisAngle(_quat)
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    return [_x, _y, _z, darctan2(sqrt(_x*_x + _y*_y + _z*_z), _w)];
}