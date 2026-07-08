/// @param matrix
/// @param [resultQuaternion]

function QuatFromRotationMatrix(_matrix, _resultQuaternion = [])
{
    var _matrix00 = _matrix[ 0];
    var _matrix11 = _matrix[ 5];
    var _matrix22 = _matrix[10];
    
    var _w = 0.5*sqrt(max(0, 1 + _matrix00 + _matrix11 + _matrix22));
    var _x = 0.5*sqrt(max(0, 1 + _matrix00 - _matrix11 - _matrix22));
    var _y = 0.5*sqrt(max(0, 1 - _matrix00 + _matrix11 - _matrix22));
    var _z = 0.5*sqrt(max(0, 1 - _matrix00 - _matrix11 + _matrix22));
    
    _resultQuaternion[@ 0] = abs(_x)*sign(_matrix[9] - _matrix[6]);
    _resultQuaternion[@ 1] = abs(_y)*sign(_matrix[2] - _matrix[8]);
    _resultQuaternion[@ 2] = abs(_z)*sign(_matrix[4] - _matrix[1]);
    _resultQuaternion[@ 3] = _w;
    
    return _resultQuaternion;
}