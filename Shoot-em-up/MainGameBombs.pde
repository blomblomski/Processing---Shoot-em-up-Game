/*

  Space Invader type game, is based on a fireman saving the city from fire.
    
    Thank you for taking the time to play my very buggy game 
                
        I think this is version 4.5, if the others are required please let me know 
*/
  
  
//Golbal varibles   
   //sets the how many and the sizing of the enemie array
   int row = 8;
   int col = 8;
   int gap = 50;
   
   //Game speed setting   
   int speed = 1;
   //total kills per level, only resets at start of new level 
   int  killCount = 0;
   
   
           //game mode settings 
           final int NORMAL = 0;
           final int CRASH = 1;
           int gameMode = NORMAL;
     
     //loading fonts and images
     PFont f,ff;
     PImage background;
         
           //2d array for the enemies 
           enemie [][] e1 = new enemie[row][col];
           //arrayLists for the water bullets thingies and fire bombs  
           ArrayList <bullet> b = new ArrayList <bullet>();
           ArrayList <bullet> e = new ArrayList <bullet>();
   
   
   //creating new instances of stuff
   player p;
   visual graphics;
   stats stat = new stats(20,20);
    
void setup()
  {
    //size of the screen
    size(800, 800);
    //load and set background posistions
    background = loadImage("skyline-DEN.png");
    background.resize(width-200, height);
    
    
    /* IF LOADING SLOW ON UNI COMPUTER REMOVE OR USE THIS ----> smooth(); <---- */
                                      //anti aliasing
                                      smooth(4);
    
                       /*PLEASE READ ABOVE, IF NOT ALREADY DONE SO*/
                       
     //initalize enemies, set amount of baddies on screen at the start, should be 49 
     for(int c=0;  c < col; c++ )
         {
           for (int r = 0; r < row; r++)
               {
                e1 [c][r] = new enemie(c*gap,r*gap,speed,20);
                }
         }
     
     
     
     //create fonts 
     f =  createFont("Nosifer-Regular.ttf", 32, true);
     //doesnt work but allows me to use a default text instead of the bloody style above 
       //new this didn't work, did it any way as did not have time to create font folder and faff about 
     ff =  createFont("Ariel", 18, true);
    
      //create me a new instance of player @  said place
                   //y position, size
     p = new player(765,40);
     
     //instance of all the cool graphics 
     graphics = new visual(600,0);
  }
  
  
void draw()
  {
    //updates background, keeps it fresh.  
      //sets the background position
         image(background,  0, 0);
    
    
      //how many enemie cols and rows 
       for(int c=1;  c < col; c++ )
           {
         for (int r = 1; r < row; r++)
             {
               
               //calls and draws the animation 
               e1[c][r].render();
               //sets the move pattern
               e1[c][r].move(); 
               //if shot will move enemie to set location
               e1[c][r].disapear();
                                        
               //if a enemie collides with player end game, negates reamining lifes        
              if(e1[c][r].crash(p))
                {
                  //sets game mode to CRASH
                  gameMode = CRASH;
                }                                     
             }//end of enemies on canvas
           }//end of enemies.
           
          
    /* ************************* * Bullets / water * ********************* */       
           
     //if i eqauls bullets and is greater than 0 take one from i, stops out of bound exception
    for (int i =  b.size()-1; i>=0; i--)
        {
          //gets new bullet
          bullet bullets = b.get(i);
          //draws new bullet on screen with random colour         
          bullets.render();
          //calls move sets bullets direction
          bullets.move();
          
             //limits player to number of bullets 
            if(b.size() == numberOfBullets)
              {
                b.remove(bullets);
              }
                //bullets will stop being draw at predefined height(bullet class)
                if(bullets.destroy())
                  {
                    b.remove(bullets);
                  }
                //kill them enemies + remove bullets that hit them.
                for(int q = 0; q < col; q++)
                  {
                  for(int w = 0; w < row; w++)
                    {
                      //if bullet hits enemies 
                      if(bullets.hit(e1[q][w]))
                        {
                          //remove the bullet 
                          b.remove(bullets);
                          //remove enemie
                         e1[q][w].kill();
                          //add one to level kill count 
                          killCount = killCount + 1;
                          //adds 5 points per kill and adds 1 to overall kill count
                          stat.totalKills();
                        }//end of if 
                    }//end of for row
                  }//end of for col          
        }//end of bullets
        
         /* ************************* * End of Bullets / water * ********************* */     
         
         /* ************************* * Bombs * ********************* */     
                     
      // shooot that player!! BOOM, BOOM
    for (int i =  e.size()-1; i >= 0; i--)
      {
        //get bombs
        bullet bomb =  e.get(i);
        //render bombs image
        bomb.bomb();
        //call move pattern
        bomb.move1();
        
            //limits number of bombs allowed depending on level
            if(e.size() == numberOfBombs)
              {
                //remove excess bombs
                e.remove(bomb);
              }//of bombs limiter 
              
             //if bombs reach bottom of screen
            if(bomb.destroyBomb())
              {
                //remove bombs
                e.remove(bomb);
              }//end of bombs destroy
          
          //if bomb hits player
          if(bomb.die(p))
            {
              //remove one life or end game
              stat.life();
              //remove bomb that hits player
              e.remove(bomb);
            }//end of bomb player detector 
      
      }// end of bombs 
      
      /* ************************* * Bombs * ********************* */ 
      
      /* ************************* * Game States * ********************* */ 
     
     
     //draw what is what when the game mode is set to normal 
          if(gameMode ==  NORMAL)
              {     
                //update player
                p.update();
                //draw sidebar
                graphics.render();
                //level and score
                stat.noramlText();
              }//end of whats whats normal, score and level
          
      //draw what happens when gameMode is equal to crash    
          if(gameMode == CRASH)
              {
                //remove them fires if player is == to crispy 
                for(int q = 0; q < col; q++)
                     {
                       for(int w = 0; w < row; w++)
                           {
                            //puts all rermaining fires into another plan of existence 
                            e1[q][w].endGame();
                            }//end row
                      }//end col
                 //clears bullets      
                 b.clear();
                 //clear bombs
                 e.clear();
                 //display crash text        
                 stat.crashText();
               }// end of game crash for 
               
     /* ************************* * Game States * ********************* */ 
     
     
     /* ************************* * Game Others * ********************* */ 
          
        
         
        //if level killcount is greater then 48 start new level 
         if ( killCount >  48)
            {
              //resets enemies, bullets, bombs and stats(some not all.)
             nextLevel();
            }
                      
             //disply stats no matter what the game state              
            stat.render();
}//end of draw
  
  //controls what happens on game restart
  void reset()
      {
        setup();
        killCount = 0;
        stat.restart();
        gameMode = NORMAL;
        speed = 1;
      }
      
      //controls what heppens at next level
      void nextLevel()
          {
            b.clear(); 
            e.clear(); 
            setup();
            killCount = 0;
            stat.bNumber();
            stat.level();
            gameMode = NORMAL;
          }
  
  void mouseClicked()
{
  
  
  //shoot water from player when moused clicked
  b.add(new bullet(p.x+19, p.y-10, 2));
  
              //if player shoots they get shot at.
                float r = random(0,590);
                    e.add(new bullet(r,-19,2));
                   
}// end of mouseClicked
  
  
  void keyPressed()
{
  if (key == CODED)
  {
    //move player left by 10px
    if (keyCode == LEFT && p.x>20)
      p.x-=10;
    //move player right by 10px
    if (keyCode == RIGHT && p.x<=560)
      p.x+=10;
    //reset
    if (keyCode == UP && gameMode == CRASH)
    {
      reset();
    }
  }
}