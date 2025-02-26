class Particle{
  int type;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  float mass;
  int R;
  int G;
  int B;
  float initialVelocity;
  PVector center;
  
  Particle(int x , int y, float r){
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    center = new PVector(0,0);
    
    initialVelocity = 0.5;
    
    position.x=x;
    position.y=y;
    
    velocity.x = random(-initialVelocity,initialVelocity);
    velocity.y = random(-initialVelocity,initialVelocity);
    
    size=r;
  }
  
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
    attract();
    impact();
  }
  
  float distanceSquared(Particle p){
    return 
    (this.position.x - p.position.x)*(this.position.x - p.position.x)+
    (this.position.y - p.position.y)*(this.position.y - p.position.y);
  }
  PVector difference(Particle p){
    PVector result = new PVector();
    result.x = p.position.x - this.position.x;
    result.y = p.position.y - this.position.y;
    return result;
  }
  
  void attract(){
    PVector attractor = new PVector();
    acceleration.set(0,0);
    for (Particle p : particleList){
      if(p!=this){
        attractor.set(difference(p));
        attractor.setMag(0.1/pow(max(distanceSquared(p),10),0.5));
        if(attractor.mag()>1){attractor.setMag(1);}
        if(attractor.mag()<0.0001){attractor.setMag(0.0001);}
        //println(1/pow(max(distanceSquared(p),10),1));
        acceleration.add(attractor);
        if (acceleration.mag()>1){println("acceleration: " + acceleration.mag());}
        if(distanceSquared(p) < 5){
        attractor.set(difference(p).mult(-1));
        attractor.setMag(pow(distanceSquared(p),1));
        if(attractor.mag()>0.1){attractor.setMag(0.1);}
        //println("acceleration: " + acceleration.mag());
        acceleration.add(attractor);
          
        }
      }
    }
  }
  
  void impact(){
    for (Particle p : particleList){
      if(p!=this){
        if(distanceSquared(p)<size*size){
          velocity.mult(1);
          PVector b = difference(p);
          PVector bh = new PVector();
          bh.x = -b.y;
          bh.y = b.x;
          float v = PVector.angleBetween(velocity,bh);
          velocity.rotate(v);
        }
      }
    }
  }
  
  void render (){
    circle(position.x,position.y, size);
  }
  
}
