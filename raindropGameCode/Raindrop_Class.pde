class Raindrop {
  float diam = 30;
  int score;
  PVector loc, vel, grav;

  Raindrop(float x, float y) {
    loc = new PVector(x, y);
    vel = PVector.random2D();
    grav = new PVector(0, 0.1);
  }
  void display() {
    fill(0, 0, 200);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() {
    loc.add(vel);
    vel.add(grav);
  }
  boolean reset() {
    if (loc.y > height + diam/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean isInContactWith(bucket m) {
    if ( loc.dist(m.loc) <= diam/2 + 20) {
      println("caught a raindrop in frame " + frameCount);
      return true;
    } else {
      return false;
    }
  }
}