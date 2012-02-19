/**
*This will be a common interface for all objects 
*that must change their position on the screen 
*when the camera moves
*/
public interface AffectedByCamera{
  public void translate(final PVector translation);
};
