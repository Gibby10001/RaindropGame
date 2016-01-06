PImage umb; 
class bucket {
  bucket(){
    umb = loadImage("umb.jpg");
}
void display(){
  fill(0);
  image(umb,mouseX,height-100);
}
}