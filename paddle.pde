class Paddle {

  //CLASS VARIABLES
  
  //HEIGHT AND WIDTH VARIABLES
  float pWidth = 20;
  float pHeight = 100;
  
  // INITIAL POSITIONS
  float x;
  float yInitial = heightV/2 -pHeight/2; 
  
  // Y POSITIONS DUE TO MOTION
  float y;
  
  // BOOLEAN TO SPECIFY IF SHOULD BE DRAWN ON RIGHT OR LEFT
  boolean rightPlayer;
  
  //VARIABLES CONTROLLING MOTION 
  float speed = 10;
  boolean moveUP = false;
  boolean moveDOWN= false;
  
  //SCORES OF THE PLAYERS
  int score = 0;

  //CONSTRUCTOR
  Paddle(boolean rightPlayer_) {
    //X POSITION DETERMINED ACCORDING TO WHETHER IT IS THE LEFT OR RIGHT PLAYER
    rightPlayer = rightPlayer_;
    if (rightPlayer) {
      x=widthV - pWidth/2-12;
      ;
    } else {
      x =pWidth/2 +12;
    }
    y = yInitial;
  }
  
  //FUNCTIONS
  void display() {
    // CONSTRAIN PADDLE TO SKETCH
    y = constrain(y, -pHeight/2, heightV-pHeight/2);
    
    //DRAWS THE PADDLE WITH FADE
    for (int fade = 0; fade<5; ++fade) {
      for (int i = 0; i<30; ++i) {
        pushStyle();
        noStroke();
        //stroke(255, 100- map(fade, 0, 5, 0, 80));
        //stroke(0, 240, 51, 100- map(fade, 0, 5, 0, 80));
        rectMode(CENTER);

        //fill(206, 0, 124, 100- map(fade, 0, 5, 0, 80));
        fill(255, 100- map(fade, 0, 5, 0, 80));
        ellipse(x, y+map(i, 0, 30, 0, pHeight), pWidth/3 +map(fade, 0, 5, 0, 50/1.5), pWidth+map(fade, 0, 5, 0, 50));
        //rect(x, y, pWidth/3 +map(fade, 0, 5, 0, 50/1.5), pHeight+2*map(fade, 0, 5, 0, 10), 7);
        popStyle();
      }}
    }
  

  void move() {
    if (moveUP) {
      y-=speed;
    }
    if (moveDOWN) {
      y+=speed;
    }
  }}