PVector loc;
float diam;
class bucket {
  bucket(){
    loc = new PVector(mouseX,mouseY);
}
void display(){
  ellipse(mouseX,mouseY,random(20,40),random(20,40));
}
}