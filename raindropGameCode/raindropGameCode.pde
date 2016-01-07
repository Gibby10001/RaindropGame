import ddf.minim.*; //imported library for audio to work
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; //initial library for audio
AudioPlayer sound;
AudioPlayer sound1;

ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();  //declare and initialize the ArrayList
int score; //initialized variable needed for the score
int screen;//initialized variable needed for the screens
bucket b; //using class
PFont f; //custom font f
int health; //health of player
int ld; //loading bar on startup
PImage load; //loading screen images
PImage sc;
PImage sc2;

void setup() {
  size(1000, 800); //size of canvas
  minim = new Minim(this); //minim audio import
  sound = minim.loadFile("POL-stealth-mode-short.wav"); //play first sound
  sound.play();
  sound.loop(); //loop first audio
  screen = 1; //give screen value 
  health = 10; //give initial health value
  ld = 10; //loading bar value
  load = loadImage("DG64E4o.jpg"); //loaded images needed
  sc = loadImage("Sky.png");
  sc2 = loadImage("img.jpg");
  b = new bucket(); //b becomes variable for bucket class
  f = loadFont("Agency-48.vlw"); //loaded custom font
  raindrops.add(new Raindrop(random(40, 960), 0));    //add a new Particle to the particles ArrayList
}

void draw() {
  if (screen == 1) { //first screen of code
    background(0);
    image(load, 0, 0, 1000, 800); //load image to entire canvas size
    noStroke(); //text attributes
    textAlign(CENTER);
    textFont(f, 96); //changed text font
    text("Presenting GVGames", width/2, height/2); //loading screen text
    rect(0, height-25, ld, height-25); //loading bar
    if (frameCount>1) {
      ld+=10; //increase loading bar to progess to menu but no actions can be done until fully loaded
    }
    if (ld >= width+20) { //bar fully loaded when reaches slightly past canvas border
      background(0);
      text("Press Any Key to Load into Menu", width/2, height/2); //text to enter menu
    }
  }
  if (screen == 2) { //second screen of game or menu screen
    background(0);
    image(sc2, 0, 0, 1000, 800); //background image of menu
    textFont(f, 108); //set text to custom font f
    textAlign(CENTER); //text attributes
    text("Raindrops Game", width/2, 140); //game title
    text("Press Any Key to Cotinue...", width/2, height-170); //press any key on keyboard to continue to next screen
    textSize(48); //text attributes
    text("Game Created By GiLbSoN", width/2, height-40); //Name (ITS LIT!)
  }
  if (screen == 3) { //third screen or instruction menu
    background(0);
    stroke(255); //border of menu attributes
    strokeWeight(10);
    fill(0);
    rect(10, 10, width-20, height-20);
    fill(255);
    textAlign(CENTER); //text attributes
    textSize(56);
    text("Try and stay dry as long as possible.", width/2, 260); //instuctions to player
    text("If you let more than 10 drops pass", width/2, 370);
    text("YOU LOSE!", width/2, 480);
    text("Try and see if you can get the high score!", width/2, 590);
    if (keyPressed == true) { 
      sound.pause(); //if key is pressed pauses first audio
      minim = new Minim(this);
      sound1 = minim.loadFile("Rain.mp3"); //loads second audio
    }
  }
  if (screen == 4) {
    game(); //loads into game
  }
}
void game() {
  background(0);
  image(sc, 0, 0, 1000, 800); //background image of game screen

  //next if statements change the number of drops as the players score increases (i added a lot of if statements just so nobody wins)
  if (score<10) {//score range for difficulty
    if (raindrops.size()<= 1) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>10 && !(score>20)) { //score range for difficulty
    if (raindrops.size()<= 2) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>20 && !(score>30)) {//score range for difficulty
    if (raindrops.size()<= 3) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>30 && !(score>40)) {//score range for difficulty
    if (raindrops.size()<= 4) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>40 && !(score>50)) {//score range for difficulty
    if (raindrops.size()<= 5) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  if (score>50 && !(score>60)) {//score range for difficulty
    if (raindrops.size()<= 6) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
    if (score>60 && !(score>70)) {//score range for difficulty
    if (raindrops.size()<= 7) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
    if (score>70 && !(score>80)) {//score range for difficulty
    if (raindrops.size()<= 8) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
    if (score>80 && !(score>100)) {//score range for difficulty
    if (raindrops.size()<= 9) {
      raindrops.add(new Raindrop(random(40, 960), 0));    //add a new drop to the particles ArrayList
    }
  }
  sound1.play(); //plays second audio
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
  b.display(); //displays bucket
  textSize(32); //text attributes for score and health
  text("SCORE", 100, 640);
  text(score, 100, 680);
  text("HEALTH", width-100, 640);
  text(health, width-100, 680);
  if (score >= 100) {
        background(0);
    fill(0, 255, 0); //text attributes
    textSize(72);
    text("You Win!", width/2, height/2-40); //you won the game text but note this is literally impossible to get 
    text("You Stayed Dry", width/2, height/2+40);
    text("Press Esc to Exit", width/2, height/2+120); //you actually beat the game and you can exit 
  }
  if (health<= 0) { //when health reaches zero it brings up game over screen
    background(0);
    fill(255, 0, 0); //text attributes
    textSize(72);
    text("GAME OVER", width/2, height/2-40); //game over text
    text("You Are Soaked", width/2, height/2+40);
    text("Press Esc to Exit", width/2, height/2+120); //only option is to exit game since you have failed to reach 100
    println("You Are Soaked"); //prints if you lose game
  }
}

void keyPressed() {
  if (ld>width) { //when loading bar is complete you can press a key to advance into game
    if (screen == 1 || screen == 2 || screen == 3) { //only allows advances in loading, menu, and instruction screens
      screen+=1; //increases screen value
    }
  }
}