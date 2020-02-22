boolean overOption1;
boolean filled = true;

enum FIGURE{
  point, 
  line,
  rectangle,
  ellipse
};

FIGURE currentFigure = FIGURE.point;

void setup(){
  size(500, 900);

}

void draw(){
  background(255);
  drawFilledOptions(filled);
  drawFigureOptions(currentFigure);
}

void drawFilledOptions(boolean filled){
  stroke(0);
  textSize(32);
  fill(0, 102, 153);
  text("Filled?", 10, 30); 
  
  fill(0, 102, 153);
  triangle(30, 100, 60, 50, 90, 100);

  noFill();
  triangle(110, 100, 140, 50, 170, 100);
  
  stroke(255, 0, 0);
  if(filled){
    circle(60, 80, 80);
  }else{
    circle(140, 80, 80);
  }
  
  drawTestCircle();
}

void drawFigureOptions(FIGURE figure){
  stroke(0);
  textSize(32);
  fill(0, 102, 153);
  text("Figure : ", 10, 200); 
  
  fill(0);
  textSize(24);
  text("Point", 20, 250);
  fill(0);
  circle(125, 240, 20);
  
  fill(0);
  textSize(24);
  text("Line", 20, 300);
  fill(0);
  line(110, 280, 170, 300);
  
  fill(0);
  textSize(24);
  text("Rect", 20, 350);
  fill(0);
  rect(110, 320, 70, 30);
  
  fill(0);
  textSize(24);
  text("Elipse", 20, 400);
  fill(0);
  ellipse(145, 390, 70, 30);
  
  noFill();
  stroke(255,0,0);
  switch(figure){
    case point:  
      rect(10, 210, 200, 50);
      break;
    case line:
      rect(10, 260, 200, 50);
      break;
    case rectangle:
      rect(10, 310, 200, 50);
      break;
    case ellipse:
      rect(10, 360, 200, 50);
      break;
     default:
  }
  stroke(0);
  
  drawTestFigure(figure);
}

void mousePressed() {
  // Click on filled option!
  if(overOption(30, 30, 60, 90)){
    filled = true;
  }
  
  // Click on no fill option!
  else if(overOption(110, 30, 60, 90)){
    filled = false;
  }
  
  // Click on the point option.
  else if(overOption(20, 230, 180, 30)){
    currentFigure = FIGURE.point;
  }
  
  else if(overOption(15, 280, 180, 30)){
    currentFigure = FIGURE.line;
  }
  
  else if(overOption(15, 330, 180, 30)){
    currentFigure = FIGURE.rectangle;
  }
  
  else if(overOption(15, 380, 180, 30)){
    currentFigure = FIGURE.ellipse;
  }
}

boolean overOption(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

// TESTING :

void drawTestCircle(){
  if(filled){
     fill(255, 0 ,0);
  }else{
    noFill();
  }
  circle(400,100, 150);
}

void drawTestFigure(FIGURE figure){
  noFill();
  switch(figure){
    case point:  
      circle(width-100, height/3, 80);
      break;
     case line:
      strokeWeight(5);
      line(width-200, height/4, width-70, height/2);
      strokeWeight(1);
      break;
     case rectangle:
      rect(width-200, height/4, 150, 150);
      break;
     case ellipse:
      ellipse(width-130, height/3, 150, 100);
      break;
     default:
       System.out.println("NOTHING");
  }
  fill(0);
}
