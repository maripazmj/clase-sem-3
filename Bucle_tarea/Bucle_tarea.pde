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
      fill(150, 200, 30);
      fill(random(0,100), random(200, 255), random(150, 200)); //RGB
      rect(x, y, incremento, incremento);
      ellipse (x, y, 50, 70);
    }
  }
}
