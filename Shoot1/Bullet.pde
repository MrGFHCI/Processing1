class Bullet {
  PVector vDir;
  PVector vPos;
  color cColour;
  float x, y;
  
  Bullet(PVector vPosStart, PVector vDir, color _c) {
    this.vPos = vPosStart.get();
    this.vDir = vDir.get();
    cColour = _c;
  }
 
  void update(){
    vPos.add(vDir);
  }
 
 void display(){
   noStroke();
   fill(cColour);
   ellipse(vPos.x, vPos.y, 3, 3);
  }
}
