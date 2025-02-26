import java.lang.Math;

class CantorElement{
    int x1;
    int x2;
    int y1;
    int y2;
    ArrayList list;
    int dx;
    int dy;


    CantorElement(int[] coord, ArrayList list){
        x1 = coord[0];
        x2 = coord[1];
        y1 = coord[2];
        y2 = coord[3];
        this.list = list;
        dx = abs(x2-x1);
        dy = abs(y2-y1);
        list.add(this);
    }

    void delete(){
        list.remove(this);
    }

    void render(){
        rect(x1, y1, x2-x1, y2-y1);
    }

    void randomSplit(){
        int a;
        int b;
        a = (int) ((Math.random() + Math.random()) * dx /2);
        b = (int) ((Math.random() + Math.random()) * dx /2);
        int X1 = x1+min(a,b);
        int X2 = x1+max(a,b);

        a = (int) ((Math.random() + Math.random()) * dy /2);
        b = (int) ((Math.random() + Math.random()) * dy /2);
        int Y1 = y1+min(a,b);
        int Y2 = y1+max(a,b);

        
        int[][] m = {
            {x1,X1,y1,Y1},  
            {X2,x2,y1,Y1},
            {x1,X1,Y2,y2},  
            {X2,x2,Y2,y2}
        };


        for (int i = 0 ; i<4 ; i++){
            CantorElement element = new CantorElement( m[i] , list);
        }

        delete();
    }
}