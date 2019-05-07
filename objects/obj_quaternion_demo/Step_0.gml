/// Quaternion library
/// 7th Nov 2016
/// @jujuadams

//Handle local rotation
if ( keyboard_check( ord( "S" ) ) ) quaternion = quaternion_rotate_localx( quaternion,  3 ) else
if ( keyboard_check( ord( "W" ) ) ) quaternion = quaternion_rotate_localx( quaternion, -3 ) else
if ( keyboard_check( ord( "E" ) ) ) quaternion = quaternion_rotate_localy( quaternion,  3 ) else
if ( keyboard_check( ord( "Q" ) ) ) quaternion = quaternion_rotate_localy( quaternion, -3 ) else
if ( keyboard_check( ord( "A" ) ) ) quaternion = quaternion_rotate_localz( quaternion,  3 ) else
if ( keyboard_check( ord( "D" ) ) ) quaternion = quaternion_rotate_localz( quaternion, -3 ) else

//Handle world-space rotation
if ( keyboard_check( ord( "K" ) ) ) { quaternion = quaternion_rotate_worldx( quaternion,  3 ); debug_world_rotation -= 3; } else
if ( keyboard_check( ord( "I" ) ) ) { quaternion = quaternion_rotate_worldx( quaternion, -3 ); debug_world_rotation += 3; } else
if ( keyboard_check( ord( "J" ) ) ) { quaternion = quaternion_rotate_worldy( quaternion,  3 ); debug_world_rotation += 3; } else
if ( keyboard_check( ord( "L" ) ) ) { quaternion = quaternion_rotate_worldy( quaternion, -3 ); debug_world_rotation -= 3; } else
if ( keyboard_check( ord( "O" ) ) ) { quaternion = quaternion_rotate_worldz( quaternion,  3 ); debug_world_rotation -= 3; } else
if ( keyboard_check( ord( "U" ) ) ) { quaternion = quaternion_rotate_worldz( quaternion, -3 ); debug_world_rotation += 3; }