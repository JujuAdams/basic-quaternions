varying vec3 v_vNormal;

uniform vec3 u_vAmbientColor;
uniform vec3 u_vDirectLightColor;
uniform vec3 u_vDirectLightDirection;
uniform vec3 u_vColor;

void main()
{
    gl_FragColor = vec4(u_vColor, 1.0);
    
    float dotProduct = max(0.0, dot(normalize(v_vNormal), -normalize(u_vDirectLightDirection)));
    gl_FragColor.rgb *= min(vec3(1.0), mix(u_vAmbientColor, u_vDirectLightColor, dotProduct));
}