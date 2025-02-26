import java.util.LinkedList;
import java.util.Queue;
import processing.serial.*;

Serial port;
String recievedData;

PShader shader;
String data;
float n;
float[] position;
float variable_x = 0.25;
float variable_y = 0.0;
float time = 0;
float centerX = -0.75;
float centerY = 0.0;
float zoom = 5.0;
float iterations = 100.0;
float colorParameter1 = 1;
float sensitivity = 1;
float parameter = 1;
String shaderType = "mandelbrot";
float timeIncrement = 0.05;

void setup() {
    size(1480, 960, P2D);
    
    shader = loadShader("shader_" + shaderType + ".frag");
    shader.set("u_resolution",float(width), float(height));
    port = new Serial(this, "COM3", 9600);
    port.bufferUntil('\n');
    recievedData = "no input";
}

void serialEvent(Serial port) {
  recievedData = port.readStringUntil('\n').trim();
}

void draw() {
    position = position(parameter);
    println(recievedData);
    
    shader.set("time", time);
    shader.set("variable_x", position[0]);
    shader.set("variable_y", position[1]);
    shader.set("iterations", iterations*log(zoom*10));
    shader.set("u_center", centerX, centerY);
    shader.set("u_zoom", zoom);
    shader.set("colorParameter1", colorParameter1);
    shader.set("sensitivity", sensitivity);
    shader.set("meditationFactorAverage", 1);
    shader(shader);
    rect(0,0,width,height);
    time += timeIncrement;


    float step = 0.1/zoom;
    
        if (recievedData.equals("up")){
            centerY += step;
        }
        if (recievedData.equals("down")){
            centerY -= step;
        }
        if (recievedData.equals("left")){
            centerX -= step;
        }
        if (recievedData.equals("right")){
            centerX += step;
        }
        if (recievedData.equals("a")){
            zoom *= 1.02;
        }
        if (recievedData.equals("b")){
            zoom /= 1.02;
        }
        if (recievedData.equals("c")){
            iterations *= 1.02;
        }
        if (recievedData.equals("d")){
            iterations /= 1.02;
        }
        
        if (key == 'w'){
            centerY += step;
        }
        if (key == 's'){
            centerY -= step;
        }
        if (key == 'a'){
            centerX -= step;
        }
        if (key == 'd'){
            centerX += step;
        }
        
        if (key == 'q'){
            zoom /= 1.02;
        }
        if (key == 'e'){
            zoom *= 1.02;
        }
        if (key == 'r'){
            iterations *= 1.02;
        }
        if (key == 'f'){
            iterations /= 1.02;
        }
        if (key == 't'){
            parameter *= 1.2;
        }
        if (key == 'g'){
            parameter /= 1.2;
        }
        if (key == '1'){
            timeIncrement *= 1.2;
        }
        if (key == '2'){
            timeIncrement /= 1.2;
        }
        if (key == 'y'){
            sensitivity *= 1.05;
            if(sensitivity > 100) {sensitivity = 100;}
        }
        if (key == 'h'){
            sensitivity /= 1.05;
        }

    
}

//what?
float[] position(float parameter){
    float x = parameter * cos(2*PI*parameter) - 0.75;
    float y = parameter * sin(2*PI*parameter) + 0.03;



    float[] result = new float[2];
    result[0] = x;
    result[1] = y;
    println(x + " ; " + y);
    return result;
}
