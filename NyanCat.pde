class NyanCat {
  private PImage[] frames;
  
  private PImage[] loadCatFrames() {
    PImage[] result = new PImage[6];
    for (int i = 1; i <=6; ++i) {
      result[i-1] = loadImage("Nyan-cat-" + i + ".gif");
    }
    return result;
  }
  
  public NyanCat(){
    frames = loadCatFrames();
  }
  
  private PImage getCurrentFrame(){
    final int index = ((frameCount%60)/10); //index = 0 to 5
    return frames[index];
  }

  public void draw(final float x, final float y) {
    imageMode(CENTER);
    image(getCurrentFrame(), x, y);
  }
};

