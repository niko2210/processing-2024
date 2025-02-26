void setup(){
  size(900,900);
  //frameRate(1);
  stroke(0);
  strokeWeight(1);
  frameRate(1);
}
Tree tree = new Tree();
int i =0;
void draw(){
  translate(width/2,height-50);
  rotate(-HALF_PI);
  if(i<tree.depth){
    tree.grow();
    //println(tree.str);
    //println( );
    //println( );
    //println( );
  }
  background(200);
  strokeWeight(1);
  line(10, -width/2,10, width/2);
  tree.render();
  i++;
}
