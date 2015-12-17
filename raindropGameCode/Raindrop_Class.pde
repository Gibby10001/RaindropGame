class raindrop {
  float diam = 30;
  PVector loc, vel, grav;
  //give each variables values
  raindrop(float x, float y) {
    loc = new PVector(x, y);
    vel = PVector.random2D();
    grav = new PVector(0, 0.1);
  }
  void display() {
    fill(0,0,200);
    noStroke();
    ellipse(loc.x, loc.y, 30, diam);
  }
  void fall() {
    loc.add(vel);
    vel.add(grav);
  }
  void reset() {
    loc.y = 0;
    loc.x = random(width);
      vel = PVector.random2D();
    vel.add(grav);
  }
  boolean isInContactWith(PVector mo){
    return mo.dist(loc) <= diam/2;
  }
}