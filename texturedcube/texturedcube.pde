PImage diamond, dirt, grass_side, grass_top;
float rotx, roty; 
void setup() {
  size(800, 800, P3D);
  rotx = radians(45); 
  roty = radians(45); 
  diamond = loadImage("diamond (1).png");
  dirt = loadImage("dirt.png");
  grass_side = loadImage("grass_side.png");
  grass_top = loadImage("grass_top.png");

  textureMode(NORMAL);
}

void draw() {
  background(0); 
  cube(width/2+100, height/2+100, 0, diamond, diamond, diamond, diamond, diamond, diamond); 
  cube(width/2-100, height/2-100, 0, grass_top, dirt, grass_side, grass_side, grass_side, grass_side); 

  //cube(width/2-100, height/2-100, 0, color(65), 100);
}

void mouseDragged() {
  rotx = rotx + (pmouseY-mouseY) * .01; 
  roty = roty + (pmouseX - mouseX) * -.01;
}

void cube(float posX, float posY, float posZ, PImage top, PImage bottom, PImage front, PImage back, PImage left, PImage right) {
  pushMatrix(); 
  translate(posX, posY, posZ); 
  scale(200);   
  rotateX(rotx); 
  rotateY(roty); 

  noStroke();  

  beginShape(QUADS);
  texture(top); 
  //top
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 0, 1); 
  vertex(1, 0, 1, 1, 1); 
  vertex(0, 0, 1, 1, 0); 
  endShape();


  beginShape(QUADS);
  texture(bottom); 

  //bottom
  vertex(0, 1, 0, 0, 0); 
  vertex(1, 1, 0, 0, 1); 
  vertex(1, 1, 1, 1, 1); 
  vertex(0, 1, 1, 1, 0); 
  endShape(); 

  beginShape(QUADS);
  texture(front);

  //front
  vertex(0, 0, 1, 0, 0); 
  vertex(0, 1, 1, 0, 1); 
  vertex(1, 1, 1, 1, 1); 
  vertex(1, 0, 1, 1, 0); 
  endShape();

  beginShape(QUADS);
  texture(back);

  //back
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 1, 0, 0, 1); 
  vertex(1, 1, 0, 1, 1); 
  vertex(1, 0, 0, 1, 0);
  endShape();

  beginShape(QUADS);
  texture(left);

  //left
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 1, 0, 0, 1); 
  vertex(0, 1, 1, 1, 1); 
  vertex(0, 0, 1, 1, 0); 
  endShape();

  beginShape(QUADS);
  texture(right);

  //right
  vertex(1, 0, 0, 0, 0); 
  vertex(1, 1, 0, 0, 1); 
  vertex(1, 1, 1, 1, 1); 
  vertex(1, 0, 1, 1, 0); 

  endShape();

  popMatrix();
}
