ArrayList<PVector> estrellas = new ArrayList<PVector>();
int minutoAnterior = -1;

void setup() {
  size(900, 700);
  smooth();
}

void draw() {

  int s = second();
  int m = minute();
  int h = hour() % 12;

  if (m != minutoAnterior) {
    estrellas.clear();
    minutoAnterior = m;
  }

  // Cielo degradado simple
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 1);
    stroke(
      lerp(255, 20, s/59.0),
      lerp(140, 20, s/59.0),
      lerp(60, 50, s/59.0)
    );
    line(0, i, width, i);
  }

  // Estrellas con glow
  if (frameCount % 60 == 0) {
    estrellas.add(new PVector(random(width), random(height/2)));
  }

  noStroke();
  for (PVector e : estrellas) {
    fill(255, 80);
    ellipse(e.x, e.y, 10, 10);
    fill(255);
    ellipse(e.x, e.y, 4, 4);
  }

  dibujarBuho();
  dibujarOjo(width/2 - 70, height/2 - 20, 60, h, 12);
  dibujarOjo(width/2 + 70, height/2 - 20, 60, m, 60);
}


// -------- BÚHO CON SOMBRA --------
void dibujarBuho() {

  // sombra
  fill(0, 60);
  ellipse(width/2, height/2 + 160, 200, 40);

  // cuerpo
  fill(130, 85, 45);
  ellipse(width/2, height/2, 300, 300);

  // orejas
  triangle(width/2 - 120, height/2 - 120,
           width/2 - 60, height/2 - 170,
           width/2 - 20, height/2 - 120);

  triangle(width/2 + 120, height/2 - 120,
           width/2 + 60, height/2 - 170,
           width/2 + 20, height/2 - 120);

  // brillo cuerpo
  fill(255, 40);
  ellipse(width/2 - 40, height/2 - 40, 120, 120);

  // patas
  fill(110, 70, 35);
  rect(width/2 - 50, height/2 + 130, 25, 50);
  rect(width/2 + 25, height/2 + 130, 25, 50);

  // pico
  fill(255, 180, 0);
  triangle(width/2 - 18, height/2 + 10,
           width/2 + 18, height/2 + 10,
           width/2, height/2 + 45);
}


// -------- OJOS CON PROFUNDIDAD --------
void dibujarOjo(float x, float y, float radio, int valor, int maximo) {

  noStroke();

  // degradado simple del ojo
  for (int i = int(radio); i > 0; i--) {
    float inter = map(i, 0, radio, 0, 1);
    fill(lerp(220, 255, inter));
    ellipse(x, y, i*2, i*2);
  }

  // rayitas
  stroke(0, 100);
  for (int i = 0; i < 12; i++) {
    float ang = TWO_PI/12 * i - HALF_PI;
    line(
      x + cos(ang)*(radio-6),
      y + sin(ang)*(radio-6),
      x + cos(ang)*radio,
      y + sin(ang)*radio
    );
  }

  // pupila
  float ang = map(valor, 0, maximo, 0, TWO_PI) - HALF_PI;

  noStroke();
  fill(0);
  ellipse(
    x + cos(ang)*35,
    y + sin(ang)*35,
    22, 22
  );

  // brillo pupila
  fill(255, 180);
  ellipse(
    x + cos(ang)*35 - 5,
    y + sin(ang)*35 - 5,
    6, 6
  );
}
