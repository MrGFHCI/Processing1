class Player{
  int nX, nY, nW, nH, nC;
  Player(int _x, int _y, int _w, int _h, color _c){
    nX = _x;
    nY = _y;
    nW = _w;
    nH = _h;
    nC = _c;
  }
  
  void display(){
    noStroke();
    fill(nC);
    rect(nX, nY, nW, nH);
  }
  
  void move(int dX, int dY){
    nX += dX;
    nY += dY;
  }
}
