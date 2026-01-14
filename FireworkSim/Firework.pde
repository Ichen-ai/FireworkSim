class Firework{
  //fields
  PVector endPos;
  String shape;
  color col;
  float size;
  
  //constructor
  Firework() {
    this.endPos = endPos;
    this.shape = shape;
    this.col = col;
    this.size = size;
    
  }
  
  //methods
  float calInitialVel(){
    float h = 600 - this.endPos.y;
    float initialVel = sqrt(2*9.8*h);
    
    return initialVel;
  }
  
  void explode(){
    
  }
  
}
