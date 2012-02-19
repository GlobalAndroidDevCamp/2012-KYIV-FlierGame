private GameManager gameManager;
private PImage flierimg;
void setup(){
  orientation(PORTRAIT);
  noSmooth();
  flierimg = loadImage("nyan-cat.gif");
  try{
    gameManager = new GameManager();
  }catch(Exception e){
    println(e.toString());
  }
}

void draw(){
  background(20, 20, 240);
  gameManager.manage();
  gameManager.draw();
}
