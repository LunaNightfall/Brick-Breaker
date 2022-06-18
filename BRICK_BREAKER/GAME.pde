void game() {
  intro.play();
  background(lightorange);

  //paddle----------------------
  fill(red);  //draw paddle
  circle(px, py, pd);
  if (akey == true) px = px - 5;    //key movement
  if (dkey == true) px = px + 5;

  //boundaries
  px = max(px, 0);
  px = min(px, width);

  //ball------------------
  fill(white);
  circle(bx, by, bd);
  if (timer < 0) {
    bx = bx + vx;
    by = by + vy;
  }
  timer = timer - 1;

  //bouncing
  if (dist(bx, by, px, py) < bd/2 + pd/2) { //paddle
    bouncing.rewind();
    bouncing.play();
    vx = (bx - px)/10;
    vy = (by - py)/10;
  }

  if (by < bd/2) { //bounce off top,
    bouncing.rewind();
    bouncing.play();
    vy = vy * -1;
  }


  if (bx < bd/2 || bx > width-bd/2) {
    bouncing.rewind();
    bouncing.play();
    vx = vx * -1;
  }
  
  //lose life
  if (by > height) {
    lives = lives -1;
    loselife.rewind();
    loselife.play();
    bx = width/2;
    by = height-200;
    timer = 100;
  }

  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i = i + 1;
  }

  fill(blue);
  textSize(20);
  text("Lives:" + lives, 500, 450);

  fill(blue);
  textSize(20);
  text("Score:" + score, 100, 450);

  //GAMEOVER
  if (lives == 0) {
    mode = GAMEOVER;
    lose.rewind();
    lose.play();
  }
  
  if (score == 15) {
    mode = GAMEOVER;
    win.rewind();
    win.play();
  }
}

void gameClicks() {
  mode = PAUSE;
}

void manageBrick(int i ) {
  if (y[i] == 100) fill(purple);
  if (y[i] == 200) fill(pink);
  if (y[i] == 300) fill(green);
  circle (x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) { //brick collisions
    score++;
    scoring.rewind();
    scoring.play();
    vx = (bx - x[i])/10;
    vy = (by - y[i])/10;
    alive [i] = false;
  }
}
