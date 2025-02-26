class Ghost{
  int hp;
  PVector position;
  PVector direction;
  PVector randomMovement;
  float randomAngle;
  int randomChangeFrequency;
  PVector velocity;
  float sizeFactor;
  int time;
  float speed;
  float colour;
  Player target;
  int R;
  int G;
  int B;
  
  Ghost(int x, int y, Player player){
    position = new PVector (x,y);
    direction = new PVector(0.001,0.001);
    randomMovement = new PVector(0.001,0.001);
    velocity = new PVector(0.001,0.001);
    sizeFactor = 30;
    randomAngle =0;
    randomChangeFrequency = 30;
    time = 0;
    target = player;
    hp = 5;
    speed = 2;
    colour = random(1000);
    R = floor(150 + 105*sin(colour));
    G = floor(150 + 155*sin(colour + PI*2/3));
    B = floor(100 
    + 55*sin(colour + PI*4/3)
    );
  }
  
  void run(){
    update();
    render();
    
  }
  
  void update(){
    colour += 0.1;
    R = floor(150 + 105*sin(colour));
    G = floor(150 + 155*sin(colour + PI*2/3));
    B = floor(100 
    + 55*sin(colour + PI*4/3)
    );
    position.add(velocity);
    velocity.x = direction.x;
    velocity.y = direction.y;
    velocity.normalize();
    velocity.add(randomMovement);
    velocity.mult(speed);
    
    if(time == 0){
      randomAngle = random (TWO_PI);
      randomMovement.x = cos (randomAngle);
      randomMovement.y = sin (randomAngle);
    }
    
    direction.x = target.position.x - position.x;
    direction.y = target.position.y - position.y;
    
    time ++;
    time %= randomChangeFrequency;
  }
  
  void render(){
    fill(R,G,B);
    stroke(R,G,B);
    circle(position.x , position.y, sizeFactor);
    rect(position.x - sizeFactor/2 , position.y , sizeFactor,  sizeFactor/2);
    for (int i = -1 ; i<2 ; i++){
      circle ((int) position.x + 4*(((int)sizeFactor)/10)*i , (int) position.y + ((int)sizeFactor)/2 , sizeFactor/5);
    }
    
    fill(0);
    stroke(0);
    for (int i = -1 ; i<2 ; i+=2){
      circle ((int) position.x + 2*(((int)sizeFactor)/10)*i , (int) position.y + ((int)sizeFactor)/2 +1, sizeFactor/5 -1);
    }
    for (int i = -1 ; i<2 ; i+=2){
      circle ((int) position.x + 2*(((int)sizeFactor)/10)*i , (int) position.y - ((int)sizeFactor)/10 , sizeFactor/5 -1);
    }
    //noFill();
    //stroke(255,0,0);
    //circle(position.x , position.y , sizeFactor);
    //stroke(255);
  }
  
  void takeHit(){
    hp -=1;
  }
  boolean isDead(){
    if(hp >0 ){
      return false;
    }
    return true;
  }
}
