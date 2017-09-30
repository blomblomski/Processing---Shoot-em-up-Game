
class bullet
{
  //set some varibles up for the bullets.
  float x;
  float y;
  float  speed;
  
            //creates random colours
      float r = random(50); //random number [0..50] float g = random(50);
      float g = random(50);
      float b = random(50);
      
      
    PImage Bomb;   
      
      // constructor for water drops, will literally be putting out fires.  
  bullet(float _x,float _y, float speed)
    {
      this.x = _x;
      this.y = _y;
      this.speed = speed;
      Bomb = loadImage("bomb.png");
    }
    
        //sets what dircection water drops will move
  void move()
      {
        y = y - speed;
      }
      
       //passes bullet properties to void draw();  
    void render()
          {  
            //removes outline from water drops
            noStroke();
                //Draw me some random coloured water drops, why? because I can  
            fill(r*10, g*10, b*10);
            ellipse(x+2,y-3, 10,10);
          }
        
        //if bullets reaches this height romove from screen
     boolean destroy()
       {
         //if less than 800 pixels and greater than 100 pixels be on screen else remove 
         if (y - speed > 800 || y - speed < 100)
           {
             return true;
           }else
             {
               return false;
             }
       } //end of destroy   

    /*if bullt within set distance of the FIRE(in this case)
          return true and pass value to  bullets.hit(e1[q][w]) and do your thing */      
      boolean hit(enemie a)
        {
                 //sets what distance is looking for fromm the objects, FIRE and BULLETS x and y 
         float distance = dist(x,y, a.x,a.y);
                //if bullets is within 20 pixels of x,y of fire return true else be false 
            if(distance > 20)
              {
                return false;
              }else{
                  return true;
                }
        }//end of hit
        
        
        /* -----------------------START OF BOMBS STUFF -----------------------------*/
        
          //movement for Bombs
      void move1()
          {
            y =y + speed;
          }
          
          //image for bombs
          void bomb()
              {
                image(Bomb,x,y);
              }
        
        
                
     boolean destroyBomb()
       {
         
         if (y - speed > 800 || y - speed < -20)
           {
             return true;
           }else
             {
               return false;
             }
       } //end of destroy   
       
       
             
      boolean die(player a)
        {
                 //sets what distance is looking for fromm the objects, FIRE and BULLETS x and y 
         float distance = dist(x,y, a.x,a.y);
                //if bullets is within 20 pixels of x,y of fire return true else be false 
            if(distance > 20)
              {
                return false;
              }else{
                  return true;
                }
        }//end of hit
        
        
}// end of bullets class