#macro  __UGG_VERSION  "0.2.0"
#macro  __UGG_DATE     "2023-12-22"

#macro __UGG_COLOR_UNIFORM  static _shdUgg_u_vColor = shader_get_uniform(__shdUgg, "u_vColor");



__Ugg();

function __Ugg()
{
    static _global = undefined;
    if (_global != undefined) return _global;
    _global = {};
    
    show_debug_message("Welcome to Ugg by Juju Adams! This is version " + __UGG_VERSION + " " + __UGG_DATE);
    
    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_normal();
    _global.__vertexFormat = vertex_format_end();
    
    _global.__sphere   = __UggPrebuildSphere();
    _global.__cylinder = __UggPrebuildCylinder();
    _global.__aabb     = __UggPrebuildAABB(-0.5, -0.5, -0.5, 0.5, 0.5, 0.5);
    _global.__ray      = __UggPrebuildAABB(-0.5, -0.5,  0.0, 0.5, 0.5, 1.0);
    
    
    
    shader_set(__shdUgg);
    shader_set_uniform_f(shader_get_uniform(__shdUgg, "u_vAmbientColor"),
                         color_get_red(  UGG_AMBIENT_LIGHT_COLOR)/255,
                         color_get_green(UGG_AMBIENT_LIGHT_COLOR)/255,
                         color_get_blue( UGG_AMBIENT_LIGHT_COLOR)/255);
    
    shader_set_uniform_f(shader_get_uniform(__shdUgg, "u_vDirectLightColor"),
                         color_get_red(  UGG_LIGHT_COLOR)/255,
                         color_get_green(UGG_LIGHT_COLOR)/255,
                         color_get_blue( UGG_LIGHT_COLOR)/255);
    
    var _inverseLength = 1/sqrt(UGG_LIGHT_DIRECTION_X*UGG_LIGHT_DIRECTION_X
                              + UGG_LIGHT_DIRECTION_Y*UGG_LIGHT_DIRECTION_Y
                              + UGG_LIGHT_DIRECTION_Z*UGG_LIGHT_DIRECTION_Z);
    var _directionX = UGG_LIGHT_DIRECTION_X*_inverseLength;
    var _directionY = UGG_LIGHT_DIRECTION_Y*_inverseLength;
    var _directionZ = UGG_LIGHT_DIRECTION_Z*_inverseLength;
    
    shader_set_uniform_f(shader_get_uniform(__shdUgg, "u_vDirectLightDirection"), _directionX, _directionY, _directionZ);
    shader_set_uniform_f(shader_get_uniform(__shdUgg, "u_vColor"), color_get_red(  UGG_DEFAULT_DIFFUSE_COLOR)/255,
                                                                   color_get_green(UGG_DEFAULT_DIFFUSE_COLOR)/255,
                                                                   color_get_blue( UGG_DEFAULT_DIFFUSE_COLOR)/255);
    shader_reset();
    
    return _global;
}