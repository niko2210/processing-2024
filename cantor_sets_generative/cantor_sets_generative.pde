import java.lang.Math;


ArrayList<ArrayList<CantorElement>> listList;
int time = 0;
int numberOfCantorSets = 40;
int splitChancePercentage = 10;


void setup(){
    fullScreen();
    listList  = new ArrayList<ArrayList<CantorElement>>();
    for( int i = 0 ; i<numberOfCantorSets ; i++){
        listList.add(new ArrayList<CantorElement>());
    }
    stroke(200);
    frameRate(1);
    background(200,240,240);
}

void keyPressed(){
  if( key == ' '){
    saveFrame("Screenshots/####.png");
  }
}

void draw(){
    //background(255);

    //first box
    if (time == 0){
        int[] input = {0,width,0,height};
        int i = 0;
        for( ArrayList<CantorElement> list : listList){
            CantorElement element = new CantorElement(input ,listList.get(i));
            i++;
        }
    }
    //split
    if(time>0){
        for(ArrayList<CantorElement> list : listList){
            if( Math.random()*100 < splitChancePercentage ){iterate(list);}
        }
    }


    render();
    int sum=0;
    for ( ArrayList<CantorElement> list : listList){
      sum += list.size();
    }
    println("time: " + time + " | cantorElements: " + sum);
    time++;
}

void iterate(ArrayList<CantorElement> list){
        ArrayList<CantorElement> listCopy = new ArrayList<CantorElement>(list);
        for (CantorElement element : listCopy){
            element.randomSplit();
        }
}

void render(){
  int r,g,b,a;
    for(ArrayList<CantorElement> list : listList){
        
    //grøn
    g = (int) (100 + Math.random()*85);
    b = (int) (pow((float) (Math.random()),2)*105);
    r = (int) (100 + Math.random()*155);
    a = (int) (Math.random()*105);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(dist(element.x1,element.y1,0.75*width,height*0.5)<900){
            element.render();
          }
        }    
    
    //blå
    b = (int) (100 + Math.random()*155);
    g = (int) (pow((float) (Math.random()),2)*105);
    r = (int) (Math.random()*155);
    a = (int) (Math.random()*105);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(dist(element.x2,element.y1,0,height)<900){
            element.render();
          }
        }
        
    r = (int) (100 + Math.random()*155);
    g = (int) (pow((float) (Math.random()),2)*105);
    b = (int) (Math.random()*155);
    a = (int) (Math.random()*105);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(dist(element.x2,element.y2,0,0)<500){
            element.render();
          }
        }        


    g = (int) (170 + Math.random()*105);
    b = (int) (155 + pow((float) (Math.random()),2)*105);
    r = (int) (150+Math.random()*105);
    a = (int) (Math.random()*105);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(dist(element.x1,element.y1,0.55*width,height*0.25)<300){
            element.render();
          }
        } 


    g = (int) (0 + Math.random()*25);
    b = (int) (0 + pow((float) (Math.random()),2)*105);
    r = (int) (0 + Math.random()*105);
    a = (int) (Math.random()*55);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(1.25*height - element.x1*1.05 < element.y1){
            element.render();
          }
          if(Math.random()*Math.random()*height < element.x1){
            element.render();
          }
        } 


    g = (int) (200 + Math.random()*25);
    b = (int) (200 + Math.random()*25);
    r = (int) (200 + Math.random()*25);
    a = (int) (Math.random()*155);
    stroke(r,g,b,a);
    fill(r,g,b,a);
        for(CantorElement element : list){
          if(Math.random()<0.04){
            element.render();
          }
        } 


    }  
}
