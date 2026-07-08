/// @param quaternion

function QuatGetAxisAngle(_quat, _resultStruct = undefined)
{
    static _staticStruct = {};
    
    var _x = _quat[0];
    var _y = _quat[1];
    var _z = _quat[2];
    var _w = _quat[3];
    
    _resultStruct ??= _staticStruct;
    
    with(_resultStruct)
    {
        x     = _x;
        y     = _y;
        z     = _z;
        angle = 2*darctan2(sqrt(_x*_x + _y*_y + _z*_z), _w);
    };
    
    return _resultStruct;
}