
ArrayList <vaisseau> shipList ; 
int numberAsteroids = 5 ;
int score = 0 ;
ArrayList <asteroid> asteList ;
hub huber ;
int munitions = 0 ;
int munitionsMax = 20 ;
PFont munitionsRest;
boolean loose ;
 
void setup (){   //<>//
  size (1200, 800) ;
  huber = new hub () ; 
  asteList = new ArrayList <asteroid> () ;
  for (int i = 0 ; i < numberAsteroids ; i++) {
    asteList.add (new asteroid ());
    asteroid a = asteList.get (i) ;
    a.init () ;

  }
  shipList = new ArrayList <vaisseau> () ;
  shipList.add (new vaisseau ()) ;
  vaisseau albator = shipList.get (0) ;
  albator.init (width/2, height/2) ;
}

void keyPressed ()   {
  for (vaisseau albator : shipList) {
    if (keyCode == ' ') albator.createProjectil () ;
    if (keyCode == LEFT) albator.left () ;
    if (keyCode == RIGHT) albator.right () ;
  }
}

  
void draw (){
  background (0) ;
   
   /*Asteroids*/
   
   for (int i = 0 ; i < asteList.size () ; i++) {
    asteroid a = asteList.get (i) ;
    a.getX () ; 
      //println ("meteoresX :" +meteoresX) ;
    a.getY () ;
      //println ("meteoresY :" +meteoresY);
    a.drawAsteroid () ;
    //a.drawAsteroid (meteoresX, meteoresY) ;
    a.updateA  (random (-5, 0), random (width, width +5), random (height, height +5)) ;
    a.impact   () ; // gère l'impact des météores contre le vaisseau  (experimental); 
    int level = a.getLevel () ; // retourne le level de tous les météores au niveau 2 ;
    
    
    /*effet du tir */

   for (vaisseau albator : shipList) {
   for (int j = 0 ; j < albator.missileX.length ; j ++) {

     float ecart = dist (a.x, a.y, albator.missileX[j], albator.missileY[j]) ; // contact météores-missiles
      
      
      if (ecart <= a.rayon + albator.rayonMissile) {
     
        albator.deleteProjectils () ; // si contact -> supprime projectile 
        int newSizeOfAsteroids = a.getSizeOfAsteroids (30) ; // météore passe à 30
            println (newSizeOfAsteroids) ;
        int newLevel = a.downgradeLevel (level); // le level 2 du météore touché est abaissé au niveau 1 ;
            println ("level: " +newLevel) ;
                  if (newLevel == 1 && ecart <= newSizeOfAsteroids + albator.rayonMissile) { // 2e si contact alors delete
                      //a.removeAsteroids () ; // suppression
                      asteList.remove (a) ;
                      score ++ ;
                  }
                  }             
        }
              
    }  

  
}

  /* vaisseau et missiles */
     for (int j = 0 ; j < shipList.size () ; j ++) 
   {
  vaisseau albator = shipList.get (j) ;
  albator.drawShip () ;
  float albatorX = albator.getX () ;
    //println (albatorX) ;
  float albatorY = albator.getY () ;
    //println (albatorY) ;
  albator.bloquer () ; // bloque simplement le vaisseau  

  float [] projectilX = albator.getProjectilX () ;
    //printArray (projectilX) ;
  float [] projectilY = albator.getProjectilY () ;
    //printArray (projectilY) ;
  albator.drawProjectils () ;
  albator.updateProjectils () ;

  int numberOfProjectils = albator.numberOfProjectils () ; // retourne les projectiles restants
    //println ("Projectiles restants : " + numberOfProjectils) ;

   }
 int taille = asteList.size () ;
    println (taille) ;
    
// hub
  boolean vide = asteList.isEmpty() ;
    if (vide) {
      huber.gameWin () ;
      }
  boolean loose = shipList.isEmpty () ;
    if (loose) {
      huber.gameLoose () ;
      }
  huber.score (score, numberAsteroids) ;

}
