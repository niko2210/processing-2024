class Tree{
  //rules:
  //S -> F
  //F -> FB
  //B -> [rFB][lFB]
  
  String str = "S";
  float angle;
  float len;
  float sw = 1;
  float R;
  float G;
  float B;
  int depth;
  ArrayList<ArrayList<Float>> angleList;
  ArrayList<ArrayList<Float>> lengthList;
  float randomBranchingFactor;
  float randomLengthFactor;
  
  Tree(){
    angle = 
    0
    //HALF_PI/5.0
    ;
    len = 0.4;
    R=100;
    G=80;
    B=50;
    depth=7;
    angleList = new ArrayList<>();
    randomBranchingFactor = 0.5;
    randomLengthFactor = 0.2;
    
  }
  
  
  void grow(){
    ArrayList<Float> list0 = new ArrayList<>();
    String newString = new String();
    newString = "";
    for (int i = 0 ; i < str.length() ; i++){
      Float F ;
      char c = str.charAt(i);
      switch(c){
        case 'F':
          newString += "FF";
          break;
        case 'X':
          newString += "F+[[X]-X]-F[-FX]+X";
          F= random(-randomBranchingFactor,randomBranchingFactor);
          list0.add(F);
          F= random(-randomBranchingFactor,randomBranchingFactor);
          list0.add(F);
          break;
        case 'S':
          newString += "X";
          break;
        case '+':
          newString += "+";
          break;
        case '-':
          newString += "-";
          break;
        case '[':
          newString += "[";
          break;
        case ']':
          newString += "]";
          break;
      }
    }
    angleList.add(list0);
    
    str = newString;
    len *=1.35;
    sw *=1.25;
  }
  
  void render(){
    background(200);
    int[] rowCounter = new int[depth];
    for (int i = 0 ; i < depth ; i++){
      rowCounter[i]=0;
    }
    int currentDepth=0;
    strokeWeight(sw);
    float l = len;
    float rl = len;
    
    println(str);
    
    for (int i = 0 ; i < str.length() ; i++){
      char c = str.charAt(i);
      int n = 0;
      switch(c){
        
        case 'F':
          stroke(R,G,B);
          float f = sw;
          strokeWeight(sw);
          line(0,0,rl,0);
          if(currentDepth == depth-1){ sw =f;}
          strokeWeight(sw);
          translate(rl,0);
          break;
          
        case '+':
        //println(list);
        //println(rowCounter);
        //println(str);
          rotate(
          25*TWO_PI/360
          );
          //rowCounter[currentDepth] +=1;
          break;
          
        case '-':
          rotate(-
          25*TWO_PI/360
          );
          //rowCounter[currentDepth] +=1;
          break;
          
        case '[':
          currentDepth++;
          n+=1;
          G+=10;
          stroke(R,G,B);
          //l *= 0.8 
          //*((float)2*mouseY/height)
          //;
          rl = l
          //*random(0.9,1.1)
          ;
          sw *= 0.8;
          strokeWeight(sw);
          pushMatrix();
          break;
          
        case ']':
          currentDepth--;
          n-=1;
          G-=10;
          stroke(R,G,B);
          //l /= 0.8 
          //*((float)2*mouseY/height)
          //;
          rl = l
          //*random(0.9,1.1)
          ;
          sw /= 0.8;
          strokeWeight(sw);
          popMatrix();
          break;
      }
    }
    return;
  }
}
