class Enemy extends PVector{
  PVector direction;
  color cColour;
  
  Enemy(PVector startPos, PVector direction, color _c){
    super(startPos.x, startPos.y);
    this.direction = direction.get();
    cColour = _c;
  }
  
  void display(){
    noStroke();
    fill(cColour);
    ellipse(x, y, 25, 25);
  }
  
  void moveTowards(PVector direction){
    this.direction = direction.get();
    add(direction);
  }
}
