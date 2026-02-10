float posX = 0;
float posY = 0;

float velX = 3;
float velY = 3;

void setup() {
  size(1000, 1000);
}

void draw() {

  background(255);

  posX += velX;
  posY += velY;

  // rebote derecha
  if (posX > width) {
    velX = -velX;
  }

  // rebote izquierda
  if (posX < 0) {
    velX = -velX;
  }

  // rebote abajo
  if (posY > height) {
    velY = -velY;
  }

  // rebote arriba
  if (posY < 0) {
    velY = -velY;
  }

  circle(posX, posY, 100);
}
