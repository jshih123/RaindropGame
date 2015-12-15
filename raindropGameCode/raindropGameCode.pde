PVector mouse;   //declare a P
int count = 10;
Raindrop[] r = new Raindrop[count];
Catcher bucket;

void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i = 0; i < count; i++){
    r[i] = new Raindrop(new PVector(random(0,width), 0));   //Initialize r. The parameters used are the initial x and y positions
  }
  bucket = new Catcher(200);
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  colorMode(RGB, 255, 255, 255);
  background(0, 200, 255);
  bucket.display();
    
  for (int i = 0; i < count; i++){ 
   r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
   r[i].display();      //display the raindrop
   if (r[i].isInContactWith(mouse, bucket.diam)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset the raindrop
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
    }
  }
  
}