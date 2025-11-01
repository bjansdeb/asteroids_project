class vaisseau {
  float x, y;
  float rayon ;
  PImage vaisseau;
  float theta ;
  float [] velociteX = new float [20] ;
  float [] velociteY = new float [20];
  float [] missileX = new float [20] ;
  float [] missileY = new float [20] ;
  int vitesseMissile ; 
  float rayonMissile ;

vaisseau () {
}


void init (int tempX, int tempY) {
  x = tempX ;
  y = tempY ;
  theta = 0;
  rayon = 20 ; // j'ai adapté mon "rayon" de vaisseau d'après l'image png que j'ai utilisée personnellement (qui est un plus grande que le carré initial) 
  vaisseau = loadImage ("vaisseau.png") ;
  vitesseMissile = 4 ;
  rayonMissile = 5 ; 
  for (int i = 0 ; i < missileX.length ; i ++) {
    missileX[i] = -100 ; 
  }
}

void drawShip () {
  pushMatrix () ;
  translate (width/2, height/2) ;
  rotate (theta) ;
  imageMode (CENTER) ;  
  image (vaisseau, 0, 0) ; 
  popMatrix () ;
}

void left () {
  theta -= PI/20.0 ;  
}

void right () {
  theta += PI/20.0;
}

void bloquer () {  // simple cadrage du vaisseau dans la fenêtre
  y = constrain (y, 0, 800) ;
}


float getX () {
  return x ;
}

float getY () {
  return y ;
}

//Missiles

float [] getProjectilX () { // retourne le tableau contenant les positions X des missiles
  return missileX ;

}

float [] getProjectilY () { // retourne le tableau contenant les positions Y des missiles
  return missileY ;
}

void createProjectil () {
    if (munitions < munitionsMax) {
      missileX [munitions] = x ;
      missileY [munitions] = y ;
      velociteX[munitions] = vitesseMissile * cos (theta) ;
      velociteY[munitions] = vitesseMissile * sin (theta) ;
      munitions ++ ;
    } 
      
}

void drawProjectils () {
  rectMode (CENTER) ;
  for (int i = 0; i < missileX.length ; i ++) {
    fill (255) ;
    noStroke () ;
    rect (missileX[i], missileY[i], rayonMissile, rayonMissile) ; 

  }
}

void updateProjectils () {
  for (int i = 0 ; i < missileX.length ; i ++) {
        missileX[i] -= velociteX [i] ;
        missileY[i] -= velociteY [i] ;
    
    if (missileX[i] < -100) {
        missileX[i] = -100 ;
    }
  }
}

void deleteProjectils () {

  for (asteroid a : asteList) {

      for (int j = 0 ; j < missileX.length ; j ++) {
          float ecart = dist (a.x, a.y, missileX[j], missileY[j]) ;
              if (ecart <= a.rayon + rayonMissile) {
                   missileX[j] = -100 ;
                   missileY[j] = -100 ;
                 }
              if (missileX[j] <= 0) {
                   missileX[j] = -100 ;
                   missileY[j] = -100 ;
              }
              if (missileX[j] >= width) {
                   missileX[j] = -100 ;
                   missileY[j] = -100 ;
              }
                if (missileY[j] <= 0) {
                   missileX[j] = -100 ;
                   missileY[j] = -100 ;
              }
              if (missileY[j] >= height) {
                   missileX[j] = -100 ;
                   missileY[j] = -100 ;
              }
      }
    }
  
}


 int numberOfProjectils () {
 munitionsRest = createFont("Ubuntu", 32);
 textFont(munitionsRest, 25);  

 int tirsRestant =  munitionsMax ;
 tirsRestant -= munitions ;
 text ("Tirs restants : " + tirsRestant, 40, 700);
 return tirsRestant ;
 }
}
