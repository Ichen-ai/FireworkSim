class Firework{
  //fields
  PVector pos;
  String shape;
  color col;
  float size;
  
  //constructor
  Firework() {
    this.pos = pos;
    this.shape = shape;
    this.col = col;
    this.size = size;
    
  }
  
  //methods
  float calVelocity(){
    float h = 600 - this.pos.y;
    float initialVel = sqrt(2*9.8*h);
    return initialVel;
  }
  
}
