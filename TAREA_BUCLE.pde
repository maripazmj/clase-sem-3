//Maria Paz Mojica, Repetición
int incremento = 50;

void setup() {
  size(500, 500);
  background(255);
  noLoop();
}

void draw() {
  //y += incremento
  //y = y + incremento
  //for loop
  //variable, condicion, incremento
  for (int y = 0; y <= height; y += incremento) {
    for (int x = 0; x <= width; x += incremento) {
      noStroke();
      fill(random(230,255), random(230,255), random(230,255));
     
      //colores pastel
      rect(x, y, incremento, incremento);
       fill(random(180,255), random(170,240), random(200,255));
      triangle(
        x + incremento/2, y,
        x, y + incremento,
        x + incremento, y + incremento
      );
          // triangulo invertido para rellenar huecos
      fill(random(180,255), random(170,240), random(200,255));
      triangle(
        x, y,
        x + incremento, y,
        x + incremento/2, y + incremento
      );
       fill(255); 
      circle(x + incremento/2, y + incremento/2, incremento/3);
    }
  }
}

