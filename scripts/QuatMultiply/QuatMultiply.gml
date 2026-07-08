/// @param a
/// @param b
/// @param [resultQuaternion]

function QuatMultiply(_a, _b, _resultQuat = [])
{
    var _ax = _a[0];
    var _ay = _a[1];
    var _az = _a[2];
    var _aw = _a[3];
    
    var _bx = _b[0];
    var _by = _b[1];
    var _bz = _b[2];
    var _bw = _b[3];
    
    _resultQuat[@ 0] = _ax*_bw + _aw*_bx + _ay*_bz - _az*_by;
    _resultQuat[@ 1] = _ay*_bw + _aw*_by + _az*_bx - _ax*_bz;
    _resultQuat[@ 2] = _az*_bw + _aw*_bz + _ax*_by - _ay*_bx;
    _resultQuat[@ 3] = _aw*_bw - _ax*_bx - _ay*_by - _az*_bz;
    
    return _resultQuat;
}