class Sprite {
  public int nX, nY, nDx, nDy, nW, nH, nSize;
  String sFile;
  PImage img;
  PVector vDir;
  PVector vPos;
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
  // creating a separate Sprite constructor for the bullet

  Sprite(String _sFile, PVector _vPos, PVector _vDir, int _nSize) {
    sFile = _sFile;
    nSize = _nSize;
    img = loadImage(sFile);
    img.resize(nSize, nSize);
    this.vPos = _vPos.get();
    this.vDir = _vDir.get();
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
  // to update a Sprite that stores vectors
  public void updateV() {
    vPos.add(vDir);
    image(img, vPos.x, vPos.y);
  }
} 

