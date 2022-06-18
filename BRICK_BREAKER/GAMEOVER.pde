void gameover() {
  intro.pause();
  background(lightorange);
  image(background, 0, 0, width, height);

  if (lives == 0) {
    fill(lightorange);
    textSize(100);
    text("YOU LOSE!", width/2, 200);
    textSize(50);
    text("click to return", width/2, 500);
  } else if (score == 15) {
    fill(lightorange);
    textSize(100);
    text("YOU WIN!", width/2, 200);
    textSize(50);
    text("click to return", width/2, 500);
  }
}

void gameoverClicks() {
  mode = INTRO;

  //Target initialization
  lives = 3;
  score = 0;
  timer = 100;
  vx = 0;
  vy = 5;

  //SET UP PADDLE AND BALL
  bx = width/2;
  by = height - 200;
  bd = 20;
  px = width/2;
  py = height;
  pd = 100;

  //Bricks
  brickd = 50;
  n = 15;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i=i+1;
  }
}
