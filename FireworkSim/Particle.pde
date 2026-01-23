class Particle{
  //fields
  PVector pos;
  PVector vel;
  float lifespan, hue, size;
  float gravity = 0.1;
  
  //constructor
  Particle(float x, float y, float h, float s, PVector v){
    this.pos = new PVector(x, y);
    
    this.vel = v.copy();//creates a copy of of the instructions needed to create a shape
    this.vel.add(PVector.random2D().mult(0.5));
    
    this.lifespan = 255;
    this.hue = h;
    this.size = s;
    
  }
  
  //methods
  void update(){
    this.vel.y += gravity; //adding gravity to velocity
    this.pos.add(vel);
    this.vel.mult(0.96); //air resistance
    
    lifespan -= 3; //makes fireworks fade away
    
  }
  
  void display(){
    fill(hue, 255, 255, lifespan);
    ellipse(pos.x, pos.y, size, size);
    
  }
  
  //remove if the particle have dissipated
  boolean isDead(){
    return lifespan < 0;
    
  }
}
