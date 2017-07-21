color boxColor = color(234, 102, 0);

void setup(){
  size(700, 700 ,P3D); //sets screen with the 3d renderer
  noStroke();
}

void draw(){
  
  background(255);
  translate(width/2, height/2, 0); //moves the origin so the shape isn't offscreen
  
  float rx = map(mouseY, 0, height, -PI, PI); //maps mouse locations to numbers between -pi and pi
  float ry = map(mouseX, 0, width, -PI, PI);
  
  rotateX(rx); //rotates x axis using mouse 
  rotateY(ry); //rotates y axis using mouse
  
  int i;
  for(i=0; i<25; i++) {
    box(100, 150+(i*10), 150+(i*10)); //draws boxes
    fill(boxColor+(i*50));
  }
}