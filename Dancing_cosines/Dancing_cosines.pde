void setup(){
  //size(1760,900);
  fullScreen();
  background(15,0,30);
}
int n=0;
int i=0;

float x1(int i){
  float r = (float) i;
  //r=(r-(width/2))/(0.25*width)
  //r = (r*0.25*width)+(width/2);
  r = 400*cos(r/100) + width/2;
  return r;
}
float x2(int i){
  float r = (float) i;
  r = 200*cos(-r/100) + width/2;
  return r;
}
float x3(int i){
  float r = (float) i;
  r = 200*sin(r/100) + width*0.8;
  return r;
}
float y1(int i){
  float r = (float) i;
  r = 300*sin(-r/80)*sqrt(abs(cos(r/50))) + height/2;
  return r;
}
float y2(int i){
  float r = (float) i;
  r = 150*sin(r/80) + height/2;
  return r;
}
float y3(int i){
  float r = (float) i;
  r = 100*cos(-r/50) + height/2;
  return r;
}

void draw(){
  //n = (i-i%100)%100;
  println("start");
  stroke(
    200*(0.8+0.2*cos(((float) i)/10)),
    (150+ 50*sin(((float)i)/30))*(0.65+0.35*cos(((float) i)/10)),
    -50*cos(((float)i)/1)
  );
  
  line(
  x1(i),y1(i),
  x2(i),y2(i)
  );
  
  stroke(
    180 + 20*cos(((float)i)/3)+ 50*sin(((float)i)/50),
    150+ 50*sin(((float)i)/30),
    -150*cos(((float)i)/90)
  );
  
  line(
  x1(i),y1(i),
  x3(i),y3(i)
  );
  
  i++;
  if(i%20 == 0){
    fill(0,0,0,10);
    rect(-1,-1,width+1,height+1);
  }
  println("before frame");
  //saveFrame("C:/Users/nkk88/OneDrive/Dokumenter/Processing/Dancing_cosines/frame_####.png");
  //saveFrame("C:/Users/nkk88/Documents/Processing/Dancing_cosines/Frames/frame_####.png");
  println("frame");
}
