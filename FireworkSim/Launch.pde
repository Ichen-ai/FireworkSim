class Launch{
  String shape;
  float size, hue, endHeight;
  PVector pos;
  
  //constructor
  Launch(float s, float h, float x, float y, float e) {
    this.pos = new PVector(x, y);
    this.endHeight = e;
    this.hue = h;
    this.size = s;
    
  }

  
  //methods
  float calcInitialVel(){
    float h = 600 - endHeight;
    float initialVel = sqrt(2*9.8*h);
    
    return initialVel;
  }
  
  
  void update(){
    if (this.pos.y >= endHeight){
      this.pos.y++;
      
    }
    else{
      explode();
    }
  }
  
  void explode(){
    for (int i = 0; i < 100; i++){
      particles.add(new Particle(this.pos.x, this.endHeight, this.hue, this.size));
    }
  }
}
