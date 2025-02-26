void setup(){
  size(1600,800);
  background(0);
  noFill();
  stroke(255);
}

float time=0;
float r0 = 50;
float r = 100;
float angle0 = 0;
float angle = 0;
float cX =0;
float cY =0;
float cXnext =0;
float cYnext =0;
float angleSpeed=2;
PVector t = new PVector(1,0);
int iterations = 1;
ArrayList<PVector> list = new ArrayList<>();
ArrayList<PVector> list2 = new ArrayList<>();
ArrayList<PVector> list3 = new ArrayList<>();

void draw(){
  background(0);
  //reset circles
  cX=width/4;
  cY=height/4;
  r=r0;
  angle = angle0+PI;
  //draw circles
  for( int i =0 ; i<iterations; i++){
    //update radius and angle
    r = r0/(2*(i+1)-1);
    angle = (2*(i+1)-1)*angle0;
    //draw circle and line, and update center
    cXnext = cX + cos(angle+PI)*r;
    cYnext = cY + sin(angle+PI)*r;
    stroke(255,150);
    circle(cX,cY,r*2);
    stroke(255);
    line(cX,cY,cXnext,cYnext);
    cX = cXnext;
    cY = cYnext;
  }
  //connection line
  line(cX,cY,width/2,cY);
  //update points in graph
  PVector v1 = new PVector(0,0);
  v1.set(width/2,cY);
  list.add(v1);
  for(PVector u : list){ u.add(t); point(u.x,u.y);}
  //draw graph
  beginShape();
  for(PVector u : list){vertex(u.x,u.y);}
  endShape();
  
  
  //reset circles
  cX=width/4;
  cY=height/2;
  r=r0;
  angle = angle0+PI;
  //draw circles
  for( int i =0 ; i<iterations; i++){
    //update radius and angle
    r = r0* (pow(-1,i+1)/(i+1));
    angle = (i+1)*angle0;
    //draw circle and line, and update center
    cXnext = cX + cos(angle)*r;
    cYnext = cY + sin(angle)*r;
    circle(cX,cY,r*2);
    line(cX,cY,cXnext,cYnext);
    cX = cXnext;
    cY = cYnext;
  }
  //connection line
  line(cX,cY,width/2,cY);
  //update points in graph
  PVector v2 = new PVector(0,0);
  v2.set(width/2,cY);
  list2.add(v2);
  for(PVector u : list2){ u.add(t); point(u.x,u.y);}
  //draw graph
  beginShape();
  for(PVector u : list2){vertex(u.x,u.y);}
  endShape();
  
  
  
  //reset circles
  cX=width/4;
  cY=3*height/4;
  r=r0;
  angle = angle0;
  //draw circles
  for( int i =0 ; i<iterations; i++){
    //update radius and angle
    r = r0* (pow(-1,i+1)/pow(2*(i+1)-1,2));
    angle = (2*(i+1)-1)*angle0;
    //draw circle and line, and update center
    cXnext = cX + cos(angle)*r;
    cYnext = cY + sin(angle)*r;
    circle(cX,cY,r*2);
    line(cX,cY,cXnext,cYnext);
    cX = cXnext;
    cY = cYnext;
  }
  //connection line
  line(cX,cY,width/2,cY);
  //update points in graph
  PVector v3 = new PVector(0,0);
  v3.set(width/2,cY);
  list3.add(v3);
  for(PVector u : list3){ u.add(t); point(u.x,u.y);}
  //draw graph
  beginShape();
  for(PVector u : list3){vertex(u.x,u.y);}
  endShape();
  
  
  
  
  time++;
  angle0 = angleSpeed*time/100;
}


void keyPressed(){
  if ( key == CODED ){
  if (keyCode == UP){
    iterations ++;
  }
  if (keyCode == DOWN){
    iterations--;
    if (iterations <1) {iterations = 1;}
  }
  if (keyCode == RIGHT){
    iterations += 10;
  }
  if (keyCode == LEFT){
    iterations -= 10;
    if (iterations <1) {iterations = 1;}
  }
  }
}
