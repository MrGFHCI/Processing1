// I turned the player into a sprite. I grabbed Julia's penguin image as the player.
// I wanted to turn the player into an image Sprite in order to standardize collision detection in a later version.

Sprite player;
color cTrail;
int nDx, nDy;
Bullet b;
boolean bShoot= false;

void setup() {
  size(800, 800);
  frameRate(120);
  noCursor();
  player = new Sprite("penguin.png", 10,10,50);
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
    b = new Bullet(vPosPlayer, vDir, 255);
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
    b.update();
    b.display();
  }

  player.update();
  drawCursor();
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

