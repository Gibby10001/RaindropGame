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
PFont f;
int health;
int ld;
PImage load;
PImage sc;
void setup() {
  size(1000, 800);
  minim = new Minim(this);
  sound = minim.loadFile("POL-stealth-mode-short.wav");
  sound.play();
  screen = 1;
  health = 10;
  ld = 10;
  load = loadImage("DG64E4o.jpg");
  sc = loadImage("Sky.png");
  b = new bucket();
  f = loadFont("Agency-48.vlw");
  raindrops.add(new Raindrop(random(40, 960), 0));    //add a new Particle to the particles ArrayList
}

void draw() {
  if (screen == 1) {
    background(0);
    image(load,0,0,1000,800);
    noStroke();
    textAlign(CENTER);
    textFont(f, 96);
    text("Presenting GVGames", width/2, height/2);
    rect(0, height-25, ld, height-25);
    if (frameCount>1) {
      ld+=10;
    }
    if (ld >= width+20) {
      background(0, 0, 255);
      text("Press Any Key to Load", width/2, height/2);
    }
  }
  if (screen == 2) {
    background(0);
    textFont(f, 108); //set text to custom font f
    textAlign(CENTER);
    text("Raindrops Game", width/2, 160);
    text("Press Any Key to Cotinue...", width/2, height-200);
    textSize(48);
    text("Game Created By GiLbSoN", width/2, height-40);
  }
  if (screen == 3) {
    background(0);
    stroke(255);
    strokeWeight(10);
    fill(0);
    rect(10, 10, width-20, height-20);
    fill(255);
    textAlign(CENTER);
    textSize(56);
    text("The point of the game is to", width/2, 250); 
    text("try and stay dry as long as possible.", width/2, 360);
    text("If you let more than 10 drops pass", width/2, 470);
    text("YOU LOSE!", width/2, 580);
    text("Try and see if you can get the high score!", width/2, 690);
    if (keyPressed == true) {
      sound.pause();
      minim = new Minim(this);
      sound1 = minim.loadFile("Rain.mp3");
    }
  }
  if (screen == 4) {
    game();
  }
}
void game() {
  background(0);
      image(sc,0,0,1000,800);
  if (score<10) {
    if (raindrops.size()<= 1) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>10 && !(score>20)) {
    if (raindrops.size()<= 2) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>20 && !(score>30)) {
    if (raindrops.size()<= 3) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>30 && !(score>40)) {
    if (raindrops.size()<= 4) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>40 && !(score>50)) {
    if (raindrops.size()<= 5) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>50 && !(score>100)) {
    if (raindrops.size()<= 6) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  sound1.play();
  for (int e = raindrops.size()-1; e >= 0; e--) {  //go through the ArrayList backwards to prevent flickering
    Raindrop d = raindrops.get(e);    //get the drop in location e and store it in raindrop d
    d.display();                      //display d variable
    d.fall();                         //make d fall
    if (d.reset()) {                 //if d resets
      raindrops.remove(e);    //remove drop at location e
      health-=1;
    }
    if (d.isInContactWith(b)) {
      raindrops.remove(e);    //remove drop at location e
      score+=1;
    }
  }
  b.display();
  textSize(32);
  text("SCORE", 100, 640);
  text(score, 100, 680);
  text("HEALTH", width-100, 640);
  text(health, width-100, 680);
  if (health<= 0) {
      background(0);
      fill(255, 0, 0);
      textSize(72);
      text("GAME OVER", width/2, height/2-40);
      text("You Are Soaked", width/2, height/2+40);
      text("Press Esc to Exit", width/2, height/2+120);
    }
  }

void keyPressed() {
  if (ld>width) {
    if (screen == 1 || screen == 2 || screen == 3) {
      screen+=1;
    }
  }
}