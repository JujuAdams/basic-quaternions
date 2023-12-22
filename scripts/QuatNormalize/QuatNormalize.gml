function QuatNormalize(_quat)
{
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    var _length = sqrt(_x*_x + _y*_y + _z*_z + _w*_w);
    if (_length == 0) return QuatIdentity();
    
    var _inverseLength = 1/_length;
    return [ _quat[0]*_inverseLength,
             _quat[1]*_inverseLength,
             _quat[2]*_inverseLength,
             _quat[3]*_inverseLength ];
}