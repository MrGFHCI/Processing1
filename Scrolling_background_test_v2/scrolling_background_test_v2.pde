BackGround backGround;
Player player;
void setup() {
  size(1200, 400);
  backGround = new BackGround();
  player = new Player();
  //frameRate(120);
}
void draw() {
  // sets the boolean framecount in the player class to true when the frame count % 6 is equil to 0
  player.framecount = frameCount % 6 == 0;
  // populates the images with in the player class
  player.InitalizeImages();
  // calls the movement animation function in the player class 
  player.GetAction();
  // calls the movement function in the background class 
  backGround.Movement();
  // calls the redraw function from the background class
  backGround.ReDraw(backGround.imgBackGround);
  image(backGround.imgBackGround, backGround.nX, backGround.nY);
  image(player.getImage(), player.nX, player.nY);
  if (player.isGrounded != true) {
    player.Gravity();
  }
}

