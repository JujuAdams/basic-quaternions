/// Generates a random quaternion. This function calls GameMaker's native `random()` function and
/// as such may interfere with procedural generation algorithms etc.

function QuatRandom()
{
    //TODO - Add option to use separate PRNG
    
    var _a = random(1);
    var _b = random(1);
    var _c = random(1);

    var _u = sqrt(1 - _a);
    var _v = sqrt(_a);

    return [
        _u*sin(2*pi*_b),
        _u*cos(2*pi*_b),
        _v*sin(2*pi*_c),
        _v*cos(2*pi*_c)
    ];
}