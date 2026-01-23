//mouse press to launch firework
void mousePressed(){
  launchFirework(mouseX, mouseY);
}

void launchFirework(float x, float y){
  size = sizeSlider.getValueI();
  num = numParticleSlider.getValueI();
  
  String selectedShape = shapeDropList.getSelectedText();
  
  if (selectedShape.equals("Random")) {
    String[] options = {"Circle", "Heart", "Star", "Square"};
    selectedShape = options[int(random(options.length))];
    
  }
  
  if (ranHue == true) {
    fireworks.add(new Launch(size, random(255), x, 600, y, num, selectedShape));
    
  } 
  else {
    fireworks.add(new Launch(size, hue, x, 600, y, num, selectedShape));
    
  }
}

//Projected Ratings
float calculateRating() {
  int[] possiRating;
  
  enjoyment = size * num * fireworks.size()/600; //how much a user is enjoying the current fireworks
  time = second()-1;
  
  //give a random rating depend on how much they enjoyed the fireworks
  if (enjoyment >= 5) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5};
    if (frameCount % 120 == 0){
      review = ratingsFile[int(random(1, 3))];
      
    }
  } 
  else if (enjoyment >= 4) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5};
    if (frameCount % 120 == 0){
      review = ratingsFile[int(random(4, 6))];
      
    }
  } 
  else if (enjoyment >= 3) {
    possiRating = new int[] {1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5};
    if (frameCount % 120 == 0){
      review = ratingsFile[int(random(7, 9))];
      
    }
  } 
  else if (enjoyment >= 2) {
    possiRating = new int[] {1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (frameCount % 120 == 0){
      review = ratingsFile[int(random(10, 12))];
      
    }
  } 
  else {
    possiRating = new int[] {1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (frameCount % 120 == 0){
      review = ratingsFile[int(random(13, 15))];
      
    }
  }

  int index = int(random(possiRating.length));//choose a random number
  int value = possiRating[index];//pick out a rating from the possible ratings
  
  ratings.add(value); //add value of the rating into a list
  totalRatings = 0; 

  for (int i = 0; i < ratings.size(); i++) {
    totalRatings += ratings.get(i);
    
  }
  
  if (ratings.size() > 0) {
    averageRating = totalRatings / ratings.size();
    
  } 
  else {
    averageRating = 0;
    
  }
  
  return averageRating;
}

void displayReview(){
  String displayRating = "Average Rating: "+averageRating;
  
  fill(0, 0, 255);
  textSize(16);
  text(displayRating, 25, 50);
  text("review:", 25, 75);
  text(review, 25, 100);
  fill(40, 360, 360);
  if (enjoyment >= 1){
    star(90, 70, 6, 14, 5);
  }
  if (enjoyment >= 2){
    star(130, 70, 6, 14, 5);
  }
  if (enjoyment >= 3){
    star(170, 70, 6, 14, 5);
  }
  if (enjoyment >= 4){
    star(210, 70, 6, 14, 5);
  }
  if (enjoyment >= 5){
    star(250, 70, 6, 14, 5);
  }
}

//drawing review star
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
    
  }
  endShape(CLOSE);
  
}
