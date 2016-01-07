class Raindrop { //raindrop class
  float diam = 30; //intialize needed values for class
  int score;
  PVector loc, vel, grav;

  Raindrop(float x, float y) { // raindrop values
    loc = new PVector(x, y);
    vel = PVector.random2D(); //velocity of drops
    grav = new PVector(0, 0.08); //gravity affected on drops
  }
  void display() {
    fill(51, 204, 255); //fill of drops
    noStroke();  
    triangle(loc.x-diam/2, loc.y, loc.x+diam/2, loc.y, loc.x, loc.y-diam); //shape of raindrop
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() { //cause raindrops to fall due to velocity and acceleration
    loc.add(vel);
    vel.add(grav);
  }
  boolean reset() { //resets position of raindrops if falls past height
    if (loc.y > height + diam/2) {
      return true; //returns true or returns false
    } else {
      return false;
    }
  }
  boolean isInContactWith(bucket m) { //checks to see if mouse is in contact with bucket
    if ( loc.dist(m.loc) <= diam/2 + 25) {
      println("Staying Dry"); //prints if a raindrop is removed
      return true;//returns true or returns false
    } else {
      return false;
    }
  }
}