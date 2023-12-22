function QuatRotateLocalZ(_quat, _angle)
{
    return QuatMultiply([0, 0, 0.5*dsin(_angle), dcos(0.5*_angle)], _quat);
}