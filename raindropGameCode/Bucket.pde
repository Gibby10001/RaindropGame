
class bucket {
  PVector loc;
  PImage umb;

  bucket() {
    loc = new PVector(mouseX, mouseY);
    //umb = loadImage("umb.jpg");
  }
  void display() {
    loc.set(mouseX,mouseY);
    fill(255);
    ellipse(loc.x, loc.y, 50, 50);
    //image(umb,mouseX,height-100);
  }
}