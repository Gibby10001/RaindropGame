int score;
ArrayList<raindrop> raindrops = new ArrayList<raindrop>();  //declare and initialize the ArrayList
PVector mo;
bucket b;

void setup() {
  size(1000, 800);
  mo = new PVector();
  b = new bucket();
raindrops.add(new raindrop(random(40,960), 0));    //add a new Particle to the particles ArrayList
}

void draw() {
  background(0,255,255);
  mo.set(mouseX,mouseY);
  raindrops.add(new raindrop(random(40,960), 0));    //add a new Particle to the particles ArrayList
for (int e = raindrops.size()-1; e >= 0; e--) {  //go through the ArrayList backwards to prevent flickering
    raindrop d = raindrops.get(e);    //get the Particle in location e and store it in raindrop d
    d.display();                      //display d variable
    d.fall();                         //make d fall
    if (d.reset()) {                 //if d resets
      raindrops.remove(e);    //remove particle at location e
    }
    if (d.isInContactWith(mo)){
    d.reset();
    score+=1;
  }
  b.display();
  textSize(32);
  fill(0);
  text(score,width/2,700);
}
}