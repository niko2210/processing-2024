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
    len = 5;
    R=100;
    G=50;
    B=50;
    depth=11;
    angleList = new ArrayList<>();
    lengthList = new ArrayList<>();
    randomBranchingFactor = 0.5;
    randomLengthFactor = 0.01;
    
  }
  
  
  void grow(){
    ArrayList<Float> list0 = new ArrayList<>();
    ArrayList<Float> list1 = new ArrayList<>();
    String newString = new String();
    newString = "";
    for (int i = 0 ; i < str.length() ; i++){
      Float F ;
      Float L ;
      char c = str.charAt(i);
      switch(c){
        case 'F':
          newString += "F";
          break;
        case 'B':
          newString += "[rFB][lFB]";
          F= random(-randomBranchingFactor,randomBranchingFactor);
          list0.add(F);
          L= random(-randomLengthFactor,randomLengthFactor);
          list1.add(L);
          
          F= random(-randomBranchingFactor,randomBranchingFactor);
          list0.add(F);
          L= random(-randomLengthFactor,randomLengthFactor);
          list1.add(L);
          break;
        case 'S':
          newString += "FB";
          break;
        case 'l':
          newString += "l";
          break;
        case 'r':
          newString += "r";
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
    if(list1.size() != 0) lengthList.add(list1);
    
    str = newString;
    len *=1.35;
    sw *=1.25;
  }
  
  void render(){
    int[] rowCounter = new int[depth];
    for (int i = 0 ; i < depth ; i++){
      rowCounter[i]=0;
    }
    int currentDepth=0;
    strokeWeight(sw);
    float l = len;
    float rl = len;
    
    for (int i = 0 ; i < str.length() ; i++){
      char c = str.charAt(i);
      int n = 0;
      switch(c){
        
        case 'F':
          stroke(R,G,B);
          println("currentDepth: " + currentDepth);
          float f = sw;
          if(currentDepth == depth-1){ println("in if statement"); sw =3;}
          println(currentDepth == depth-1);
          strokeWeight(sw);
          line(0,0,rl,0);
          if(currentDepth == depth-1){ sw =f;}
          strokeWeight(sw);
          translate(rl,0);
          break;
          
        case 'l':
        //println(list);
        //println(rowCounter);
        //println(str);
          rotate(angle
          //+random(-0.15,0.15)
          +angleList.get(currentDepth).get(rowCounter[currentDepth])
          +((float)2*(mouseX-0.5*width)/width)
          );
          rowCounter[currentDepth] +=1;
          break;
          
        case 'r':
          rotate(-angle
          //-random(-0.15,0.15)
          -((float)2*(mouseX-0.5*width)/width)
          );
          rowCounter[currentDepth] +=1;
          break;
          
        case '[':
          currentDepth++;
          n+=1;
          G+=10;
          stroke(R,G,B);
          
          int kD=-1;if (currentDepth ==0)kD=0;
          int kR=-1;if (rowCounter[currentDepth] ==0)kR=0;
          //print(lengthList);
          //print("  k= " + k);
          //print( "   cur = " + currentDepth);
          //print("cur+k = " + (currentDepth+k));
          //print(" rowC[cur]+k = " + (rowCounter[currentDepth]+k));
          l *= (0.8 + lengthList.get(currentDepth+kD).get(rowCounter[currentDepth]+kR)) 
          *((float)2*mouseY/height)
          ;
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
          
          //print(lengthList);
          
           kD=-1;if (currentDepth ==0)kD=0;
           kR=-1;if (rowCounter[currentDepth] ==0)kR=0;
          l /= (0.8 + lengthList.get(currentDepth+kD).get(rowCounter[currentDepth]+kR))  
          *((float)2*mouseY/height)
          ;
          rl = l
          //*random(0.9,1.1)
          ;
          sw /= 0.8;
          strokeWeight(sw);
          popMatrix();
          break;
      }
    }
    
  }
}
