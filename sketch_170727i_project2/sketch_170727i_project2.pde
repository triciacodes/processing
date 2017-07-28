// - - - - - PROJECT 2 SUMMARY - - - - - 
// Tricia Leach
// MUC 272
// PCC - Summer 2017
// I focused on learning how to use translate to make objects appear
// exactly in the place I wanted them to be in 3D space. I also
// wanted to simulate a gradient by building boxes on top of each 
// other. The collection of shapes moves with up and down mouse movement.


// - - - - - VARIABLES - - - - - 

int colorR = 235;
int colorG = 100;
int colorB = 0;
color colorBox = color(colorR, colorG, colorB);
float elapsedTime;
int boxWidth = 50; // sets size of ind boxes that make up larger panels
int boxHeight = 50; // sets size of ind boxes that make up larger panels
int boxDepth = 4; // sets size of ind boxes that make up larger panels
int transIncrement = 140; // sets spacing between boxes that make up the larger panels


// - - - - - SETUP - - - - - 

void setup(){
  
  fullScreen(P3D, 1);
  noStroke();
  
  // most of these are the camera defaults
  // -1 in third from last parameter turns the view from vertical to horizontal
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
      width/2.0, height/2.0, 0, -1, 0, 0);
      
}


// - - - - - DRAW - - - - - 

void draw(){
  
  background(255);
  
  //moves the origin so the shape isn't offscreen
  // last parameter zooms out
  translate((width/2), (height/2), -800);
  
  //maps mouse locations to numbers between -pi and pi
  float rx = map(mouseY, 0, height, -PI, PI);
  float ry = map(mouseX, 0, width, -PI, PI);
  rotateX(0); // no rotation
  rotateY(rx); // rotates y axis using mouse; had to use rx because of camera tilt
  
  // makes 36 panels of the larger grids (25 squares each)
  int d;
  for(d=0; d<36; d++) {
    
    rotateX(90); // makes the larger panels rotate into the spiral
  
    // makes full panel of 25 boxes
    // this step makes five columns of five boxes down
    int c;
    for(c=0; c<5; c++) {
    
      // makes a single column of five boxes
      int b;
      for(b=0; b<5; b++) {
        
        // creates an individual box
        
        // making 2nd parameter 0 makes a happy accident - investigate later
        translate(0, (transIncrement*1), 0);
        int i;
        
        // this stacks boxes within boxes, getting progressively larger
        for(i=0; i<25; i++) {
          // not sure what the +(i*25) is doing to fill color below
          // it turns box from flat orange color to shimmery two color
          // it's turning color into a negative 7 digit value, and adding 25
          fill(colorBox+(i*25));
          // println(boxColor+(i*25));
          box(boxWidth+(i*2), boxHeight+(i*2), boxDepth); // draws boxes
        }
        
      }
      
      // moves back up to the top before starting to create another column
      translate((transIncrement*1), (transIncrement*-5), 0);
    }
    
    // moves back up to the top left corner creating another full 25 square grid
    // changing these makes some good happy accidents too
    // last parameter moves the square grid back in space, so they are not stacked on top of each other
    translate((transIncrement*-5), (transIncrement*0), (transIncrement/2));
    
  }
    
}