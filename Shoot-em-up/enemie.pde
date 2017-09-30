class enemie
  {
    
    //set varibles for enemie
    int y; 
    int x;
    int speed;
    int drop;
    int size;
   
    boolean byeBye =  false;
    
        PImage image, image1, image2, image3;
         int counter = 0;
         int countDir=1;
      
      //constructor 
        enemie(int _x, int _y, int speed, /*int drop,*/ int size)
          {
            this.x = _x;
            this.y = _y;
            this.speed = speed;
           /* this.drop = drop;*/ 
            this.size = size;
            image = loadImage("flameOne.png");
            image1 = loadImage("flameTwo.png");
            image2 = loadImage("flameThree.png");
            image3 = loadImage("flameFour.png");
        }
          
          void move()
            {
              //will stop is outside the parameters 
              if (y > 10 && y < 799)
                {
                  //sets speed and direction
                  x = x + speed;
                }else
                  {
                   speed = 0;
                  }
                //will change direction and drop predefined amount 
              if (x < 20 || x > 580)
                {
                 speed =- speed;
                 y = y + 60;
                }
            }
            
            void kill()
              {
                byeBye = true;
                
                
              }
              void endGame()
                {
                 byeBye = true;
                }
              
                void disapear(){ 
                   if(byeBye==true){ 
                 x= x + 900; 
                speed=0; 
               } 
              } 
              
              
                    
      boolean crash(player a)
        {
         float distance = dist(x,y, a.x,a.y);
            
            if(distance > 20)
              {
                return false;
              }else{
                  return true;
                }
        }//end of hit
          
               
          

            
          void render()
              {
                
                
                      if (counter>=0 && counter<=10){
                          image(image1,x,y);
                          image1.resize(size,size);
                           }
                            else if (counter>10 && counter<=20){
                              image(image,x,y);
                               image.resize(size,size);
              
                            }
                            else if (counter>20 && counter<=30)
                            {
                              image(image2,x,y);
                              image2.resize(size,size);
                              
                            }
                            else if(counter>30 && counter<=50){
                              image(image3,x,y);
                              image3.resize(size,size);
                            }
                            else 
                            {
                              countDir = -countDir; //reverse sequence
                            }
                            counter = counter + countDir;  
                
               
               
                
                /*fill(r*10,g*10,b*10);
                ellipse(x,y,size,size);*/
              }
      
  }