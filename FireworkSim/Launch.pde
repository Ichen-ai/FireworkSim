class Launch{
  String shape;
  float size, hue;
  PVector pos, end, vel;
  boolean exploded;
  
  //constructor
  Launch(float s, float h, float x, float y, float e) {
    this.pos = new PVector(x, y);
    this.end = new PVector(x, e);
    this.hue = h;
    this.size = s;
    this.exploded = false;
    
    vel = PVector.sub(end, pos);
    vel.normalize();
    vel.mult(10);
  }

  
  //methods
  void update(){
    pos.add(vel);
    
    float d = dist(pos.x, pos.y, end.x, end.y);
    
    if (d < 10){
      explode();
      exploded = true;
    }
  }
  
  void explode(){
    for (int i = 0; i < 100; i++){
      particles.add(new Particle(this.end.x, this.end.y, this.hue, this.size));
    }
  }
  
  boolean isDead(){
    return exploded;
  }
  
  void display(){
    stroke(255, 0, 0);
    strokeWeight(64);
    point(this.pos.x, this.pos.y);
  }
}
