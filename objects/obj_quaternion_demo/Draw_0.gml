/// Quaternion library
/// 5th May 2019
/// @jujuadams

//Draw debug text
draw_set_font(fnt_cambria16);
draw_set_colour(c_white);
draw_arrow(50, 50, 100,  50, 12);
draw_arrow(50, 50,  50, 100, 12);
draw_arrow(50, 50,  20,  20, 12);
draw_text(105, 40, "X" );
draw_text(45, 105, "Y" );
draw_text(5, 5, "Z");
draw_text(5, 150, "Quaternion library\n5th May 2019\n@jujuadams\n\nWASDQE - rotate locally\nIJKLUO - rotate in world");
draw_set_valign(fa_bottom);
draw_text(5, room_height, string(fps));
draw_set_valign(fa_top);

//Start z-buffer functions ("3D mode")
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);


//Place the model the model at its origin
matrix_set( matrix_world, matrix_build(-vbf_cube_x_offset, -vbf_cube_y_offset, -vbf_cube_z_offset,
                                       0, 0, 0,
                                       1, 1, 1));
//Rotate the model
matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), quaternion.get_matrix()));
//Position and scale the model in the world
matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), matrix_build(vbf_cube_x + vbf_cube_x_offset, vbf_cube_y + vbf_cube_y_offset, vbf_cube_z + vbf_cube_z_offset,
                                                                                0, 0, 0,
                                                                                300, 300, 300)));
//Submit the model
vertex_submit(vbf_cube, pr_trianglelist, -1);


//Reset the world transform matrix
matrix_set(matrix_world, matrix_build_identity());



#region Debug code

var _x = 0;
var _y = 0;
var _z = 0;
var _local = false;
if (keyboard_check(ord("S"))) {_x = 90; _local = true;} else
if (keyboard_check(ord("W"))) {_x = 90; _local = true;} else
if (keyboard_check(ord("E"))) {_y = 90; _local = true;} else
if (keyboard_check(ord("Q"))) {_y = 90; _local = true;} else
if (keyboard_check(ord("A"))) {_z = 90; _local = true;} else
if (keyboard_check(ord("D"))) {_z = 90; _local = true;} else
if (keyboard_check(ord("K"))) _x = 90 else
if (keyboard_check(ord("I"))) _x = 90 else
if (keyboard_check(ord("J"))) _z = 90 else
if (keyboard_check(ord("L"))) _z = 90 else
if (keyboard_check(ord("O"))) _y = 90 else
if (keyboard_check(ord("U"))) _y = 90;

if ((_x != 0) || (_y != 0) || (_z != 0))
{
    //Place the model the model at its origin
    matrix_set(matrix_world, matrix_build(-vbf_cube_x_offset, -vbf_cube_y_offset, -vbf_cube_z_offset,
                                          0, 0, 0,
                                          1, 1, 1 ) );
    //Scale
    matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), matrix_build(  0,  0,  0,
                                                                                      0,  0,  0,
                                                                                    550, 40, 40)));
    //Add extra rotation to indicate axis of rotation
    matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), matrix_build(0, 0, 0,
                                                                                    debug_world_rotation, 0, 0,
                                                                                    1, 1, 1)));
    
    matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), matrix_build(0, 0, 0,
                                                                                    0, _y, _z,
                                                                                    1, 1, 1 )));
    //Rotate the model to match local transform
    if (_local) matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), quaternion.get_matrix()));
    
    //Position and scale the model in the world
    matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), matrix_build(vbf_cube_x + vbf_cube_x_offset, vbf_cube_y + vbf_cube_y_offset, vbf_cube_z + vbf_cube_z_offset,
                                                                                    0, 0, 0,
                                                                                    1, 1, 1)));
    //Submit the model
    vertex_submit(vbf_axis, pr_trianglelist, -1);
    
}

//Reset the world transform matrix
matrix_set(matrix_world, matrix_build_identity());

#endregion