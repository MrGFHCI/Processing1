// In this version, I will randomly put some targets on the window.
// the targets will be put in an array of Sprites.
// I will add collision detection so that a bullet can destroy a target.
// I did NOTHING to the isHit function that I copied from http://2oip.sgrondin.ca/ss07/Sprite.html

Sprite player;
Sprite b; // for bullet
Sprite z;
ArrayList <Sprite> alZ = new ArrayList <Sprite> ();
int nDx, nDy, nX, nY;
boolean bShoot= false;

void setup() {
  size(800, 800);
  frameRate(120);
  noCursor();
  player = new Sprite("penguin.png", 10, 10, 50);
  for (int i=0; i<5; i++) {
    nX = int(random(width));
    nY = int(random(height));
    z = new Sprite("zombie.jpg", nX, nY, 50);
    alZ.add(z);
  }
}

void draw() {
  player.update(nDx, nDy);

  /* Bullets */
  PVector vPosPlayer = new PVector(player.nX + (player.nW/2), player.nY + (player.nH)/2);
  PVector vPosMouse = new PVector(mouseX, mouseY);
  if (frameCount % 15 == 0 && mousePressed) {
    PVector vDir = PVector.sub(vPosMouse, vPosPlayer);
    vDir.normalize();
    vDir.mult(4); //Move speed of bullet
    b = new Sprite("bullet.jpg", vPosPlayer, vDir, 5);
    //bullets.add(b);
    bShoot = true;
  }

  /* Check Bounds */
  if (player.nX + player.nW > width) player.nX = width - player.nW;
  else if (player.nX < 0) player.nX = 0;
  if (player.nY + player.nH > height) player.nY = height - player.nH;
  else if (player.nY < 0) player.nY = 0;

  /* Draw things */
  background(0); //New canvas boi~
  if (bShoot) {
    b.updateV();
  }

  player.update();
  drawCursor();
  //for (Sprite z : alZ) {
  for (int i = 0; i<alZ.size (); i++) {
    z= alZ.get(i);
    z.update();
    if (bShoot) {

      if (isHit(z, b)) {
        alZ.remove(i);
      }
    }
  }
}

void keyPressed() {
  if (key == 'w') { 
    nDy = -1;
  } else if (key == 'a') { 
    nDx = -1;
  } else if (key == 's') { 
    nDy = 1;
  } else if (key == 'd') { 
    nDx =1;
  }
}
void keyReleased() {
  nDx = 0;
  nDy = 0;
}
void drawCursor() {
  stroke(0);
  strokeWeight(3);
  line(mouseX, mouseY + 10, mouseX, mouseY - 10);
  line(mouseX + 10, mouseY, mouseX - 10, mouseY);
  stroke(255);
  strokeWeight(1);
  line(mouseX, mouseY + 10, mouseX, mouseY - 10);
  line(mouseX + 10, mouseY, mouseX - 10, mouseY);
}

boolean isHit(Sprite one, Sprite two) { // I only have to pass the hero, since it stores all the required information.
  //int nX1, nY1, nX2, nY2, nH1, nW1, nH2, nW2;
  int nH1, nW1, nH2, nW2, nX1, nY1, nX2, nY2;
  nX1 = one.nX;
  nY1 = one.nY; 
  nX2 = two.nX;
  nY2 = two.nY;
  //int nTop1, nBot1, nLeft1, nRight1, nTop2, nBot2, nLeft2, nRight2;
  nH1 = one.img.height; // this is how I get the width and height from the class file
  nW1 = one.img.width;
  nH2 = two.img.height;
  nW2 = two.img.width;
  if (
  ( ( (nX1 < nX2) && (nX1+nW1 > nX2) ) ||
    ( (nX1 > nX2) && (nX1 < nX2+nW2) ) )
    &&
    ( ( (nY1 < nY2) && (nY1+nH1 > nY2) ) ||
    ( (nY1 > nY2) && (nY1 < nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}

