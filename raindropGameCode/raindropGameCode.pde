//fix arraylist for raindrop
//fix arraylist for bucket
//fix bucket definition in draw loop

PVector mouse;   //declare a P
int count = 10;
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();
Catcher bucket;

void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  raindrops.add(new Raindrop(new PVector(width/2, 0)));
  bucket = new Catcher(200);
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  colorMode(RGB, 255, 255, 255);
  background(0, 200, 255);
  text("pp", 100, 100);
      bucket.display();

  for (Raindrop r : raindrops) { 
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(mouse, bucket.diam)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.reset();                         //if it is, reset the raindrop
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.reset();                           //if it does, reset the raindrop
    }

  }
}