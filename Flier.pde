class Flier implements AffectedByCamera{
  private PVector position;
  private PVector speed;
  private NyanCat catLook;
  
  public Flier(PVector _pos, PVector _sp){
    this.position = _pos;
    this.speed = _sp;
    this.catLook = new NyanCat();
  }
  
  public PVector getPosition(){
    return position;
  }
  
  public PVector getSpeed(){
    return speed;
  }
  
  public void setSpeed(final PVector newSpeed){
    this.speed = newSpeed;
  }
  
  public void move(){
    position.add(speed);
  }
  
  public void draw(){
    imageMode(CENTER);
    catLook.draw(position.x, position.y);
  }
  
  public void translate(final PVector translation){
    position.add(translation);
  }
};
