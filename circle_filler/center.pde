class Center{
  int x;
  int y;
  int d;
  
  int r;
  int g;
  int b;
  
  
  
  
  Center(int x, int y, int d){
    this.x = x;
    this.y = y;
    int[] a = {2*x ,2*y , 2*abs(x-width), 2*abs(height - y), d};
    this.d = min(a);
    
    r = (int) (100 + Math.random()*50);
    
    g = (int) (0 + Math.random()*50);
    
    b = (int) (170 + Math.random()*50);
  }
  
  void render(){
    fill(r,g,b);
    circle(x,y,d);
    println("red: " + r);
    println("green: " + g);
    println("blue: " + b);
  }
  
  boolean contains(int x, int y){
    return dist(x,y,this.x,this.y)<d/2;
  }
  
  float distance(int x, int y){
    return dist(x,y,this.x,this.y)-(d/2);
  }
}
