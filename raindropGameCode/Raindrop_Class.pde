class Raindrop {
  float diam = 30;
  int score;
  PVector loc, vel, grav;

  Raindrop(float x, float y) {
    loc = new PVector(x, y);
    vel = PVector.random2D();
    grav = new PVector(0, 0.08);
  }
  void display() {
    fill(0, 0, 200);
    noStroke();
    noStroke();  
    triangle(loc.x-diam/2, loc.y, loc.x+diam/2, loc.y, loc.x, loc.y-diam);
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
      println("Stay Dry");
      return true;
    } else {
      return false;
    }
  }
}