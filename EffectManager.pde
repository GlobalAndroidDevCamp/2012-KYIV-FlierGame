class EffectManager implements AffectedByCamera{
  private Collection<Effect> effects = new LinkedList<Effect>();
  
  public void manageAll(){
    for(Effect e : effects)
    e.manage();
  }
  
  public void moveAll(final PVector translation){
    for(Effect e : effects)
    e.move(translation);
  }
  
  public void drawAll(){
    for(Effect e : effects)
    e.draw();
  }
  
  public void add(Effect effect){
    effects.add(effect);
  }
  
  public void remove(Effect effect){
    effects.remove(effect);
  }
  
  public boolean contains(Effect effect){
    return effects.contains(effect);
  }
  
  public void translate(final PVector translation){
    moveAll(translation);
  }
}
