if (keyboard_check(ord("T"))) quat = QuatRotateLocalX(quat, -0.5);
if (keyboard_check(ord("G"))) quat = QuatRotateLocalX(quat,  0.5);
if (keyboard_check(ord("F"))) quat = QuatRotateLocalY(quat,  0.5);
if (keyboard_check(ord("H"))) quat = QuatRotateLocalY(quat, -0.5);
if (keyboard_check(ord("R"))) quat = QuatRotateLocalZ(quat,  0.5);
if (keyboard_check(ord("Y"))) quat = QuatRotateLocalZ(quat, -0.5);

if (keyboard_check(ord("I"))) quat = QuatRotateWorldX(quat, -0.5);
if (keyboard_check(ord("K"))) quat = QuatRotateWorldX(quat,  0.5);
if (keyboard_check(ord("J"))) quat = QuatRotateWorldY(quat,  0.5);
if (keyboard_check(ord("L"))) quat = QuatRotateWorldY(quat, -0.5);
if (keyboard_check(ord("U"))) quat = QuatRotateWorldZ(quat,  0.5);
if (keyboard_check(ord("O"))) quat = QuatRotateWorldZ(quat, -0.5);