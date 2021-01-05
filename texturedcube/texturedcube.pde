PImage diamond;
float rotx, roty; 

void setup() {
  size(800, 800, P3D);
  rotx = radians(45); 
  roty = radians(45); 
  diamond = loadImage("diamond (1).png");
  textureMode(NORMAL);
}

void draw() {
  background(0); 
  cube(width/2+100, height/2+100, 0, color(255, 204, 0), 100); 
  //cube(width/2-100, height/2-100, 0, color(65), 100);
}

void mouseDragged() {
  rotx = rotx + (pmouseY-mouseY) * .01; 
  roty = roty + (pmouseX - mouseX) * -.01;
}

void cube(float posX, float posY, float posZ, color Color, float size) {
  pushMatrix(); 
  translate(posX, posY, posZ); 
  scale(200);   
  rotateX(rotx); 
  rotateY(roty); 

  noStroke();  

  beginShape(QUADS);
  texture(diamond); 

  //top
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 1, 0); 
  vertex(1, 0, 1, 1, 1); 
  vertex(0, 0, 1, 0, 1); 

  //bottom
  vertex(0, 1, 0, 0, 0); 
  vertex(1, 1, 0, 1, 0); 
  vertex(1, 1, 1, 1, 1); 
  vertex(0, 1, 1, 0, 1); 

  //front
  vertex(0, 0, 1, 0, 0); 
  vertex(0, 1, 1, 1, 0); 
  vertex(1, 1, 1, 1, 1); 
  vertex(1, 0, 1, 1, 1); 

  //back
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 1, 0, 1, 0); 
  vertex(1, 1, 0, 1, 1); 
  vertex(1, 0, 0, 0, 1); 

  //left
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 1, 0, 1, 0); 
  vertex(0, 1, 1, 1, 1); 
  vertex(0, 0, 1, 0, 1); 

  //right
  vertex(1, 0, 0, 0, 0); 
  vertex(1, 1, 0, 1, 0); 
  vertex(1, 1, 1, 1, 1); 
  vertex(1, 0, 1, 0, 1); 

  endShape();

  popMatrix();
}
