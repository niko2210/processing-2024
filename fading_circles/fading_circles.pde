void setup(){
  size(800,800);
  background(0);
}

float cx=width/2;
float cy=height/2;
float r = 0;
float R = 180;
float G = 120;
float B = 0;
float diag = sqrt(width*width + height*height);
float strokeFactor = 0.7;
float angle=0;
boolean run=false;
float iteration = 0;
float scaleFactor=1;

void draw (){
  if(run){
  circle(cx,cy,r*scaleFactor);
  //if(iteration%3==0){
  //  fill(0,0,0,1);
  //  rect(-1,-1,2*width,2*height);
  //}
  if(iteration%5==0){
    fill(0,0,0,3);
    rect(-2,-2,2*width,2*height);
  }
  //if(iteration%30==0){
  //  fill(0,0,0,5);
  //  rect(-1,-1,2*width,2*height);
  //}
  cx = mouseX;
  cy = mouseY;
  r= 0.5*sqrt(
  pow(mouseX-width/2,2)+
  pow(mouseY-height/2,2)
  );
  
  cx= (cx/width)*2 -1;
  cy= (cy/height)*2 -1;
  r=r*2/diag;
  
  if (cx>0){
    angle = -atan(cy/cx);
  }
  if (cx<=0){
    angle = atan(cy/-cx)+PI;
  }
  angle += iteration/100;
  //println("angle: " + ((angle*360/TWO_PI)+360)%360);
  
  
  fill(
  ( 0.5+0.5*(cx*cx+cy*cy) )*R + cos(angle)*50,
  ( 0.1+0.9*(cx*cx+cy*cy) )*G+ cos(angle+TWO_PI/3)*50,
  ( (cx*cx+cy*cy) )*B+ cos(angle+2*TWO_PI/3)*50
  );
  stroke(r*255*strokeFactor);
  
  cx = (cx+1)*width/2;
  cy = (cy+1)*height/2;
  r = r*diag/2;
  iteration++;
}}

void mousePressed(){
  println("method start");
  while(true){println("1 : " + run);
    if(run){
    println("2 : " + run); run=false; println("3 : " + run); break;}
    println("4 : " + run);
    run=true;
    println("5 : " + run);
    break;
  }
  println("method end");
}
void keyPressed(){
  if(key == 's'){strokeFactor += 0.05;}
  if(key == 'a'){strokeFactor -= 0.05;}
  println("strokeFactor : " + strokeFactor);
  if(key == 'w'){
    fill(0,0,0,1);
    rect(-1,-1,2*width,2*height);
  }
}
void mouseWheel(MouseEvent event){
  float e = event.getCount();
  if(e>0){
    for (int i = 0 ; i<e ; i++){
      scaleFactor *=1.01;
    }
  }
  if(e<0){
    for (int i = 0 ; i>e ; i--){
      scaleFactor /=1.01;
    }
  }
}
