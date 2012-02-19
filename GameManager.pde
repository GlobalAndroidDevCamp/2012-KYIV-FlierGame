public class GameManager {
  public static final int NOT_STARTED = 1;
  public static final int FLYING = 2;
  public static final int FALLEN = 3;
  public static final int FINALIZED = 4;

  private int state = NOT_STARTED;

  public int getState() {
    return state;
  } 

  /**
   *maximal y coordinate of the flier.
   *If this coordinate grows further (i. e. flier falls too low), 
   *the game is considered lost
   */
  private float maxFlierDescent; 

  /**
   *minimal y coordinate of the flier.
   *If this coordinate grows further (i. e. flier falls too low), 
   *he would not fit to the screen, bul the game will continue
   */
  private float minFlierDescent;

  public boolean flierOverflown() {
    return flier.getPosition().y < minFlierDescent;
  }

  public boolean flierFallen() {
    return flier.getPosition().y > maxFlierDescent;
  }

  private Flier flier;
  private InputAdapter input;
  private EffectManager effectManager;
  private Camera2D camera2d;

  private PVector initFlSpeed = new PVector(0, 0);

  public GameManager() throws IOException {
    PVector _pos = new PVector(sketchWidth()/2, sketchHeight()/2);

    camera2d = new Camera2D(new PVector(_pos.x,_pos.y));
    
    
    minFlierDescent = 0;
    maxFlierDescent = sketchHeight();

    flier = new Flier(_pos, initFlSpeed);
    camera2d.add(flier);
    
    input = new InputAdapter(new SoundManager());
    
    effectManager = new EffectManager();
    effectManager.add(new ParticleManager());
    camera2d.add(effectManager);

    state = NOT_STARTED;
    
    //TODO maybe this should be moved in some other place
    start();
  }

  public void start()throws IOException {
    state = FLYING;
  }

  public void manage() {
    if (frameCount % 15 == 0)
      flier.setSpeed(input.getFlierSpeed());
    flier.move();
    effectManager.manageAll();
    camera2d.setPosition(flier.getPosition());
    if (flierFallen()) {
      state = FALLEN;
    }
  }

  public void draw() {
    
    effectManager.drawAll();
    flier.draw();
    ellipseMode(CENTER);
  }
};

