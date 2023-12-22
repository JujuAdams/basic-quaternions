function QuatSlerp(_a, _b, _t)
{
    if (_t == 0) return QuatDuplicate(_a);
    if (_t == 1) return QuatDuplicate(_b);
    
    var _ax = _a[0];
    var _ay = _a[1];
    var _az = _a[2];
    var _aw = _a[3];
    
    var _bx = _b[0];
    var _by = _b[1];
    var _bz = _b[2];
    var _bw = _b[3];
    
    if ((_ax != _bx) || (_ay != _by) || (_az != _bz) || (_aw != _bw))
    {
        var _s = 1 - _t;
        var _cos = _ax*_bx + _ay*_by + _az*_bz + _aw*_bw;
        var _dir = (_cos >= 0)? 1 : -1;
        var _sqrSin = 1 - _cos*_cos;
        
        if (_sqrSin > 0)
        {
            var _sin    = sqrt(_sqrSin),
            var _length = arctan2(_sin, _cos*_dir);

            _s = sin(_s*_length) / _sin;
            _t = sin(_t*_length) / _sin;
        }

        var _tDir = _t*_dir;

        _ax = _ax*_s + _bx*_tDir;
        _ay = _ay*_s + _by*_tDir;
        _az = _az*_s + _bz*_tDir;
        _aw = _aw*_s + _bw*_tDir;
        
        if (_s == 1 - _t)
        {
            var _inverseLength = 1/sqrt(_ax*_ax + _ay*_ay + _az*_az + _aw*_aw);
            _ax *= _inverseLength;
            _ay *= _inverseLength;
            _az *= _inverseLength;
            _aw *= _inverseLength;
        }
    }
    
    return [_ax, _ay, _az, _aw];
}