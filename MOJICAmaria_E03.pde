//Maria Paz Mojica, Movimiento
//NOSTALGIA GAMER


float tiempo = 0; 

// nubes
float nube1X = 200;
float nube2X = 700;

// estrellas
int estrellas = 80;
float[] starX = new float[estrellas];
float[] starY = new float[estrellas];

// creeper
float creeperX = -100;

// lluvia
int gotas = 120;
float[] lluviaX = new float[gotas];
float[] lluviaY = new float[gotas];
float[] velLluvia = new float[gotas];
boolean lloviendo = false;

// flores
float vientoTiempo = 0;


void setup() {

  size(1000, 600);
  rectMode(CENTER);
  noStroke();

  // estrellas
  for(int i=0;i<estrellas;i++){
    starX[i] = random(width);
    starY[i] = random(260);
  }

  // lluvia
  for(int i=0;i<gotas;i++){
    lluviaX[i] = random(width);
    lluviaY[i] = random(height);
    velLluvia[i] = random(4,8);
  }
}


void draw() {

  tiempo += 0.01;
  vientoTiempo += 0.05;

  if (tiempo > TWO_PI) tiempo = 0;

  // lluvia cada cierto tiempo(busque para saber poner la
  //lluvia temporal
  if(frameCount % 600 == 0){
    lloviendo = !lloviendo;
  }

  float horizonteY = 260;
  float centroX = width/2;
  float ciclo = sin(tiempo);

  // cielo
  color cieloDia = color(135,206,235);
  color atardecer = color(255,140,60);
  color noche = color(20,20,60);

  color cielo;

  if(ciclo > 0){
    cielo = lerpColor(atardecer, cieloDia, ciclo);
  } else {
    cielo = lerpColor(atardecer, noche, abs(ciclo));
  }

  // oscurecer si llueve
  if(lloviendo){
    cielo = lerpColor(cielo, color(90,90,120), 0.5);
  }

  background(cielo);

  // estrellas
  if(ciclo < 0){
    fill(255);
    for(int i=0;i<estrellas;i++){
      circle(starX[i], starY[i], 3);
    }
  }

  // sol / luna(abs sirve para saber si el sol o 
  //la luna ya se alejaron mucho y hacer que se devuelvan)
  float altura = 180;
  float yCeleste = horizonteY - abs(ciclo) * altura;

  if(ciclo > 0){
    fill(255,200,0);
    rect(centroX, yCeleste, 100, 100);
  } else {
    fill(230);
    rect(centroX, yCeleste, 90, 90);
  }

  // pasto
  rectMode(CORNER);

  if(lloviendo){
    fill(30,110,50);
  } else {
    fill(40,130,60);
  }

  rect(0, horizonteY, width, height-horizonteY);

  // nubes
  fill(255);
  nube(nube1X, 120);
  nube(nube2X, 90);

  nube1X += 0.3;
  nube2X += 0.2;

  if(nube1X > width+150) nube1X = -150;
  if(nube2X > width+150) nube2X = -150;

  dibujarCasa();
  dibujarFlores();
  dibujarCreeper();

  if(lloviendo){
    dibujarLluvia();
  }
}


// nubess
void nube(float x, float y){
  rect(x,y,80,40);
  rect(x+60,y-20,80,40);
  rect(x+120,y,80,40);
}


// casita
void dibujarCasa(){

  rectMode(CORNER);

  float baseX = width/2;
  float baseY = 380;

  fill(110,55,25);
  rect(baseX-220, baseY, 440, 90);

  fill(85,40,20);
  rect(baseX-240, baseY+70, 480, 30);

  fill(130,70,35);
  rect(baseX-180, baseY-40, 360, 40);
  
  fill(90,45,25);
  rect(baseX-200, baseY+80, 400, 40);

  fill(170,110,70);
  rect(baseX-180, baseY+120, 360, 130);

  fill(90,50,30);
  rect(baseX-30, baseY+160, 60, 90);

  fill(200,230,255);
  rect(baseX-140, baseY+150, 60, 50);
  rect(baseX+80, baseY+150, 60, 50);
}


// flores
void flor(float x, float y){

  rectMode(CENTER);

  fill(40,130,60);
  rect(x, y, 8, 40);

  fill(255,100,150);
  rect(x-12, y-25, 15, 15);
  rect(x+12, y-25, 15, 15);
  rect(x, y-37, 15, 15);
  rect(x, y-13, 15, 15);

  fill(255,220,0);
  rect(x, y-25, 12, 12);
}


// flores
void dibujarFlores(){

  float viento = sin(vientoTiempo) * 5;

  flor(200 + viento, 520);
  flor(260 + viento, 540);
  flor(700 + viento, 520);
  flor(760 + viento, 540);
}


// creeper
void dibujarCreeper(){

  rectMode(CENTER);

  creeperX += lloviendo ? 2.0 : 1.2;
  if(creeperX > width + 50) creeperX = -50;

  float y = height - 320;

  fill(60,180,60);
  rect(creeperX, y, 40, 80);

  rect(creeperX, y-60, 50, 50);

  fill(0);
  rect(creeperX-10, y-65, 10, 15);
  rect(creeperX+10, y-65, 10, 15);
  rect(creeperX, y-50, 20, 25);

  fill(50,150,50);
  rect(creeperX-10, y+40, 15, 25);
  rect(creeperX+10, y+40, 15, 25);
}


// luviaa
void dibujarLluvia(){

  stroke(180,200,255);

  for(int i=0;i<gotas;i++){

    line(lluviaX[i], lluviaY[i], lluviaX[i], lluviaY[i]+10);

    lluviaY[i] += velLluvia[i];

    if(lluviaY[i] > height){
      lluviaY[i] = -10;
      lluviaX[i] = random(width);
    }
  }

  noStroke();
}

//vi varias cosas para aprender :3
