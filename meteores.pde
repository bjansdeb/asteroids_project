void initAsteroids(float[] aste_x, float [] aste_y, float s) { 
  float t = aste_x.length; 
  for (int i = 0; i < aste_x.length; i++) { 
    aste_x[i] = int((s * cos(random(i * (2 * PI / t), (i + 1) * (2 * PI / t))))); 
    aste_y[i] = int((s * sin(random(i * (2 * PI / t), (i + 1) * (2 * PI / t))))); 
} 

}


class asteroid {
  int level ;
  float rayon, vitesse, vitesse2, rotation ;
  float x ;
  float y ;
  float [] asteX = new float [numberAsteroids] ;
  float [] asteY = new float [numberAsteroids] ;
  boolean impact  ; // impact de l'astéroide contre le vaisseau
  
asteroid () {
}

float getX () {

  return x ;
  
}

float getY () {
  return y ;  
}

void init () {

  x = int (random (0, 150)) ;
  y = int (random (0, 150)) ;
    
  rotation = 0 ;
  rayon = 60 ;
  vitesse = random (-4, 4) ;
  vitesse2 = random (-4, 4) ;
  level = 2 ;
  initAsteroids(asteX, asteY, rayon) ;
}
  
// variables propres à la classe
void drawAsteroid () {
  pushMatrix () ;
  translate (x,y) ;
  beginShape (POLYGON);
  rotate (rotation) ;
  noFill () ;
  stroke (255) ;
    for(int i=0; i<asteX.length-1;i++){
      vertex(0 + asteX[i],0 + asteY[i]);
      }
      endShape (CLOSE) ;
      popMatrix () ;
}

//meteores[i].updateA (random (-5, 0), random (width, width +5), random (height, height +5)) ;
void updateA (float temp1, float temp2, float temp3) {

  x += vitesse ;
  y += vitesse2 ;
  rotation += PI/50 ;
  
  if (x > width + 10) {
    x = temp1 ;
}
  if (x < -6) {
    x = temp2 ;
}

  if (y < -6) {
    y = temp3 ;
}

  if (y > height +10) {
    y = temp1 ;}
}



boolean impact () {

   for (int j = 0 ; j < shipList.size () ; j ++) 
   {
     vaisseau albator = shipList.get (j) ;
        if (impact) { 
          shipList.remove (albator) ;
        }
  
  float ecart = dist (albator.x, albator.y, x, y) ;
    if (ecart < albator.rayon + rayon ) { 
         impact = true ;
    } 
        else {impact = false ;}
   } 
   return impact ;
     }
  
int getSizeOfAsteroids (int tempRayon) { 
  rayon -= tempRayon ;
  return tempRayon ;
  
}

int getLevel () { // retourne niveau 2 de l'astéroide.
  return level ;
} 

int downgradeLevel (int level2) {  // le niveau 2 passe au niveau 1 pour l'astéroide touche
  initAsteroids(asteX, asteY, rayon) ;
  int newlevel = level2 - 1 ;
  return newlevel ;
  } 
     
}
