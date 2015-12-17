int count = 200;
int i = 0;
PVector mouse;   //declare a P
//declare a new raindrop called r
raindrop[] r = new raindrop [count];

// On your own, create an array of raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single raindrop as you test


void setup() {
  size(1000, 800);
  mouse = new PVector(); //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i=0; i<count; i++) {
    r[i]= new raindrop(random(width), 0);
  }
  fill(0);
  text("Raindrops",width/2,height/2);
}

void draw() {
  background(255);
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  for (int i=0; i<count; i++) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset the raindrop
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
    }
  }
}