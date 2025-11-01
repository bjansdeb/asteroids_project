class hub {

  PFont Loose ;
  PFont Win ;
  PFont Score ;
  
hub () {

 Loose = createFont ("Georgia", 15) ;
 Win = createFont ("Georgia", 15) ;
 Score = createFont ("Georgia", 15) ;


}

void gameWin ()  {
 textFont (Win, 26) ;
 fill (255) ;
 text("You Win",width/2 ,height/2) ;
 return ;
}

void gameLoose () {
 textFont (Loose, 26) ;
 fill (255) ;
 text("You Loose",width/2 ,height/2) ;
}

void score (int score, int numberAsteroids) {
 textFont (Score, 20) ;
 fill (255) ;
 text("Score : " + score + " / " + numberAsteroids, 50 , 50) ;
}


}
