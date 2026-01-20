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

//Projected Rating, how much people are enjoying the show and likelihood they will tell a friend for next year
//calculated with 1000 ratings with higher likelyhood for good ratings based on size of fire and how much fireworks are in the sky at once
void rating(){
  float enjoyment = size*num*fireworks.size()/1500;
  
  if (enjoyment >= 5){
    int [] possiRating = {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5};
  }
  else if (enjoyment >= 4){
    int [] possiRating = {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5};
  }
  else if (enjoyment >= 3){
    int [] possiRating = {1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5};
  }
  else if (enjoyment >= 2){
    int [] possiRating = {1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
  }
  else{
    int [] possiRating = {1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5};
  }
  
  for (int i = 0; i <= 1000; i++){
    rating.append(possiRating.get(int(random(14))));
  }
}
