import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Alina Cheung
//June 14, 2022
//2-4

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//SOUND Variables
Minim minim;
AudioPlayer bouncing, scoring, intro, win, lose, loselife;

//COLOR
color white = #ffffff;
color black = #000000;
color lightorange = #F59228;
color blue = #3428F5;
color red = #D8111F;
color purple = #9828F5;
color pink = #F528E1;
color green = #43BC22;

//IMAGE
PImage background;

//SCORING
int lives, score, timer;

//Game entities
float bx, by, bd, vx, vy, px, py, pd;

//keyboard varibles
boolean akey, dkey;

//Arrays
int [] x;
int [] y;
boolean [] alive;
int brickd;
int n;
int tempx, tempy;

void setup() {
  size (600, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  
  //SET UP PADDLE AND BALL
  bx = width/2;
  by = height - 200;
  bd = 20;
  px = width/2;
  py = height;
  pd = 100;
  
  //initialize keys
  akey = dkey = false;
  
  ///MINIM
  minim = new Minim(this);
  intro = minim.loadFile("intro.mp3");
  win = minim.loadFile("win.wav");
  lose = minim.loadFile("lose.wav");
  bouncing = minim.loadFile("bouncing.wav");
  scoring = minim.loadFile("score.wav");
  loselife = minim.loadFile("loselife.wav");
  
  //IMAGE
  background = loadImage("background.jpg");
  
  //Target initialization
  lives = 3;
  score = 0;
  timer = 100;
  vx = 0;
  vy = 5;
  
  //brick
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

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause(); 
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
