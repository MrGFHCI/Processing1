PImage BackGround, PixelPeter, MrBlueBerryPenguin, PixelPeterL;
PImage PHitBox = createImage(250, 30, RGB);
//PImage Enemy, EnemyHit;
float fX = 100, fY = 380;
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape
float ntrack=200, nchase=100;
float fEX=500, fEY=450, fEX2=500, fEY2=450;
float nDist;
int nMoveCount=0, nMoveRight=1, nMaxMove=50, nSearchC=0;
int i, i2;
int nBoarderX=1000, nBoarderY=536;
boolean bJump=false, bIsLeft=false, bPlayerFound=false, bAttack=false;
void setup() {
  //sets the image "BackGround" to the file
  BackGround = loadImage("BackGround.jpg");
  PixelPeterL=loadImage("pixel peterL.png");
  PixelPeter = loadImage("pixel peter.png");
  MrBlueBerryPenguin = loadImage("Mr.BlueBerry penguin.png");
  // sets the size of window (same size as the background image).
  size(nBoarderX, nBoarderY);
  BackGround.resize(nBoarderX, nBoarderY);
}

void draw() {
  imageMode(CENTER);
  background(BackGround);
  rectMode(CENTER);
  noTint();
  //Checks which way the player is facing
  if (bIsLeft==false) {
    image(PixelPeter, fX, fY);
  } else if (bIsLeft==true) {
    redraw();
    image(PixelPeterL, fX, fY);
  }
  //loads in a box, that is used for hit boxing
  PHitBox.loadPixels();
  for (int i = 0; i < PHitBox.pixels.length; i++) {
    //noFill();
    noStroke();
    tint(0, 0);
    PHitBox.pixels[i] = color(0, 90, 102);
  }
  PHitBox.updatePixels();
  image(PHitBox, fEX2, fEY2);
  Enemy();
  FirstPlayerMovement();
}

//ENEMY STUFF
void Enemy() {
  rect(fEX, fEY, 30, 30);
if (isRed(fX, fEX2, PixelPeter)) {
      //RED
      bAttack=true;
      bPlayerFound=true;
      fill(#E80707);
    } else if (isYellow(fX, fEX2, PixelPeter)) {
      //YELLOW
      bPlayerFound=true; 
      fill(#D3CA13);
    } else {
      //GREEN
      bPlayerFound=false; 
      fill(#13A002);
    }
  EnemyMove();
}
void EnemyMove() {
  if (bPlayerFound==false) {
    if (nMoveCount!=nMaxMove&&nMoveRight==1) {
      fEX++;
      fEX2++;
      nMoveCount++;
    }
    if (nMoveCount!=nMaxMove&&nMoveRight==-1) {
      fEX--;
      fEX2--;
      nMoveCount++;
    }
    if (nMoveCount==nMaxMove) {
      nMoveCount=0;
      nMoveRight*=-1;
      nMaxMove+=50;
      nSearchC++;
      println("Finished round:", nSearchC);
    }
    if (nSearchC==5) {
      nMaxMove=50;
      nSearchC=0;
      println("Restarting rounds");
    }
  } else {
    println("PLAYER FOUND");
    if ((fX<fEX2)&&(fX+PixelPeter.width>fEX2-155)) {
      fEX--;
      fEX2--;
    } else if ((fX>fEX2)&&(fX<fEX2+155)) {
      fEX++;
      fEX2++;
    }
  }
  if(bAttack==true){
   println("HA TAKE THIS!"); 
  }
}
//Checks if you are within warning range
boolean isYellow(float fX, float fEX2, PImage pPlayer) {
  int nH;
  nH=pPlayer.width;
  if ((fX<fEX2)&&(fX+nH>fEX2-155)||(fX>fEX2)&&(fX<fEX2+155)) {
    return (true);
  } else {
    return (false);
  }
}
//Checks if you are within attacking range
boolean isRed(float fX, float fEX2, PImage pPlayer) {
  int nH;
  nH=pPlayer.width;
  if ((fX<fEX2)&&(fX+nH>fEX2-75)||(fX>fEX2)&&(fX<fEX2+75)) {
    return (true);
  } else {
    return (false);
  }
}

//PLAYER MOVEMENT
void FirstPlayerMovement() {
  if (keyPressed) {
    if (bJump==false) {
      if (key == 'w') {
        for (i=0; i<60; i++) {
          fY=fY-(yspeed*1);
        }
        bJump=true;
      }
    }
    if (key == 's') {
      fY++;
    }
    if (key == 'd') {
      xspeed=2.8;
      fX=fX+(xspeed*1);
      bIsLeft=false;
    }
    if (key == 'a') {
      xspeed=2.8;
      fX=fX-(xspeed*1);
      bIsLeft=true;
    }
    if (key=='c') {
      bIsLeft=false;
      xspeed=5.8;
      fX=fX+(xspeed*1);
    }
    if (key=='z') {
      bIsLeft=true;
      xspeed=5.8;
      fX=fX-(xspeed*1);
    }
    //println("X: " + fX + " Y: " +fY);
  }
  if (fY>=180) {
    fY=fY+(yspeed*1.5);
    i=0;
  }
  if (fY>=431) {
    fY=430; 
    bJump=false;
  }
  if (fX<=42) {
    fX=43;
  } else if (fX>=919) {
    fX=917;
  }
}

