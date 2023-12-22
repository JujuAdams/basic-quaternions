function QuatRotateWorldY(_quat, _angle)
{
    return QuatMultiply(_quat, [0, 0.5*dsin(_angle), 0, dcos(0.5*_angle)]);
}