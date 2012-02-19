class InputAdapter{
  private SoundManager inputSource;  
  
  public InputAdapter(final SoundManager soundInput) throws IOException{
    inputSource = soundInput;
    
    //TODO maybe this should be moved in some other place
    inputSource.start();
  }
  
  /**
   * weaker scream --> faster fall; louder scream --> no fall
   *!!! Ensure that currentSound is not larger than maxSound
   */
  private float calculateVerticalSpeed(final float maxAbsSpeed, 
  final int maxSound, final int currentSound) {
    float quot = 
      (((float)(maxSound-currentSound)) / maxSound) ;
    //quot will be in [0; 1];
    float result = (quot-0.3) * maxAbsSpeed * 1.4; //flier will be falling down
    return result;
  }
  
  private int soundMax = 15000; //should change with time
  private float maxAbsVerticalSpeed = sketchHeight()/200;
  
  public PVector getFlierSpeed(){
    int currSound = inputSource.getSoundValue();
    if (currSound > soundMax) soundMax = currSound;

    float vertSpeed = calculateVerticalSpeed(
    maxAbsVerticalSpeed, soundMax * 2/30, currSound);

    return new PVector(0, vertSpeed);
  }
  
  
};
