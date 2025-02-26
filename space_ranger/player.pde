class Player{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector direction;
  float speedLimit;
  float sizeFactor;
  int hp;
  boolean alive;
  
  Player(int x , int y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    direction = new PVector(1,1);
    direction.normalize();
    speedLimit = 2;
    sizeFactor = 10;
    hp = 100;
    alive = true;
  }
  
  void run(){
    update();
    borders(); 
    render();
  }
  
  void update(){
    direction.x = mouseX - position.x;
    direction.y = mouseY - position.y;
    direction.normalize();
    if(hp < 1){
      alive = false;
    }
    
    position.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void accelerate(){
    acceleration.x = direction.x;
    acceleration.y = direction.y;
    acceleration.setMag(0.2);
  }
  
  void borders(){
    
    if (position.x<0){
      position.x += width;
    }
    if (position.x>width){
      position.x %= width;
    }
    if (position.y<0){
      position.y += height;
    }
    if (position.y>height){
      position.y %= height;
    }
    
  }
  void render(){
    if(alive){
    fill(255);
    
    beginShape();
    
    vertex(position.x , position.y );
    vertex(position.x + sizeFactor * (-direction.y - 0.5* direction.x), position.y + sizeFactor * (direction.x - 0.5* direction.y) );
    vertex(position.x + sizeFactor * direction.x * 2 , position.y + sizeFactor * direction.y * 2 );
    vertex(position.x + sizeFactor * (direction.y - 0.5* direction.x), position.y + sizeFactor * (-direction.x - 0.5* direction.y) );
    vertex(position.x , position.y );
    
    endShape(CLOSE);
    }
    
  }
  void checkForHit(Ghosts ghosts){
   for (Ghost ghost : ghosts.ghosts){
     
     if (dist( position.x + sizeFactor * (-direction.y - 0.5* direction.x), position.y + sizeFactor * (direction.x - 0.5* direction.y) 
     , ghost.position.x , ghost.position.y)<ghost.sizeFactor/2
     ||
     dist(position.x + sizeFactor * direction.x * 2 , position.y + sizeFactor * direction.y * 2
     , ghost.position.x , ghost.position.y)<ghost.sizeFactor/2
     ||
     dist(position.x + sizeFactor * (direction.y - 0.5* direction.x), position.y + sizeFactor * (-direction.x - 0.5* direction.y)  
     , ghost.position.x , ghost.position.y)<ghost.sizeFactor/2
     ||
     dist(position.x , position.y 
     , ghost.position.x , ghost.position.y)<ghost.sizeFactor/2){
       hp--;
     }
     
   }
  }
}
