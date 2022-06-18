void pause() {
  intro.pause();
  background(lightorange);
  image(background, 0, 0, width, height);
  
  //Text
  textSize(100);
  fill(lightorange);
  text("PAUSE", width/2, 200);
  
  textSize(50);
  fill(lightorange);
  text("[click to resume]", width/2, 500);
}

void pauseClicks() {
  mode = GAME;
}
