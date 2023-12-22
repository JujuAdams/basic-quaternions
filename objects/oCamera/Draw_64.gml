if (showInfo)
{
    var _string  = "Quaternions " + __QUATERNIONS_VERSION + "\n";
        _string += "Juju Adams " + __QUATERNIONS_DATE + "\n";
        _string += "\n";
        _string += "camera position = " + string(camX) + ", " + string(camY) + ", " + string(camZ) + "\n";
        _string += "camera yaw/pitch = " + string(camYaw) + ", " + string(camPitch) + "\n";
        _string += "\n";
        _string += "WASD/shift/space to move\n";
        _string += "Left click to toggle mouselook\n";
        _string += "F1 to toggle this panel\n";
        _string += "F4 to toggle fullscreen";
    
    draw_set_colour(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(10, 10, 20 + string_width(_string), 20 + string_height(_string), false);
    draw_text(15, 16, _string);
    draw_set_alpha(1.0);
    draw_text(14, 15, _string);
    draw_text(16, 15, _string);
    draw_text(15, 14, _string);
    draw_text(15, 16, _string);
    draw_set_colour(c_white);
    draw_text(15, 15, _string);
}

var _x = 0.5*display_get_gui_width();
var _y = 0.5*display_get_gui_height();
gpu_set_blendmode_ext( bm_inv_dest_color, bm_inv_src_color);
draw_line(_x - 20, _y, _x + 20, _y);
draw_line(_x, _y - 20, _x, _y + 20);
gpu_set_blendmode(bm_normal);