PVector loc;
PImage umb; 
class bucket {
  bucket(){
    loc = new PVector(mouseX,mouseY);
    //umb = loadImage("umb.jpg");
}
void display(){
  fill(255);
  ellipse(mouseX,mouseY,40,40);
  //image(umb,mouseX,height-100);
}
}