class Wave {
  
  //CLASS VARIABLES
  float size;
  float disappear = 30;
  float posX = random(widthV);
  float posY = random(heightV);
  float xstart = random(100000);
  float ystart = random(100000);
  
  //CONSTRUCTOR
  Wave(float size_) {
    size = size_;
  }
  
  //CLASS FUNCTIONS
  void display() {
    pushStyle();
    color y = color(245, 243, 131);
    color pp = color(234, 46, 73);
    color p = color(255, 17, 184);
    color green = color(0, 240, 51);
    stroke(p, disappear);
    strokeWeight(15);
    noFill();
    ellipse(posX-40, posY, size, size);
    ellipse(posX-40, posY+40, size, size);
    ellipse(posX+40, posY-40, size, size);
    ellipse(posX+40, posY+40, size, size);
    ellipse(posX-40, posY-40, size, size);
    ellipse(posX, posY-40, size, size);
    ellipse(posX+40, posY, size, size);
    ellipse(posX, posY+40, size, size);
    ellipse(posX, posY, size, size);
    ellipse(posX-25, posY, size, size);
    ellipse(posX, posY+25, size, size);
    popStyle();
  }

  void grow() {
    //INCREMENTS SIZE AND DISAPPEAR VARIABLES 
    size++;
    disappear--;
    pushStyle();
    noStroke();
    //fill(245, 243, 131, 50);
    popStyle();
  }
}