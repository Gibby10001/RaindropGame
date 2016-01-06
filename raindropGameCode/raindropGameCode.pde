import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sound;
AudioPlayer sound1;

int score;
int screen;
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();  //declare and initialize the ArrayList
bucket b;

void setup() {
  size(1000, 800);
  minim = new Minim(this);
  sound = minim.loadFile("POL-stealth-mode-short.wav");
  sound.play();
  screen = 1;
  b = new bucket();
  raindrops.add(new Raindrop(random(40, 960), 0));    //add a new Particle to the particles ArrayList
}

void draw() {
  background(0, 255, 0);
  textSize(40);
  fill(random(255), random(255), random(255));
  text("Raindrops Game", 150, 120);
  text("Press Any Key to Cotinue...", 50, height-100);
  if (screen == 2) {
    background(0);
    stroke(255);
    fill(0);
    rect(10, 550, 450, 125);
    fill(255);
    text("Try to stay dry as long as possible.", width/2, 200);
    text("If you let more than 50 drops pass", width/2, 300);
    text("YOU LOSE!", width/2, 400);
  }
  if (screen == 3) {
    if (keyPressed == true) {
      sound.pause();
      minim = new Minim(this);
      sound1 = minim.loadFile("Rain.mp3");
      sound1.play();
    }
  }
  if (screen == 3) {
    game();
  }
}
void game() {
  background(0);
  //if(the condition to add a raindrop is met){
  raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
  //}
  for (int e = raindrops.size()-1; e >= 0; e--) {  //go through the ArrayList backwards to prevent flickering
    Raindrop d = raindrops.get(e);    //get the drop in location e and store it in raindrop d
    d.display();                      //display d variable
    d.fall();                         //make d fall
    if (d.reset()) {                 //if d resets
      raindrops.remove(e);    //remove drop at location e
    }
    if (d.isInContactWith(b)) {
      raindrops.remove(e);    //remove drop at location e
      score+=1;
    }
    textSize(32);
    fill(0);
    text(score, width/2, 700);
  }
  b.display();
  textSize(32);
  text(score, 100, 680);
}
void keyPressed() {
  screen+=1;
}