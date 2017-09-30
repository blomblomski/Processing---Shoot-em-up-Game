
//define player image
PImage fireFighter;

//playe class
class player{
  
  //location varibles
int x = 300;
int y;
//player size
int size;



    
//constructor
  player(int py, int ps)
  {
    //this.x = px;
    this.y = py;
    this.size = ps;
    fireFighter = loadImage("firefighter_PNG15908.png");
  }
  

//set player image and declare varibles to be used
void render()
{
  //float mx = constrain(mouseX, width-200, width-20);
 /*   fill(play);
  rect(x+1,y,size,size);
  rect(x+8,y-10,size/3,size/3);*/
  
   image(fireFighter,x,y);
  fireFighter.resize(size,size);
}
  
//called to draw 
void update()
{
  render();
}
}