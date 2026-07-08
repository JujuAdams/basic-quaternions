function QuatRotateWorldY(_quat, _angle)
{
    static _staticQuat = [0, 0, 0, 1];
    _staticQuat[@ 1] = 0.5*dsin(_angle);
    _staticQuat[@ 3] = dcos(0.5*_angle);
    
    return QuatMultiply(_quat, _staticQuat);
}