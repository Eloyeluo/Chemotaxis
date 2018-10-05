Cell [] redBlood;
Bacteria [] bacterium;
void setup(){
size(800,800);
redBlood = new Cell[1000];
bacterium = new Bacteria[100];
for(int i = 0; i < redBlood.length; i++){
  redBlood[i] = new Cell();
  }
for(int i = 0; i < bacterium.length; i++){
  bacterium[i] = new Bacteria();
  }
}
void draw(){
  background(150,0,0);
  for(int j = 0; j < redBlood.length; j++){ //spawn blood cells
    redBlood[j].traps();
    redBlood[j].show();
    redBlood[j].boundary();
    if(get(redBlood[j].myX,redBlood[j].myY) != color(150,0,0) || color(100,0,0) || color(50,0,0)){
      redBlood[j].notInfected= false; 
      }
    }
  for(int j= 0; j < bacterium.length; j++){ //spawn bacteria
    bacterium[j].movement();
    bacterium[j].show();
    bacterium[j].boundary();
    }
}
class Cell{ //red blood cells
  int myX, myY;
  boolean notInfected;
  Cell(){ //starting location
  myX = 400;
  myY = 400;
  notInfected = true;
  }
  void traps(){
  myX += (int)(Math.random()*5)-2;
  myY += (int)(Math.random()*5)-2;
  }
  void boundary(){
    if(myX > 820){
    myX = 810;
    }
    else if(myX < -20){
    myX = 0;
    }
    else if(myY > 820){
    myY = 810;
    }
    else if(myY < -20){
    myY = 0;
    }
}
  void show(){
  noStroke();
  if(notInfected){
  	fill(100,0,0);
    ellipse(myX, myY, 10, 20);
    fill(50,0,0);
    ellipse(myX,myY, 5,10);
    }
  else{
   ellipse(myX, myY , 0 ,0);
  }
 }
}

class Bacteria{ //bacteria
  int theirX, theirY;
  Bacteria(){
    theirX = 500;
    theirY = 500;
  }
   void movement(){
    if(mouseX > theirX){
      theirX +=(int)(Math.random()*5) - 1;
      }
    else if(mouseX < theirX){
      theirX +=(int)(Math.random()*5)-5;
      }
    else if(mouseY > theirY){
      theirY +=(int)(Math.random()*5) - 1;
      }
    else if(mouseY < theirY){
    	theirY +=(int)(Math.random()*5)-5;
    	}
    }
  void show(){
  fill(0,50,50);
  ellipse(theirX, theirY, 20,10);
  }
  void boundary(){
    if(theirX > 820){
    theirX = 810;
    }
    else if(theirX < -20){
    theirX = 0;
    }
    else if(theirY > 820){
    theirY = 810;
    }
    else if(theirY < -20){
    theirY = 0;
    }
   }
}
