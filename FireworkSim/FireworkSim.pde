// Importing necessary tools
import g4p_controls. *;

ArrayList <Launch> fireworks;
ArrayList <Particle> particles;
float size;

void setup(){
  size(800, 600);
  colorMode(HSB, 255);
  createGUI();
  noStroke();
  
  fireworks = new ArrayList();
  particles = new ArrayList();
  
}



void draw(){
  fill(0, 50);
  rect(0, 0, width, height);
  
  for (int i = fireworks.size()-1; i >= 0; i--){
    Launch l = fireworks.get(i);
    l.update();
    l.display();
    
    if (l.isDead()){
      fireworks.remove(i);
    }
    
  }
  
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

void mousePressed(){
  launchFirework(mouseX, mouseY);
  
}

void launchFirework(float x, float y){
  size = sizeSlider.getValueI();
  
  fireworks.add(new Launch(size, random(255), x, 0, y));
  
  
}
