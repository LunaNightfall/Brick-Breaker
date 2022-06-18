void intro() {
  intro.play();
  background(lightorange);
  image(background, 0, 0, width, height);
  
  //Text
  textSize(100);
  fill(lightorange);
  text("BrICk", width/2, 200);
  text("bReAkeR", width/2, height/2);
  
  textSize(50);
  fill(lightorange);
  text("[click to play]", width/2, 500);
}

void introClicks() {
  mode = GAME;
}
