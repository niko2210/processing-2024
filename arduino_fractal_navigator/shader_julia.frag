uniform vec2 u_resolution;
uniform float variable_x;
uniform float variable_y;
uniform float u_zoom;
uniform vec2 u_center;
uniform float time;
uniform float iterations;


float sinus(float f){
    return 0.5 + 0.5*sin(f);
}

void main(){

    vec2 uv = (gl_FragCoord.xy - u_resolution / 2.0) / 50;
    uv = uv / u_zoom;
    vec2 c = vec2(variable_x , variable_y);
    vec2 z = uv;

    float breaking_magnitude = 0.0;
    float i;
    for (i=0.0; i< iterations ; i++){
        
        float x = z.x*z.x - z.y*z.y + c.x;
        float y = 2*z.x*z.y + c.y;

        z.x = x;
        z.y = y;

        if (dot(z,z) > 4.0) {
            breaking_magnitude = sqrt(dot(z,z));
            break;
        }
    }

    vec3 color;
    float j = log(2+i - log(breaking_magnitude/2)*log(2))*log(iterations);
    if (i<iterations) color = vec3(
                            sinus(j/2 + time), 
                            0.9*sinus(1.2+ j/2 + time), 
                            sinus(2.4+ j/2 + time));

    if (i == iterations ) color = vec3(0.0 ,0.0, 0.0);

    gl_FragColor = vec4(color, 1.0);
}