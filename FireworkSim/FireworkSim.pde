// Importing necessary tools
import g4p_controls. *;

ArrayList <Particle> particles;

void setup(){
  size(800, 600);
  colorMode(HSB, 255);
  createGUI();
  noStroke();
  
  particles = new ArrayList();
  
}



void draw(){
  fill(0, 50);
  rect(0, 0, width, height);
  
  for (int i = particles.size()-1; i >= 0; i--){
      Particle p =particles.get(i);
      p.update();
      p.display();
      
      if (p.isDead()){
        particles.remove(i);
      }
    }
  
}

void mousePressed(){
  launchFirework(mouseX, mouseY);
  
}

void launchFirework(float x, float y){
  
  
  
}
