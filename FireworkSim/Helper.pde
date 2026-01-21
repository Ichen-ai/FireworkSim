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

  if (enjoyment >= 5) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5};
  } else if (enjoyment >= 4) {
    possiRating = new int[] {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5};
  } else if (enjoyment >= 3) {
    possiRating = new int[] {1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5};
  } else if (enjoyment >= 2) {
    possiRating = new int[] {1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
  } else {
    possiRating = new int[] {1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
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
  
  println(averageRating);
  
  return averageRating;
}
