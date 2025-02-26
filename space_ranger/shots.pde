class Shots{
  ArrayList<Shot> shots;
  ArrayList<Shot> removalList;
  Ghosts targets;
  
  Shots(Ghosts ghosts){
    shots = new ArrayList<Shot>();
    removalList = new ArrayList<Shot>();
    targets = ghosts;
  }
  void addShot(Player player){
    Shot shot = new Shot(player,targets);
    shots.add(shot);
  }
  
  void run(){
    for (Shot shot : removalList){
      shots.remove(shot);
    }
    for (Shot shot : shots ){
      shot.run();
    }
    checkForHits(targets);
  }
  
  void checkForHits(Ghosts ghosts){
    for( Shot shot : shots){
      //shot.checkForHit();
    }
  }
}
