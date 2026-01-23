// Importing necessary tools
import g4p_controls. *;

//global variables and arrays
ArrayList <Launch> fireworks;
ArrayList <Particle> particles;
int [] possiRating;
ArrayList <Integer> ratings;
float size, rating, averageRating, totalRatings, enjoyment;
int num = 100;
int startTime = second();
int hue, time;
boolean ranHue = false;
String review;
String [] ratingsFile;

void setup(){
  size(800, 600);
  colorMode(HSB, 255);
  createGUI();
  noStroke();
  
  shapeDropList.setItems(new String[] {"Circle", "Heart", "Star", "Square", "Random"}, 0);
  
  ratingsFile = loadStrings("rating.txt");
  
  review = "waiting for review..."; //prevent any errors with the clock
   
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
  
  //update and display the particles
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
  displayReview();
  
  fill(255);
}
