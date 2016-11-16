
class Ball {

  //CLASS VARIABLES
  //initial positions
  float x= widthV/2;
  float y= heightV/2;

  float xspeed = 7;
  float yspeed = 7;

  // booleans for motion
  boolean restart = false;
  boolean moveRight = false;
  boolean moveLeft = true;
  boolean moveUp = false;
  boolean moveDown = false;

  //controls the direction of motion through an array
  int [] dirArray = new int[3];
  {
    dirArray[0] = 1;
    dirArray[1] = -1;
  }
  // chooses the initial direction at random
  int dir = dirArray[int(random(1, 2))-1];

  // the player objects that the ball takes
  Paddle playerRight, playerLeft;

  //CONSTRUCTOR
  Ball(Paddle playerRight_, Paddle playerLeft_) {

    playerRight = playerRight_;
    playerLeft = playerLeft_;
  }

  //FUNCTIONS
  void display() {
    pushStyle();
    noStroke();
    if (y<20) {
      dir*=-1;
    }
    if (y>height-20) {
      dir*=-1;
    }
    x = constrain(x, 0, widthV);
    if (x == 0 || x == widthV) {
      restart = true;
      // if ball is missed 
      // reposition ball at the middle of the screen
      x = widthV/2;
      y = heightV/2;
      //replace the paddles at their initial positions
      playerRight.y = playerRight.yInitial;
      playerLeft.y = playerLeft.yInitial;
    }  
    if (moveLeft) {
      //println("left");
      x-=xspeed;
      y+=yspeed*dir;
    }
    if (moveRight) { 
      //println("right");
      x+= xspeed;
      y+= yspeed*dir;
    }
    // gives fade out look of ball
    for (int fade = 0; fade<50; ++fade) {
      fill(255, 100 - map(fade, 0, 20, 0, 80));
      //fill(0, 240, 51, 100 - map(fade, 0, 20, 0, 90));
      ellipse(x, y, map(fade, 0, 20, 0, 40), map(fade, 0, 20, 0, 40));
    }
    popStyle();
  }
  void move() {
    // specifies when the ball is recieved and should reflect back
    if (abs(x-playerRight.x) <=10 && (playerRight.y- y<15 && playerRight.y- y>=-115)) {
      moveRight = false;
      moveLeft = true;
      ++playerRight.score;
    }
    if (abs(x-playerLeft.x) <=10 && (playerLeft.y- y<15 && playerLeft.y- y>=-115)) {
      moveRight = true;
      moveLeft = false;
      ++playerLeft.score;
    }
  }}