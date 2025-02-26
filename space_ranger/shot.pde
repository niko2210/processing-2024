class Shot{
  PVector shotPosition;
  PVector velocity;
  PVector direction;
  float speed;
  float size;
  Player shooter;
  Ghosts targets;
  
  Shot(Player player, Ghosts ghosts){
    shooter = player;
    targets = ghosts;
    speed = 10;
    size = 4;
    shotPosition = new PVector(0,0);
    shotPosition.x = player.position.x;
    shotPosition.y = player.position.y;
    velocity = new PVector(1,1);
    velocity.x = player.direction.x;
    velocity.y = player.direction.y;
    
    velocity.setMag(speed);
    
    direction = new PVector(1,1);
    direction.x = player.direction.x;
    direction.y = player.direction.y;
    direction.normalize();
    
  }
  
  void run(){
    update();
    render();
    checkForHit(targets);
  }
  
  void update(){
    shotPosition.add(velocity);
    if( mag(shotPosition.x , shotPosition.y) > width + height){ shots.removalList.add(this);}
  }
  void render(){
    fill(255);
    circle(shotPosition.x, shotPosition.y , size);
  }
  void checkForHit(Ghosts ghosts){
    for (Ghost ghost : ghosts.ghosts ){
      boolean hit = false;
      for (int i = 0; i<speed ; i++){
        if ( sqrt( pow(shotPosition.x - direction.x*i - ghost.position.x , 2) + pow( shotPosition.y - direction.y*i - ghost.position.y , 2 ) ) < ghost.sizeFactor/2){
          hit = true;
          break;
        }
      }
      if (hit){
        ghost.takeHit();
        shots.removalList.add(this);
        break;
      }
      
    }
    ghosts.checkDead();
  }
}
