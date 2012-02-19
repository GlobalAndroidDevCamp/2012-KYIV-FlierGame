/**
 *A class to manage various particles that fly in space
 *
 */
class ParticleManager implements Effect {

  private float horizontalParticleSpeed = -20;
  private float maxAbsVerticalSpeed = 5;
  private float maxHorizontalSpeedDispersion = 3;

  private List<PVector> particlePositions = 
    new LinkedList<PVector>();
  private List<PVector> particleSpeeds = 
    new LinkedList<PVector>();

  public ParticleManager() {
  }

  private void addParticle() {
    particlePositions.add(
    new PVector(random(sketchWidth()), random(sketchHeight()))
      );

    float hsp = horizontalParticleSpeed +
      random (maxHorizontalSpeedDispersion) - 
      0.5 * maxHorizontalSpeedDispersion;

    float vsp = 0  + 
      random (maxAbsVerticalSpeed) - 
      0.5 * maxAbsVerticalSpeed;

    particleSpeeds.add(new PVector(hsp, vsp));
  }

  private void moveParticles() {
    ListIterator<PVector> iterpos = particlePositions.listIterator();
    ListIterator<PVector> itersp = particleSpeeds.listIterator();
    while (iterpos.hasNext ()) {
      iterpos.next().add(itersp.next());
    }
  }

  private void removeInvisibleParticles() {
    ListIterator<PVector> iterpos = particlePositions.listIterator();
    ListIterator<PVector> itersp = particleSpeeds.listIterator();
    while (iterpos.hasNext ()) {
      PVector pos = iterpos.next();
      itersp.next();
      if (pos.x < 0 || pos.x > sketchWidth() || 
        pos.y < 0 || pos.y > sketchHeight()) {
        iterpos.remove();
        itersp.remove();
      }
    }
  }


  public void manage() {
    removeInvisibleParticles();
    moveParticles();
    if (frameCount % 3 == 0) { 
      addParticle();
    };
  }


  public void move(final PVector translation) {
    ListIterator<PVector> iter = particlePositions.listIterator();
    while (iter.hasNext ()) {
      iter.next().add(translation);
    }
  }


  public void draw() {
    ListIterator<PVector> iter = particlePositions.listIterator();
    while (iter.hasNext ()) {
      PVector pos = iter.next();

      for (int offset = 0; offset < 20; offset += 1) {
        int alpha = 255 - 7*offset;
        fill(255, 255, 255, alpha);
        stroke(255, 255, 255, alpha);
        rect(pos.x+offset*5, pos.y, 2, 2);
      }
    }
  }
};

