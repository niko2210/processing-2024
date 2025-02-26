void setup(){
  size(1200,960);
  background(0);
  //frameRate(5);
  //stroke(255);
}
ArrayList<Particle> particleList = new ArrayList<>();
int randomPosition = 50;
int count = 0;

void draw(){
  if (count%3 == 0){
  fill(0,10);
  rect(-2,-2,width+4,height+4);
  fill(255);
  }
  for(Particle p : particleList){
    p.render();
    p.update();
  }
  count++;
  if(count > 10000){particleList = new ArrayList<>(); count =0;}
}

void mousePressed(){
  for( int i = 0 ; i <10 ; i++ ){
    Particle p = new Particle
    (mouseX+floor(random(-randomPosition,randomPosition+1)),
    mouseY+floor(random(-randomPosition,randomPosition+1)), 10);
    particleList.add(p);
  }
}
