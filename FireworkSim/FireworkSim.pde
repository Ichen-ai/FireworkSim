// Importing necessary tools
import g4p_controls. *;

//global variables
ArrayList <Launch> fireworks;
ArrayList <Particle> particles;
int [] possiRating;
ArrayList <Integer> ratings;
float size, rating, averageRating, totalRatings;
int num = 100;
int hue;
boolean ranHue = false;

void setup(){
  size(800, 600);
  colorMode(HSB, 255);
  createGUI();
  noStroke();
   
  fireworks = new ArrayList();
  particles = new ArrayList();
  ratings = new ArrayList();
  
}

void draw(){
  //create trail
  fill(0, 50);
  rect(0, 0, width, height);
  
  //update and display the launch
  for (int i = fireworks.size()-1; i >= 0; i--){
    Launch l = fireworks.get(i);
    l.update();
    l.display();
    
    if (l.isDead()){
      fireworks.remove(i);
    }
    
  }
  
  //updateand display the particles
  for (int i = particles.size()-1; i >= 0; i--){
    Particle p = particles.get(i);
    p.update();
    p.display();
    
    if (p.isDead()){
      particles.remove(i);
    }
  }
  
  //color of fireworks
  if (ranHue == false){
    fill(hue, 255, 255);
    rect(700, 50, 25, 25);
    fill(0, 0, 255);
    textSize(30);
    text(": Hue", 725, 70);
  }
  
  calculateRating();
  
  fill(255);
}
