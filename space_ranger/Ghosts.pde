class Ghosts{
  
  ArrayList<Ghost> ghosts;
  int hp;
  Player player;
  
  Ghosts (int x , Player player){
    hp = x;
    ghosts = new ArrayList<Ghost>();
    this.player = player;
  }
  
  void run(){
    for ( Ghost ghost : ghosts ){
      ghost.run();
    }
  }
  
  void addGhost(){
    float x = player.position.x;
    float y = player.position.y;
    
    while ( dist(player.position.x, player.position.y , x ,y) < 200 ){
      x = random(width);
      y = random(height);
    }
    
    Ghost ghost = new Ghost((int) x,(int) y,player);
    ghosts.add(ghost);
  }
  void removeGhost(Ghost ghost){
    ghosts.remove(ghost);
  }
  void checkDead(){
    ArrayList<Ghost> deadGhosts = new ArrayList<Ghost>();
    for (Ghost ghost : ghosts){
      if (ghost.hp == 0){
        deadGhosts.add(ghost);
        points ++ ;
      }
    }
    for ( Ghost ghost : deadGhosts ){
      ghosts.remove(ghost);
    }
  }
  
}
