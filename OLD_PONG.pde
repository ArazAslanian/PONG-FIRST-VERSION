void setup() {
  size(700, 700);
}

//GLOBAL VARIABLES
Wave [] w = new Wave[100000];

// counter for the array
int counter = 0;     
int startcount;

//determines whether the game should restart or not
boolean restart = false;

//Specifies the height and width of the sketch
float heightV = 700;
float widthV = 700;

//boolean to differentiate between right and left players
boolean right = true;
boolean left = false;
boolean rightWinner = false;
boolean leftWinner = false;

//initiates the left and right player objects
Paddle pRight = new Paddle(right);
Paddle pLeft = new Paddle(left);

// initiates the ball object
Ball ball = new Ball(pRight, pLeft);

void draw() {
  //DRAW BASIC BACKGROUND
  frameRate(60);
  background(0);

  // DRAW WAVES every 15 milliseconds
  if (millis()%15 == 0) {
    //attempt to make sketch run smoother
    w[counter] = new Wave(random(200));  
    counter+=1;
  }
  //only draws 5 waves maximum at a time
  if (counter>=5) {
    startcount = counter-5;
  } else {
    startcount = 0;
  }
  // displays and makes the waves grow and disappear
  for (int i = startcount; i<counter; ++i) {
    w[i].size+=20;
    if (w[i].disappear >0 ) {
      --w[i].disappear;
      w[i].display();
    }
  }

  // midLine
  pushStyle();
  for (int i = 0; i<height; i+=3)
  {
    fill(255);
    noStroke();
    ellipse(width/2, i, 2, 2);
  }
  popStyle();

  // draw the players and the ball
  if (ball.restart == false) {
    pRight.display();
    pRight.move();
    pLeft.display();
    pLeft.move();
    ball.display();
    ball.move();
  }

  // restart game if ball is not caught
  if (ball.restart)
    //SCORE CHECK
  {// check which player won
    if (pRight.score>pLeft.score) {
      rightWinner = true;
      leftWinner = false;
    }
    else if (pLeft.score>pRight.score) {
      leftWinner =true;
      rightWinner = false;
    } else{
      leftWinner = true;
      rightWinner = true;
    }

    // IF THE RIGHT PLAYER WINS

    if (rightWinner == true && leftWinner == false) {
      //LEFT PLAYER MESSAGE
      pushMatrix();
      translate(0.25* width, height/2);
      rotate(PI/2);
      textSize(45);
      text("YOU LOSE :(", 0, 0);
      popMatrix();
      pushMatrix();
      translate(0.75*width, height/2);
      rotate(-PI/2);
      textSize(45);
      text("YOU WIN :)", 0, 0);
      popMatrix();
      rightWinner = false;
      leftWinner = false;
    }
    //IF THE LEFT PLAYER WINS
    if (leftWinner == true && rightWinner == false) {
      //LEFT PLAYER MESSAGE
      pushMatrix();
      translate(0.25* width, height/2);
      rotate(PI/2);
      textSize(45);
      text("YOU WIN :)", 0, 0);
      popMatrix();
      pushMatrix();
      translate(0.75*width, height/2);
      rotate(-PI/2);
      textSize(45);
      text("YOU LOSE :(", 0, 0);
      popMatrix();
      rightWinner = false;
      leftWinner = false;
    }

    //THE TIE
    if (rightWinner == true && leftWinner == true) {
      //LEFT PLAYER MESSAGE
      pushMatrix();
      translate(0.25* width, height/2);
      rotate(PI/2);
      textSize(45);
      text("IT'S A TIE ", 0, 0);
      popMatrix();
      pushMatrix();
      translate(0.75*width, height/2);
      rotate(-PI/2);

      textSize(45);
      text("IT'S A TIE", 0, 0);
      popMatrix();
      rightWinner = false;
      leftWinner = false;
    }
  }
  // draw the score
  textSize(30);
  text(pLeft.score, width/2 -(width/12), 30);
  text(pRight.score, width/2 + (width/12)- pRight.pWidth/2, 30);
  if (keyPressed) {
    if (ball.restart == true) {
      // reset the score
      rightWinner = false;
      leftWinner = false;
      pRight.score = 0;
      pLeft.score = 0;
    }
    ball.restart = false;
  }
}

void keyPressed() {
  //PLAYERS' MOVEMENT
  switch(keyCode) {
  case LEFT:
    pRight.moveDOWN= true;
    break;
  case RIGHT:
    pRight.moveUP= true;
    break;
  }
  switch(key) {
  case 'a':
    pLeft.moveUP = true;
    break;
  case 'd':
    pLeft.moveDOWN = true;
    break;
  case ' ':
    delay(20);
    saveFrame();
  }
}


void keyReleased() {
  //STOPPING THE MOVEMENT
  switch(keyCode) {
  case LEFT:
    pRight.moveDOWN= false;
    break;
  case RIGHT:
    pRight.moveUP= false;
    break;
  }
  switch(key) {
  case 'a':
    pLeft.moveUP = false;
    break;
  case 'd':
    pLeft.moveDOWN = false;
    break;
  }
}

//Nadine and Araz