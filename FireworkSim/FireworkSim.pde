// Importing necessary tools
import g4p_controls. *;

//global variables
ArrayList <Launch> fireworks;
ArrayList <Particle> particles;
float size;
int num = 100;
int hue = 255;

void setup(){
  size(800, 600);
  colorMode(HSB, 255);
  createGUI();
  noStroke();
  
  //arraylists
  fireworks = new ArrayList();
  particles = new ArrayList();
  
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
  
  fill(255);
}

//mouse press to launch firework
void mousePressed(){
  launchFirework(mouseX, mouseY);
}

void launchFirework(float x, float y){
  size = sizeSlider.getValueI();
  num = numParticleSlider.getValueI();
  
  fireworks.add(new Launch(size, random(255), x, 600, y, num));
}
