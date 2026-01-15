class Particle{
  //fields
  PVector pos;
  PVector vel;
  float lifespan, hue, size;
  float gravity = 0.1;
  
  //constructor
  Particle(float x, float y, float h, float s){
    this.pos = new PVector(x, y);
    
    this.vel = PVector.random2D(); //make a unit vector pointing in a random direction
    this.vel.mult(random(2, 6));
    
    this.lifespan = 255;
    this.hue = h;
    this.size = s;
  }
  
  //methods
  void update(){
    this.vel.y += gravity;
    this.pos.add(vel);
    
    lifespan -= 4;
  }
  
  void display(){
    fill(hue, 255, 255, lifespan);
    ellipse(pos.x, pos.y, size, size);
  }
  
  boolean isDead(){
    return lifespan < 0;
  }
}
