void setup(){
  size( 1800 , 800 );
  background(0);
}

int points = 0;
Player player = new Player(500 , 300);
Ghosts ghosts = new Ghosts(2 ,player);
Shots shots = new Shots(ghosts);

void draw() {
  println(" ");
  println(" ");
  if(ghosts.ghosts.size()==0){println("Press g to start");}
  println(" Points = " + points);
  println(" HP = " + player.hp );
  background(0);
  player.checkForHit(ghosts);
  player.run();
  shots.run();
  ghosts.run();
  if (keyPressed){
    if (key ==' '){
      player.accelerate();
    }
  }
}

void mousePressed(){
   if(player.alive){shots.addShot(player);}
}
void keyPressed(){
  if (keyPressed){
    if ( key == 'g' || key == 'G' ){
      ghosts.addGhost();
    }
  }
}
