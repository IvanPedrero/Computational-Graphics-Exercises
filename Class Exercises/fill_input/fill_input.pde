boolean filled = true;

enum FIGURE{
  point, 
  line,
  rectangle,
  ellipse
};
FIGURE currentFigure = FIGURE.point;

enum COLOUR{
  blue,
  orange,
  green,
  yellow,
  black,
  white
}
COLOUR currentColour = COLOUR.blue;

class Drawing{
  FIGURE figure;
  COLOUR colour;
  boolean filled = false;
  PVector p1;
  
  void display(){
    stroke(getColor(colour));
    if(filled){
      fill(getColor(colour));
    }else{
      noFill();
    }
    switch(figure){
      case point:  
        circle(p1.x, p1.y, 50);
        break;
      case line:
        strokeWeight(5);
        line(p1.x, p1.y, p1.x+100, p1.y+100);
        strokeWeight(1);
        break;
      case rectangle:
        rect(p1.x, p1.y, 150, 100);
        break;
      case ellipse:
        ellipse(p1.x, p1.y, 150, 100);
        break;
       default:
    }
  }
}

ArrayList<Drawing> drawings = new ArrayList<Drawing>();

void setup(){
  size(700, 900);
}

void draw(){
  background(255);
  drawFilledOptions(filled);
  drawFigureOptions(currentFigure);
  drawColorOptions(currentColour);
  drawDeleteOption();
  printDrawings();
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
}

void drawColorOptions(COLOUR colour){
  stroke(0);
  textSize(32);
  fill(0, 102, 153);
  text("Colour : ", 10, 480);
  
  noFill();
  fill(getColor(COLOUR.blue));
  rect(20, 500, 30, 30);
  fill(getColor(COLOUR.orange));
  rect(60, 500, 30, 30);
  fill(getColor(COLOUR.green));
  rect(20, 550, 30, 30);
  fill(getColor(COLOUR.yellow));
  rect(60, 550, 30, 30);
  fill(getColor(COLOUR.black));
  rect(20, 600, 30, 30);
  fill(getColor(COLOUR.white));
  rect(60, 600, 30, 30);
  
  stroke(255,0,0);
  noFill();
  switch(colour){
    case blue:
      circle(35, 515, 50);
      break;
    case orange:
      circle(75, 515, 60);
      break;
    case green:
      circle(35, 565, 60);
      break;
    case yellow:
      circle(75, 565, 60);
      break;
    case black:
      circle(35, 615, 60);
      break;
    case white:
      circle(75, 615, 60);
      break;
    default:
      circle(75, 615, 60);
      break;
  }
}

void drawDeleteOption(){
  stroke(0);
  textSize(32);
  fill(255, 0, 0);
  text("DELETE", 20, 850);
}

color getColor(COLOUR colour){
  switch(colour){
    case blue:
      return color(50, 200, 255);
    case orange:
      return color(255, 150, 50);
    case green:
      return color(100, 255, 50);
    case yellow:
      return color(250, 250, 50);
    case black:
      return color(0);
    case white:
      return color(255);
    default:
      return color(255);
  }
}

void mouseClicked() {
  // Fill picker :
  if(overOption(30, 30, 60, 90)){
    filled = true;
  }
  else if(overOption(110, 30, 60, 90)){
    filled = false;
  }
  
  // Figure picker :
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
  
  // Colour picker : 
  else if(overOption(20, 500, 30, 30)){
    currentColour = COLOUR.blue;
  }
  else if(overOption(60, 500, 30, 30)){
    currentColour = COLOUR.orange;
  }
  else if(overOption(20, 550, 30, 30)){
    currentColour = COLOUR.green;
  }
  else if(overOption(60, 550, 30, 30)){
    currentColour = COLOUR.yellow;
  }
  else if(overOption(20, 600, 30, 30)){
    currentColour = COLOUR.black;
  }
  else if(overOption(60, 600, 30, 30)){
    currentColour = COLOUR.white;
  }
  
  // Delete option : 
  else if(overOption(10, 820, 140, 100)){
    deleteDrawings();
  }  
}

void mousePressed(){
  // Avoid contact with the options menu.
  if(mouseX <= 240){
    return;
  }
  
  Drawing d = new Drawing();
  
  d.figure = currentFigure;
  d.colour = currentColour;
  d.filled = filled;
  d.p1 = new PVector(mouseX, mouseY);
  
 drawings.add(d);
 
}

void mouseReleased(){
  // TODO: Check for release of the mouse to draw a figure.
}

void printDrawings(){
  for (int i = 0; i < drawings.size(); i++) {
    Drawing d = drawings.get(i);
    d.display();
  }
}

void deleteDrawings(){
  for (int i = drawings.size(); i-- != 0; drawings.remove(i));
}

boolean overOption(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
