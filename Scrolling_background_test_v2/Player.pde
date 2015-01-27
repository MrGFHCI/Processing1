class Player {

  BackGround backGround;
  PImage imgCurrent;
  PImage imgStandingR[] = new PImage[4];
  PImage imgStandingL[] = new PImage[4];
  PImage imgWalkingR[] = new PImage[4];
  PImage imgWalkingL[] = new PImage[4];
  boolean isRight, isGrounded = true, framecount;
  int nX, nY = 400, nDeltaX, nDeltaY, nJumpHeight;
  int i = 0;
  int nCount = 0;

  Player() {
    nDeltaX = 0;
    nDeltaY = 0;
    imageMode(CENTER);
    backGround = new BackGround();
    isRight = true;
    nX = 600;
    nY = 320;
    nJumpHeight = 150;
  }

  void InitalizeImages() {
    // standing Right Images
    imgStandingR[0] = loadImage("Julian_Standing_R_f1.png");
    imgStandingR[1] = loadImage("Julian_Standing_R_f2.png");
    imgStandingR[2] = loadImage("Julian_Standing_R_f3.png");
    imgStandingR[3] = loadImage("Julian_Standing_R_f4.png");
    //standing Left Images 
    imgStandingL[0] = loadImage("Julian_Standing_L_f1.png");
    imgStandingL[1] = loadImage("Julian_Standing_L_f2.png");
    imgStandingL[2] = loadImage("Julian_Standing_L_f3.png");
    imgStandingL[3] = loadImage("Julian_Standing_L_f4.png");
    // Walking Right Images
    imgWalkingR[0] = loadImage("Walking_R_f1.png");
    imgWalkingR[1] = loadImage("Walking_R_f2.png");
    imgWalkingR[2] = loadImage("Walking_R_f3.png");
    imgWalkingR[3] = loadImage("Walking_R_f4.png");
    // Walking Left Images
    imgWalkingL[0] = loadImage("Walking_L_f1.png");
    imgWalkingL[1] = loadImage("Walking_L_f2.png");
    imgWalkingL[2] = loadImage("Walking_L_f3.png");
    imgWalkingL[3] = loadImage("Walking_L_f4.png");
  }
  // checks what key is being pressed and sets booleans accordingly 
  void GetAction() {
    if (keyPressed) {
      if (isGrounded) {
        if (key == 'w') {
          Jump();
          isGrounded = false;
          Gravity();
        }
      }
      if (key == 'a') {
        isRight = false;
      }
      if (key == 'd') {
        isRight = true;
      }
    }
  }

  // checks booleans populated in KeyPressedthe GetAction function and returns images accordingly 
  PImage getImage() {
    // standing right animation
    if (isRight && keyPressed != true && isGrounded == true) {
      if (framecount) {
        i++;
        if (i == 4) {
          i = 0;
        }
      }
      imgCurrent = imgStandingR[i];
    }


    // standing left animation
    if (isRight == false && keyPressed != true && isGrounded == true) {
      if (framecount) {
        i++;
        if (i == 4) {
          i = 0;
        }
      }
      imgCurrent = imgStandingL[i];
    }

    //Walking Right Animations
    if (isRight == true && keyPressed == true && key == 'd' && isGrounded) {
      if (framecount) {
        i++;
        if (i == 4) {
          i = 0;
        }
      }
      imgCurrent = imgWalkingR[i];
    }

    //walking Left Animations
    if (isRight != true && keyPressed == true && key == 'a' && isGrounded) {
      if (framecount) {
        i++;
        if (i == 4) {
          i = 0;
        }
      }
      imgCurrent = imgWalkingL[i];
    }

    return imgCurrent;
  }
  // makes the players jump by nJumpHeight
  void Jump() {
    nY -= nJumpHeight;
  }
  // makes the players Y cordinate constantly move towards the ground unless they are standing on the ground
  void Gravity() {
    nY += 2;

    if (nY >= 325) {
      isGrounded = true;
    }
  }
}

