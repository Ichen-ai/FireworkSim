//mouse press to launch firework
void mousePressed(){
  launchFirework(mouseX, mouseY);
}

void launchFirework(float x, float y){
  size = sizeSlider.getValueI();
  num = numParticleSlider.getValueI();
  
  if (ranHue == true){fireworks.add(new Launch(size, random(255), x, 600, y, num));}
  else{fireworks.add(new Launch(size, hue, x, 600, y, num));}
}

//Projected Rating
float calculateRating() {
  float enjoyment = size * num * fireworks.size()/600;
  int[] possiRating;
  
  time = second()-1;
  
  if (enjoyment >= 5) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5};
    if (time == startTime){
      review = ratingsFile[int(random(1, 3))];
    }
  } 
  else if (enjoyment >= 4) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5};
    if (time == startTime){
      review = ratingsFile[int(random(4, 6))];
    }
  } 
  else if (enjoyment >= 3) {
    possiRating = new int[] {1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5};
    if (time == startTime){
      review = ratingsFile[int(random(7, 9))];
    }
  } 
  else if (enjoyment >= 2) {
    possiRating = new int[] {1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (time == startTime){
      review = ratingsFile[int(random(10, 12))];
    }
  } 
  else {
    possiRating = new int[] {1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (time == startTime){
      review = ratingsFile[int(random(13, 14))];
    }
  }

  int index = int(random(possiRating.length));
  int value = possiRating[index];
  ratings.add(value);

  totalRatings = 0; 

  for (int i = 0; i < ratings.size(); i++) {
    totalRatings += ratings.get(i);
  }
  
  if (ratings.size() > 0) {
    averageRating = totalRatings / ratings.size();
  } else {
    averageRating = 0;
  }
  
  return averageRating;
}

void displayReview(){
  String displayRating = "Rating: "+averageRating;
  
  fill(0, 0, 255);
  textSize(16);
  text(displayRating, 25, 50);
  text("review:", 25, 75);
  text(review, 25, 100);
  
}
