void setup(){
  size(1800,900);
  background(0);
}

int n=0;

void draw(){
  frameRate(20);
  
  for (float x=-900; x<901; x++){
    for (float y = -450; y<451; y++){
      
      float cx=x/2000;
      float cy=y/2000-0.7;
      float fx=0;
      float fy=0;
      
      int i=0;
      while( i<100 ){
        
        float next_fx = fx*fx - fy*fy + cx;
        float next_fy = 2*fx*fy + cy;
        
        if (fx*fx+fy*fy > 10){
          
          break;
        }
        
        
        fx=next_fx;
        fy=next_fy;
      
        
        
        i++;
      }
     if (fx*fx+fy*fy > 4){
          stroke((0.5+0.5*sin(log(i+n)+5))*150-(1.7*log((i+2*n)%200)+1)%100,(0.5+0.5*sin(1+2*log((i+n)%220)))*255-(5*i+n)%200,(0.5+0.5*sin(0.08*i+n-5))*255-(5*i+n)%255 );
          
          point(x+900,y+450);
     }
      
            
    }
  }
  n++;
}
