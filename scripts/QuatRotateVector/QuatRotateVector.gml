/// @param quaternion
/// @param x
/// @param y
/// @param z
/// @oaran [resultArray]

function QuatRotateVector(_quat, _x, _y, _z, _resultArray = [])
{
    var _qx = _quat[0];
    var _qy = _quat[1];
    var _qz = _quat[2];
    var _qw = _quat[3];
    
    var _tx = 2*(_qy*_z - _qz*_y);
    var _ty = 2*(_qz*_x - _qx*_z);
    var _tz = 2*(_qx*_y - _qy*_x);
    
    _resultArray[@ 0] = _x + _qw*_tx + _qy*_tz - _qz*_ty;
    _resultArray[@ 1] = _y + _qw*_ty + _qz*_tx - _qx*_tz;
    _resultArray[@ 2] = _z + _qw*_tz + _qx*_ty - _qy*_tx;
    
    return _resultArray;
}