

int gameScreen=0;
int ran;
int maxround=4;
int round=1;
int num=1;
int p1score=0;
int p2score=0;
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
  if (gameScreen == 0) { 
    initScreen();
  } else if (gameScreen == 1) { 
    gameScreen();
  } else if (gameScreen == 2) { 
    endScreen();
  }
}
void initScreen() {
  background(255,255);
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(70);
  text("Lucky Dice", width/2, height/2);
  textSize(15); 
  text("Click to start", width/2, height-30);
}
void gameScreen()
{
  if(round <= maxround)
  {
     if(round%2==0)
     {
       num=2;
     }
     else
     num=1;
     key(num);              
  }
  else
    gameScreen=2;
}
void endScreen()
{
  background(0,0);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(25);
  text("Player 1 Score: " + p1score, width/2, 100);
  text("Player 2 Score: " + p2score, width/2, 125);
  
  if(p1score>p2score)
  {
    text("Player 1 Won", width/2, 250);
  }
   else if(p1score<p2score)
   {
     text("Player 2 Won", width/2, 250);
   }
   else
   {
     text(" MATCH TIE", width/2, 250);
   }
  textSize(15);
  text("Click to Restart", width/2, 450);
}
int key( int player)    
{  
   
  background(255,255);
   if(player==1)
   { 
     textSize(15); 
     text("Player 1 Score: " + p1score, width/2, height-450);
     text("Player 2 Score: " + p2score, width/2, height-425);  
     text("Round Number: " +round, width/2, height-70);
     ran=int(random(1,7));
     roll(ran);                         
      if (keyCode == LEFT) 
      { p1score=p1score+ran;
        round=round+1;   
      }
   }
   else if(player==2)
   {  
     textSize(15); 
     text("Player 1 Score: " + p1score, width/2, height-450);
     text("Player 2 Score: " + p2score, width/2, height-400);
     text("Round Number: " +round, width/2, height-50);
      ran=int(random(1,7));
     roll(ran);                
      if (keyCode == RIGHT) 
      {  p2score=p2score+ran;
         round=round+1;
      }
   }
   return player;                             
}
int roll( int num)            
{
  if (ran == 1)
    {
      circle(width/2, height/2, 50);
    }
    if (ran == 2)
    {
      circle(150, 150, 50);
      circle(width-150, height-150, 50);
    }
    if (ran == 3)
    {
      circle(width-150, height/2, 50);
      circle(150, height/2, 50);
    }
    if (ran == 4)
    {
      circle(150, 150, 50);
      circle(width-150, height-150, 50);
      circle(width-150, 150, 50);
      circle(150, height-150, 50);
    }
    if (ran == 5)
    {
      circle(width/2, height/2, 50);
      circle(150, 150, 50);
      circle(width-150, height-150, 50);
      circle(width-150, 150, 50);
      circle(150, height-150, 50);
    }
    if (ran == 6)
    {
      circle(150, 150, 50);
      circle(width-150, height-150, 50);
      circle(width-150, 150, 50);
      circle(150, height-150, 50);
      circle(width-150, height/2, 50);
      circle(150, height/2, 50);
    }
  return num;
}
void mousePressed() {
 
  if (gameScreen==0) {
    gameScreen =1;
  }
  if (gameScreen==2) {
    //gameScreen =0;
    reset();
  }
}
void reset()
{
gameScreen=0;
//ran;
maxround=4;
round=1;
num=1;
p1score=0;
p2score=0;
}
 
