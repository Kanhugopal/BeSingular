//////////////////////////BESINGULAR ACADEMY////////////////////////////////
/////////////////////////// BRICK BREAKER //////////////////////////////////
///////////////////////// DATE:- 07/10/2022/////////////////////////////////
////////////////////////BY :- KANHUGOPAL DUTTA//////////////////////////////


/*****This code is for a game game named "brick breaker" in which there are 
****array of bricks at the top and a paddle at the bottom and there is ball 
***which will move vertically in the screen. Evert time the ball will hit a
****brick the bricks will get dissappeared and when the ball will touch the 
********paddle it it will bounce back. Here there are three rounds.*******/


////   variables   ////

int numBrickRows = 10;
int brickWidth = 100;
int brickHeight = 20;
int paddleHeight = brickHeight;
int paddleWidth = int(brickWidth*1.1);
int ballDiameter = 20;
int round = 1;
int maxround = 3;
Brick[] bricks = new Brick[0];
Paddle myPaddle;
Ball myBall;

//////   setup function

void setup() {
  size(400, 500);
  smooth();
  // place bricks
  for (int j=0; j < numBrickRows; j++) {                 // rows
    int y = brickHeight / 2 + j * brickHeight;           //location of each row
    int offset = 0;                                      
    if (j % 2 == 0) {                                   
      offset = brickWidth / 2;
    }
    
    // for drawing the row
    for (int i=offset; i < width+brickWidth/2.0; i += brickWidth) {                      // columns
      bricks = (Brick[]) append(bricks, new Brick(i, y));
    }
  }
  myPaddle = new Paddle();                         // create paddle
}
void draw() {                                      //draw() function
  background(255);
  for (int i=0; i < bricks.length; i++) {
    if (bricks[i] != null) {
      bricks[i].draw();
    }
  }
  
  
    // draw and update ball//////////////////////////////////
    
    
  if (myBall != null) {
    myBall.draw();                                                                        ////////////////////////////////////////////////////
    myBall.update();
   
  }
 int temp = round - 1;
 textSize(15);
 text ("max round: 3", 30, height- 80);
 text("round no: "+temp, 30, height - 50);
 
  // draw paddle//////////////////////////////
  myPaddle.display();
  if (myBall != null && myPaddle.impact(myBall)) {
    myBall.bounce();                                // For bouncing ball
    myPaddle.speedOfBall(myBall);
  }
  
  
  
  // is ball touching the bricks or not//////////////////
  
  
  if (myBall != null) {
    for (int i=0; i < bricks.length; i++) {
      if (bricks[i] != null && bricks[i].impact(myBall) == true) {
        myBall.bounce();
        bricks[i] = null;
      }
    }
  }
  if (myBall != null && myBall.yPosition-ballDiameter/2 < 0) {
    myBall.bounce();    // bounce ball
  }
  if (myBall != null && myBall.yPosition-ballDiameter/2 > height) {
    myBall = null;       // for deleting brick
  }
  
}

/** MouseClicked function, which fires a new ball */

void mousePressed() {
  if (round <= maxround) {               // for checking rounds
    if (myBall == null) {                // for creating new ball
      myBall = new Ball(myPaddle.xPos, height - paddleHeight - ballDiameter/2, 0, -2);        //-------------------------------------------------------------------------------------
      round = round +1;
    }
  } else
  {
    textSize(30);
   text("GAME OVER !", width/2, height/2);
    
  }
}

//The ball for the BrickBreaker game
 
class Ball {
  int xPosition;
  int yPosition;
  int xSpeed ;
  int ySpeed ;

  Ball(int x, int y, int xInitialSpeed, int yInitialSpeed) {
    xPosition = x;
    yPosition = y;
    xSpeed = 2;
    ySpeed = 3;
  }
  
  //  draw the ball
  
  void draw() {
    fill(0);
    ellipse(xPosition, yPosition, ballDiameter, ballDiameter);
  }
  
   /** Updates the position of the ball, including bounces off of verticals */
  void update() {
    
    // update position
    xPosition += xSpeed;
    yPosition += ySpeed;
    if (xPosition < 0 || xPosition > width) {
      xSpeed *= -1;
    }
  }
  void bounce() {
    ySpeed *= -1;
  }
}

//////////////////////////////////////////
/** Represents a brick in the game */

class Brick {
  int xPosition;
  int yPosition;
  color c;

  Brick(int x, int y) {
    xPosition = x;
    yPosition = y;
    c = color(random(255), random(255), random(255));
  }
  
   /** Draws the brick */
   
  void draw() {
    rectMode(CENTER);
    fill(c);
    rect(xPosition, yPosition, brickWidth, brickHeight);
  }
  
  
  /** Detects whether the ball b impacted the brick
   * b - the ball to test
   * returns true if there was an impact, false otherwise
   */


  boolean impact(Ball b) {
    if (xPosition - brickWidth/2 <= b.xPosition &&
      b.xPosition <= xPosition + brickWidth/2 &&
      yPosition + brickHeight/2 > b.yPosition-ballDiameter/2)
      return true;
    else
      return false;
  }
}


//////////////////////////////////////////
/** Represents the paddle in the game */

class Paddle {
  int xPos = mouseX;
  int yPos = height - paddleHeight/2;
  int xPosPrevious;

  void display() {            // for displaying the paddle
    fill(0);
    xPosPrevious = xPos;
    xPos = mouseX;
    rect(xPos, yPos, paddleWidth, paddleHeight);
  }
  
    /** Detects whether the ball impacted the paddle
   * b - the ball to test for impact
   * returns whether there was an impact or not
   */

  boolean impact(Ball b) {
    if (xPos - paddleWidth/2 <= b.xPosition &&
      b.xPosition <= xPos + paddleWidth/2 &&
      yPos - paddleHeight/2 < b.yPosition+ballDiameter/2)
      return true;
    else
      return false;
  }

//  for impacting the speed of the ball with respect to paddle speed

  void speedOfBall(Ball b) {
    int xVector = xPos - xPosPrevious;
    b.xSpeed += xVector;
  }
}
