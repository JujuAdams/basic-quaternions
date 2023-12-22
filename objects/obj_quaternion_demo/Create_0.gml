//Make a quaternion
quaternion = quaternion_create();

//Define model offset/position
vbf_cube_x = room_width/2;
vbf_cube_y = room_height/2;
vbf_cube_z = 0;
vbf_cube_x_offset = 0.5;
vbf_cube_y_offset = 0.5;
vbf_cube_z_offset = 0.5;

//Create a simple vertex format for an untextured model
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vft_plain = vertex_format_end();

//Create the cube model and start writing to it
vbf_cube = vertex_create_buffer();
vertex_begin(vbf_cube, vft_plain);

var _x = 0;
var _y = 0;
var _z = 0;

var _colour = c_ltgray;
vertex_position_3d(vbf_cube, _x  , _y  , _z  ); vertex_colour(vbf_cube, _colour, 1); //under
vertex_position_3d(vbf_cube, _x+1, _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x  , _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);

_colour = c_white;
vertex_position_3d(vbf_cube, _x  , _y  , _z+1); vertex_colour(vbf_cube, _colour, 1); //over
vertex_position_3d(vbf_cube, _x+1, _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x  , _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);

_colour = c_red;
vertex_position_3d(vbf_cube, _x  , _y  , _z  ); vertex_colour(vbf_cube, _colour, 1); //top
vertex_position_3d(vbf_cube, _x+1, _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x  , _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);

_colour = c_yellow;
vertex_position_3d(vbf_cube, _x+1, _y  , _z  ); vertex_colour(vbf_cube, _colour, 1); //right
vertex_position_3d(vbf_cube, _x+1, _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x+1, _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);

_colour = c_blue;
vertex_position_3d(vbf_cube, _x+1, _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1); //bottom
vertex_position_3d(vbf_cube, _x  , _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x+1, _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x+1, _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);

_colour = c_lime;
vertex_position_3d(vbf_cube, _x  , _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1); //left
vertex_position_3d(vbf_cube, _x  , _y  , _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);

vertex_position_3d(vbf_cube, _x  , _y+1, _z  ); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y+1, _z+1); vertex_colour(vbf_cube, _colour, 1);
vertex_position_3d(vbf_cube, _x  , _y  , _z+1); vertex_colour(vbf_cube, _colour, 1);

//End model writing
vertex_end(vbf_cube);
vertex_freeze(vbf_cube);



//Create axis indicator
debug_world_rotation = 0;
vbf_axis = vertex_create_buffer();
vertex_begin(vbf_axis, vft_plain);

var _x = 0;
var _y = 0;
var _z = 0;

var _colour = c_dkgray;
vertex_position_3d(vbf_axis, _x  , _y  , _z  ); vertex_colour(vbf_axis, _colour, 1); //under
vertex_position_3d(vbf_axis, _x+1, _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x  , _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);

_colour = c_dkgray;
vertex_position_3d(vbf_axis, _x  , _y  , _z+1); vertex_colour(vbf_axis, _colour, 1); //over
vertex_position_3d(vbf_axis, _x+1, _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x  , _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);

_colour = c_white;
vertex_position_3d(vbf_axis, _x  , _y  , _z  ); vertex_colour(vbf_axis, _colour, 1); //top
vertex_position_3d(vbf_axis, _x+1, _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x  , _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);

_colour = c_black;
vertex_position_3d(vbf_axis, _x+1, _y  , _z  ); vertex_colour(vbf_axis, _colour, 1); //right
vertex_position_3d(vbf_axis, _x+1, _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x+1, _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);

_colour = c_white;
vertex_position_3d(vbf_axis, _x+1, _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1); //bottom
vertex_position_3d(vbf_axis, _x  , _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x+1, _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x+1, _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);

_colour = c_black;
vertex_position_3d(vbf_axis, _x  , _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1); //left
vertex_position_3d(vbf_axis, _x  , _y  , _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);

vertex_position_3d(vbf_axis, _x  , _y+1, _z  ); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y+1, _z+1); vertex_colour(vbf_axis, _colour, 1);
vertex_position_3d(vbf_axis, _x  , _y  , _z+1); vertex_colour(vbf_axis, _colour, 1);

//End model writing
vertex_end(vbf_axis);
vertex_freeze(vbf_axis);
