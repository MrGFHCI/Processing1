class BackGround {
  int nX = 700, nY = 200, nDeltaX = 3;
  PImage imgBackGround;
  boolean isOffScreenR, isOffScreenL;


  BackGround() {
    imgBackGround = loadImage("BackGround.jpg");
  }
// when the A and W key are pressed the back ground is translated to the left or the right to simulate movement 
  void Movement() {
    if (keyPressed) {
      if (key == 'a') {
        nX += nDeltaX;
      }
      if (key == 'd') {
        nX -= nDeltaX;
      }
    }
  }
  // checks if the current background image is at the end of the window on the right 
  boolean isEndR(PImage img) {
    if ((nX + 700) < 1200) {
      return true;
    }
    return false;
  }
  // checks if the current background image is at the end of the window on the left
  boolean isEndL(PImage img) {
    if ((nX - 700) > 0) {
      return true;
    }
    return false;
  }
// if the current background image moves off the screen (checked my the isEnd L and R functions it redraws the background to fill the empty space)
  void ReDraw(PImage img) {
    isOffScreenR = isEndR(img);
    isOffScreenL = isEndL(img);

    if (isOffScreenR == true) {
      nX = (nX + 1400);
    }
    if (isOffScreenL == true) {
      nX = (nX - 1400);
    }
  }
}

