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
  float enjoyment = size * num * fireworks.size() / 1200;
  int[] possiRating;
  
  time = second()-1;
  
  if (enjoyment >= 5) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5};
    if (time == startTime){
      review = fiveStar[int(random(1))];
    }
  } 
  else if (enjoyment >= 4) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5};
    if (time == startTime){
      review = fourStar[int(random(1))];
    }
  } 
  else if (enjoyment >= 3) {
    possiRating = new int[] {1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5};
    if (time == startTime){
      review = threeStar[int(random(1))];
    }
  } 
  else if (enjoyment >= 2) {
    possiRating = new int[] {1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (time == startTime){
      review = twoStar[int(random(1))];
    }
  } 
  else {
    possiRating = new int[] {1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
    if (time == startTime){
      review = oneStar[int(random(1))];
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
  
  println(time);
  println(startTime);
  println(review);
  
  return averageRating;
}
