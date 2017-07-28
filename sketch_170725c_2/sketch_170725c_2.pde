color boxColor = color(234, 102, 0);

void setup(){
  size(900, 700, P3D); //sets screen with the 3d renderer
}

void draw() {
  background(255);
  makeBox(20, 20, 20);
  
}

void makeBox(float x, float y, float z) {
  
  translate(width/10, width/10, 0);
  
  float rx = map(mouseY, 0, height, -PI, PI); //maps mouse locations to numbers between -pi and pi
  float ry = map(mouseX, 0, width, -PI, PI);
  noStroke();
  rotateX(rx); //rotates x axis using mouse 
  rotateY(ry); //rotates y axis using mouse
  fill(100, 0, 223, 100);
  box(x, y, z); 
  
  if(z < 500) {
    makeBox(x + 10, y + 10, z + 10);
  }
}