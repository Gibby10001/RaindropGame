class raindrop {
  PVector loc, vel, grav;
  int diam, diam2;
  //give each variables values
  raindrop() {
    int diam = 30;
    int diam2 = 40;
    loc = new PVector(random(diam, width-diam), random(diam, height-diam));
    vel = new PVector(4, 5);
    grav = new PVector(0, 0.1);
  }
  void display() {
    fill(random(255), random(50), random(100, 255));
    noStroke();
    ellipse(loc.x, loc.y, diam, diam2);
  }
  void fall() {
    loc.add(vel);
    vel.add(grav);
  }
  //void reset(){

  //}
}