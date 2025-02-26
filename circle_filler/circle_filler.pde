import java.lang.Math.*;

Center center;
ArrayList<Center> list;

float shrinkRatio = 0.9;

void setup(){
  size(800,800);
  fullScreen();
  list = new ArrayList<Center>();
  center = new Center(200,200,200);
  list.add(center);
  noFill();
  noStroke();
  frameRate(10);
  background(0);
}

void draw(){
  fill(20,10,10,20);
  rect(0,0,width, height );
  
  for(Center center : list){ center.render();}
  
  println( center.contains(mouseX,mouseY));

  addCenter();
}

float canvasDist(int x, int y){
  int[] arr = {x, y, width-x , height - y};
  return (float) (min(arr));
}

void addCenter(){
  int x = (int)  (random(width));
  int y = (int)  (random(height));

  float d = canvasDist(x,y);

  for(Center center : list){
    if(center.distance(x,y)<d) { d= center.distance(x,y);}
  }
  int dInt = (int) (shrinkRatio*d);

  if( d>0 ) { list.add( new Center(x,y,2*dInt));}
  if( d<=0) {addCenter();}
}

void keyPressed(){

  if(key ==' '){
    list = new ArrayList<Center>();
    list.add(center);
  }
}