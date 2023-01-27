/// Quaternion library
/// 5th May 2019
/// @jujuadams

//Handle local rotation
if (keyboard_check(ord("S"))) quaternion.rotate_localx(3) else
if (keyboard_check(ord("W"))) quaternion.rotate_localx(-3) else
if (keyboard_check(ord("E"))) quaternion.rotate_localy(3) else
if (keyboard_check(ord("Q"))) quaternion.rotate_localy(-3) else
if (keyboard_check(ord("A"))) quaternion.rotate_localz(3) else
if (keyboard_check(ord("D"))) quaternion.rotate_localz(-3) else

//Handle world-space rotation
if (keyboard_check(ord("K"))) {quaternion.rotate_worldx(3); debug_world_rotation -= 3;} else
if (keyboard_check(ord("I"))) {quaternion.rotate_worldx(-3); debug_world_rotation += 3;} else
if (keyboard_check(ord("J"))) {quaternion.rotate_worldy(3); debug_world_rotation += 3;} else
if (keyboard_check(ord("L"))) {quaternion.rotate_worldy(-3); debug_world_rotation -= 3;} else
if (keyboard_check(ord("O"))) {quaternion.rotate_worldz(3); debug_world_rotation -= 3;} else
if (keyboard_check(ord("U"))) {quaternion.rotate_worldz(-3); debug_world_rotation += 3;}