
class bucket { //bucket class
  PVector loc; //vector for bucket

  bucket() {
    loc = new PVector(mouseX, mouseY); //loc is equal to new PVector
  }
  void display() {
    loc.set(mouseX, mouseY); //sets the PVector to mouse coordinates
    fill(255); //fill of ellipse
    ellipse(loc.x, loc.y, 50, 50); //bucket for raindrop
  }
}