/**
*This will be a common interface for all classes
*that are providing dynamic special effect 
*and can move relatively to the Flier,
*but don't affect the actual gameplay.
*The Flier itself is not an Effect
*/
interface Effect{
  /**
  *Perform movements and transformations
  * that are characteristic to the given effect
  */
  public void manage();
  
  /**
  *Perform instant 2D translation
  *specified by the parameter PVector
  *for all components of this effect.
  *These movements are unnatural to this effect
  *and are used to represent relative movement of the camera
  */
  public void move(final PVector translation);
  
  /**
  *Draw the visual part of this effect.
  */
  public void draw();
};
