PVector mouse;   //declare a P
int time;
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();
Catcher bucket;
int lives = 10;
int score = 0;
char handicap = '0';
float gameMode = 1;

void setup() {
  size(600, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  raindrops.add(new Raindrop(new PVector(width/2, 0)));
  bucket = new Catcher(75);
  time = 0;
}

void draw() {
  if (gameMode == 1) {
    background(0, 200, 255);
    textAlign(CENTER, BOTTOM);
    text("Welcome to raindrops!", width/2, 100);
    text("Catch raindrops with the bucket by moving your mouse!", width/2, 150);
    text("The default amount of lives is 10", width/2, 200);
    text("To change this, press 'h'", width/2, 250);
    text("To start the game, press the space bar", width/2, 300);
  }
  
 if (gameMode == 2) { //lives for lives
    fill (200, 200, 200); //reset background
    background(0, 200, 255);
    text("Set lives between 1 and 10", width/2, height/2-50); //player 1 lives 1 to 7
    text(lives, width/2, height/2);
    text("Press Space to continue", width/2, height/2 + 50); //space to start
    char handicap = '0';
      switch(key) { //keyswitch
        case '1':
          lives = 1;
          text(lives, 500, 600);
          break;        
        case '2':
          lives = 2;
          text(lives, 500, 600);
          break;
        case '3':
          lives = 3;
          text(lives, 500, 600);
          break;
        case '4':
          lives = 4;
          text(lives, 500, 600);
          break;
        case '5':
          lives = 5;
          text(lives, 500, 600);
          break;
        case '6':
          lives = 6;
          text(lives, 500, 600);
          break;
        case '7':
          lives = 7;
          text(lives, 500, 600);
          break;          
        case '8':
          lives = 8;
          text(lives, 500, 600);
          break;     
        case '9':
          lives = 9;
          text(lives, 500, 600);
          break;      
        }
    }
  
  if (gameMode == 3) {
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    colorMode(RGB, 255, 255, 255);
    background(0, 200, 255);
    textSize(30);
    fill(255);
    background(0, 200, 255);   
    textAlign(LEFT, BOTTOM);
    text("Lives: " + lives, 100, 100);
    text("Score: " + score, 100, 200);
    bucket.display();
  
    for (Raindrop r : raindrops) { 
      r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.display();      //display the raindrop
      if (r.isInContactWith(mouse, bucket.diam)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.reset();                         //if it is, reset the raindrop
        score++;
      }
      if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.reset();                           //if it does, reset the raindrop
        lives--;  //subtract from score
      }
    }
    
    time++;
    if (time > 100){
      raindrops.add(new Raindrop(new PVector(random(width),0)));
      time = 0;
    }
    
    if (lives == 0){
      gameMode = 4;
    }
  }
  
  if (gameMode == 4) {
    fill (200, 200, 200); //clear background
    background(0,200,255);
    textAlign(CENTER, BOTTOM); //change text align mode    
    text ("Oh no! You ran out of lives!", width/2, height/2-50);
    text ("Press space to play again", width/2, height/2+50); //reset game
  }
}

void keyReleased () {
  fill (200, 200, 200); //clear background
  background(0,200,255); 
  if (gameMode == 1) { 
    if (key == ' ') {//start screen to game
      gameMode = 3;
    }
    if (key == 'h') {//start screen to Lives handicap
      gameMode = 2;
    }
    }
 else if (gameMode == 2) {
    if (key == ' ') { //Lives handicap to game start
      gameMode = 3;
    }
    }
 else if (gameMode == 4) { //win screen to home screen
    if (key == ' ') {
      gameMode = 1;
    }
    }
}