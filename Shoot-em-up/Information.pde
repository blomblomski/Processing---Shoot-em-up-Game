
//more golbal varibles
int numberOfBullets = 11;
int numberOfBombs = 1;


//sets the sidebar in place
class visual
   {
     //varibles 
   int x;
   int y;
   //define image
   PImage sidebar;
   
   //constructor
   visual(int px, int py)
     {
       this.x=px;
       this.y=py;
       //load image into PImage array 
       sidebar = loadImage("sidebar_1.png");
     }
     
     
     void render()
         {
          
           //call image and set posistion
          image(sidebar, x,y);
        
         }
         
       
   }//end of visual class
   
   //stats class holds and performs calculations for the game
  class stats
       {
         //game level
          int level = 1;
          //how much water you can spray at once
          int realBullets = 10;
          //location varibles
          int x;
          int y;
          //how many have been slain 
          int totalKills = 0;
          //score 
          int score = 0;
          //game will increase speed after this marker
          int speedAdjust =3;
          //after this point the player will start to lose water
          int waterReduction = 5;
          //how many bombs can be dropped adjuster
          int bombAdjust = 1;  /*random(0,20);*/
          //player lifes
          int pLife = 2;
         /* int round =  int(bombAdjust);*/
         
          //stats constructor
         stats(int x, int y)
               {
                 this.x=x;
                 this.y=y;
               }
         
         
         
         //styles and places level and score on screen
         void noramlText()
           {
              textFont(f);  
                 fill(255,69,0);
                 //stroke(0);
                 textAlign(LEFT);
                 text("SCORE: " + score, 20, 40);
                 text("LEVEL: " + level, 330, 40);
                 //text("FINAL SCORE: " + killCount, 300, 600);
           }
           
           //place this stuff on screen when gameMode =  crash
           void crashText()
                 {
                  
                           //draws some fancy text on screen
                 textFont(f, 40);
                 textAlign(CENTER);
                 fill(138,7,7);
                 text("GAME OVER", 300, 200);
                     textFont(f);
                 fill(255,69,0);
                 text("FINAL SCORE: " + score, 300, 300);
                 text("FINAL LEVEL: " + level, 300, 400);
                 
                  
                 }
         
         //controls the number of shots the player can fire 
         void bNumber()
         {
           
           
           if (level == waterReduction)
           {
             numberOfBullets = numberOfBullets -1  ;
             realBullets = realBullets -1;
             waterReduction = waterReduction + 3;
            }
                   
                   
                  
            //controls the amount of bombs being fired at the player       
           if (level == bombAdjust)
                {
                  numberOfBombs = numberOfBombs +1;
                  bombAdjust =  bombAdjust + 3;
                  pLife = pLife +1;
                }     
                  
         }
         
         //controls player lifes, and ends game if player is out of lifes
         void life()
              {
        
                 if (pLife == 1)
                     {
                      gameMode = CRASH;
                     }else
                     {
                      pLife = pLife - 1;
                
                     }
               }
         
         
         //controls game level & game speed settings 
         void level()
         {
             level = level + 1;
             
             //if game level is eqaul to speedAdjust increase game speed
             if (level == speedAdjust)
                 {
                 speed = speed + 1;
                 speedAdjust = speedAdjust + 9; 
                 }         
         }
         
         //keeps track of kill and score
         void totalKills()
               {
                 totalKills =  totalKills + 1;
                   score = score +  5;
               }
               
               //shows game current stats 
         void render()
             {
                 textFont(ff);
                 fill(0);
                 textAlign(LEFT);
                 text("Water: " + realBullets, 620, 540);
                // text("W-L-L after: " + waterReduction, 620, 480);
                 text("Level kill count: " + killCount, 620,500);
                 text("Game Speed:  " +  speed, 620, 580);
                // text("G-S-I at:  " +  speedAdjust, 620, 520);
                 text("Total Kills:  " +  totalKills, 620, 460);
                // text("Bombs:  " +  realBombs, 620, 520);
                // text("B-I-L after:  " +  bombAdjust, 620, 560);
                 text("Lifes:  " +  pLife, 620, 620);
                 
             }
         
         //resets stats and settings back to first level
         void restart()
             {
               level = 1;
               totalKills = 0;
               score = 0;
               realBullets = 10;
               numberOfBullets =11;
               pLife = 2;
               bombAdjust = 1;  
               numberOfBombs = 1;
             }
         
       }