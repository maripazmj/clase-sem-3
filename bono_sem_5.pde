int centroHorizontal;
int centroVertical;

float distancia;

void setup() {
  size(1000, 1000);
  centroHorizontal = width/2;
  centroVertical = height/2;
}


void draw() {
  background(255);
  println(mouseY);
  
  //x1 , y1, x2, y2
//calcular la distancia entre el mouse y el centro del lienzo
 distancia = dist(mouseX, mouseY, centroHorizontal, centroVertical);

if (mouseX > centroHorizontal - 100 && mouseX < centroHorizontal + 100 &&
      mouseY > centroVertical - 150 && mouseY < centroVertical + 150) {

    ellipse(centroHorizontal, centroVertical, 100, 100); 
 
rectMode(CENTER);
rect(centroHorizontal, centroVertical, 200, 300);
      }
}
