class Launch{
  String shapeType;
  float size, hue;
  PVector pos, end, vel;
  boolean exploded;
  int num;
  
  //constructor
  Launch(float s, float h, float x, float y, float e, int n, String shape) {
    this.pos = new PVector(x, y);
    this.end = new PVector(x, e);
    this.hue = h;
    this.size = s;
    this.exploded = false;
    this.num = n;
    this.shapeType = shape;
    
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
    for (int i = 0; i < this.num; i++) {
      PVector v = new PVector(0, 0);
      
      //heart shape
      if (shapeType.equals("Heart")) {
        float a = map(i, 0, num, 0, TWO_PI); //angle
        float r = 2.5; //sets size of shape
        
        v.x = r * 16 * pow(sin(a), 3);
        v.y = -r * (13 * cos(a) - 5 * cos(2*a) - 2 * cos(3*a) - cos(4*a));
        v.mult(0.1);

      } 
      //star shape
      else if (shapeType.equals("Star")) {
        float a = map(i, 0, num, 0, TWO_PI);
        float starRadius = 3 + 2 * sin(5 * a); 
        
        v.x = starRadius * cos(a);
        v.y = starRadius * sin(a);
        
      } 
      //square shape
      else if (shapeType.equals("Square")) {
        int side = int(random(4));
        float range = random(-1, 1);
        float speed = random(2, 5);
        
        if(side == 0) v = new PVector(range, -1); // Top
        if(side == 1) v = new PVector(1, range);  // Right
        if(side == 2) v = new PVector(range, 1);  // Bottom
        if(side == 3) v = new PVector(-1, range); // Left
        v.setMag(speed);

      } 
      //circle shape
      else { 
        v = PVector.random2D();
        v.mult(random(2, 6)); 
        
      }
      
      particles.add(new Particle(this.end.x, this.end.y, this.hue, this.size, v));
    }
  }
  
  //check if the firework reached it's desired location
  boolean isDead(){
    return exploded;
    
  }
  
  void display(){
    fill(this.hue, 255, 255);
    noStroke();
    ellipse(this.pos.x, this.pos.y, 8, 8);
    
  }
}
