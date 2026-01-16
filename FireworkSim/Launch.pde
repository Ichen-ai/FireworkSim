class Launch{
  String shape;
  float size, hue;
  PVector pos, end, vel;
  boolean exploded;
  int num;
  
  //constructor
  Launch(float s, float h, float x, float y, float e, int n) {
    this.pos = new PVector(x, y);
    this.end = new PVector(x, e);
    this.hue = h;
    this.size = s;
    this.exploded = false;
    this.num = n;
    
    //calculate velocity
    vel = PVector.sub(end, pos);
    vel.normalize();
    vel.mult(5);
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
    for (int i = 0; i < this.num; i++){
      particles.add(new Particle(this.end.x, this.end.y, this.hue, this.size));
    }
  }
  
  boolean isDead(){
    return exploded;
  }
  
  void display(){
    fill(hue, 255, 255);
    noStroke();
    ellipse(this.pos.x, this.pos.y, 8, 8);
  }
}
