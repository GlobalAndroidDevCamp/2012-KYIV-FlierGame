class Camera2D{
  private PVector position;
  
  private Collection<AffectedByCamera> affectedElements = 
  new LinkedList<AffectedByCamera>();
  
  public Camera2D(PVector _pos){
    position = _pos;
  }
  
  public PVector getPosition(){
    return position;
  }
  
  public void setPosition (PVector newpos){
    final PVector diff = PVector.sub(position, newpos);
    
    for(AffectedByCamera elem : affectedElements){
      elem.translate(diff);
    }
  }
  
  public void add(AffectedByCamera elem){
    affectedElements.add(elem);
  }
  
  public void remove(AffectedByCamera elem){
    affectedElements.remove(elem);
  }
  
  public boolean contains(AffectedByCamera elem){
    return affectedElements.contains(elem);
  }
};
