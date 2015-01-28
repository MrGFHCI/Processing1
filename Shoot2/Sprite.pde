class Sprite {
  public int nX, nY, nDx, nDy, nW, nH,nSize;
  String sFile;
  PImage img;
  Sprite( String _sFile, int _nX, int _nY, int _nSize) {
    nX = _nX;
    nY = _nY;    
    nSize = _nSize;
    nW = nSize;
    nH = nSize;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nSize, nSize);
  }
  public void update(int _nDx, int _nDy) {
    nDx = _nDx;
    nDy = _nDy;
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
  }
  // overload update just in case I don't have to change coordinates.
  public void update() {
    image(img, nX, nY);
  }
} 

