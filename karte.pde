int stepsX=20;
int stepsY=30;
color colorA;

/**
 * Karte
 *
 * @author: Marcel Schwittlick
 * @email: marzzzel@gmail.com
 * @date: 2011
 *
 * I wanted to create a very typical playingcard backside.
 * Since it was one of my first sketches using Processing there is
 * not a lot of easy changed to be made.
 *
 * Message me if you like it and want to develop it further or want to
 * actually print it and make it a real card game.
 */
void setup() {
  size(770, 1155);
  background(255);
  smooth();
  strokeCap(ROUND);
  //colorA = color(206, 42, 42, 250); //red
  colorA = color(42, 42, 206, 250); //blue
  //colorA = color(42, 206, 42, 250); //green
  //colorA = color(42, 42, 42, 250); //black
  pattern(250);
}

void draw() {
}


void keyReleased() {
  if (key == 's') { 
    saveFrame(timestamp()+".png");
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty.%1$tm.%1$td_%1$tH:%1$tM:%1$tS", now);
}


void bezierRect(float x, float y, float w, float h, float xr, float yr) {
  float w2=w/2f, h2=h/2f, cx=x+w2, cy=y+h2;
  beginShape();
  vertex(cx, cy-h2);
  bezierVertex(cx+w2-xr, cy-h2, cx+w2, cy-h2+yr, cx+w2, cy);
  bezierVertex(cx+w2, cy+h2-yr, cx+w2-xr, cy+h2, cx, cy+h2);
  bezierVertex(cx-w2+xr, cy+h2, cx-w2, cy+h2-yr, cx-w2, cy);
  bezierVertex(cx-w2, cy-h2+yr, cx-w2+xr, cy-h2, cx, cy-h2);
  endShape();
}
void pattern(int alpha1) {
  for (int i=0;i<stepsX;i++) {
    for (int j=0;j<stepsY;j++) {
      //outer pattern
      stroke(colorA); //red, blue, black typical cardcolors
      strokeWeight(5);
      ellipse(i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY/2, width/stepsX, height/stepsY);
      line(i*width/stepsX+width/stepsX/2, j*height/stepsY, i*width/stepsX, j*height/stepsY+height/stepsY/2);
      line(i*width/stepsX+width/stepsX/2, j*height/stepsY, i*width/stepsX+width/stepsX, j*height/stepsY+height/stepsY/2);
      line(i*width/stepsX+width/stepsX, j*height/stepsY+height/stepsY/2, i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY);
      line(i*width/stepsX, j*height/stepsY+height/stepsY/2, i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY);
      stroke(255, 255, 255, alpha1);
      strokeWeight(0.1);
      //ellipse(i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY/2, width/stepsX, height/stepsY);
      line(i*width/stepsX+width/stepsX/2, j*height/stepsY, i*width/stepsX, j*height/stepsY+height/stepsY/2);
      line(i*width/stepsX+width/stepsX/2, j*height/stepsY, i*width/stepsX+width/stepsX, j*height/stepsY+height/stepsY/2);
      line(i*width/stepsX+width/stepsX, j*height/stepsY+height/stepsY/2, i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY);
      line(i*width/stepsX, j*height/stepsY+height/stepsY/2, i*width/stepsX+width/stepsX/2, j*height/stepsY+height/stepsY);
    }
  }
  for (int i=2;i<stepsX-2;i++) {
    for (int j=3;j<stepsY-3;j++) {
      //inner pattern
      stroke(colorA); //red, blue, black typical cardcolors
      strokeWeight(5);
      ellipse(i*width/stepsX+width/stepsX/2+0.5, j*height/stepsY+height/stepsY/2+0.5, width/stepsX/2+1, height/stepsY/2+1);
    }
  }
  //border-line
  stroke(colorA); //red, blue, black typical cardcolors
  strokeWeight(10);
  line(width/stepsX/2, height/stepsY/2, width-stepsX/1.5, height/stepsY/2); 
  line(width/stepsX/2, height/stepsY/2, width/stepsX/2, height-stepsY/2); 
  line(width/stepsX/2, height-stepsY/2, width-stepsX/1.5, height-stepsY/2);
  line(width-stepsX/1.5, height-stepsY/2, width-stepsX/1.5, height/stepsY/2);
  //inner line of border-line
  stroke(255, 255, 255, alpha1);
  strokeWeight(3);
  line(width/stepsX/2, height/stepsY/2, width-stepsX/1.5, height/stepsY/2);
  line(width/stepsX/2, height/stepsY/2, width/stepsX/2, height-stepsY/2);
  line(width/stepsX/2, height-stepsY/2, width-stepsX/1.5, height-stepsY/2);
  line(width-stepsX/1.5, height-stepsY/2, width-stepsX/1.5, height/stepsY/2);
  //crazy bezier
  noFill();
  stroke(colorA);
  strokeWeight(10);
  bezierRect(50, 50, width-100, height-100, 800, 800);
  stroke(255, 255, 255, alpha1);
  strokeWeight(3);
  bezierRect(50, 50, width-100, height-100, 800, 800);
  //curve - ignore comments for next two curves
  strokeWeight(10);
  stroke(colorA);
  curveTightness(15); //-2 //13-20 interesting
  beginShape();
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5*4, height/5); //right upper corner
  curveVertex(width/5*4, height/5); //right upper corner
  curveVertex(width/5*4, height/5*4); //lower right corner
  curveVertex(width/5*4, height/5*4); //lower right corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5, height/5); //left upper corner
  endShape();
  //inner curve
  stroke(255, 255, 255, alpha1);
  strokeWeight(3);
  beginShape();
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5*4, height/5); //right upper corner
  curveVertex(width/5*4, height/5); //right upper corner
  curveVertex(width/5*4, height/5*4); //lower right corner
  curveVertex(width/5*4, height/5*4); //lower right corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5*4); //lower left corner
  curveVertex(width/5, height/5); //left upper corner
  curveVertex(width/5, height/5); //left upper corner
  endShape();
}

