import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int r = 0;
int l = 0;
int s = 0;
/*arduino inputs.
   r = right button
   l = left button
   s = switch   */
   
float x = 256;
float y = 265;

float ex = 100;
float ey = 256;

int money = 0;

void setup() {
  size(512, 512);
  arduino = new Arduino(this, Arduino.list()[1], 57600);
}

void draw(){
  r = arduino.analogRead(1);
  l = arduino.analogRead(6);
  s = arduino.analogRead(3);
  //arduino inputs
 
  noStroke();
  fill(#5b4160);
  rect(0, 0, 512, 512);
  //background
 
  stroke(1);
  fill(52, 127, 176);
  ellipse(x, y, 50, 50);
  line(x+10, y+10, x-10, y-10);
  line(x+10, y-10, x-10, y+10);
  //draws player

  if (s == 0){
  if (r > 0)
    x += 3;
  if (l > 0)
    x -= 3;
  }
  if (s > 0){
  if (r > 0)
    y -= 3;
  if (l > 0)
    y += 3;
  }
  //code for player movement

  fill(#cfbf35);
  ellipse(ex, ey, 15, 15);
  //draws coin
 
  if (ex < x){
  ex -= random(0.2);
  } else {
    ex += random(0.2);
  }
  if (ey < y) {
  ey -= random(0.2);
  } else {
  ey += random(0.2);
  }
  
  if (ex < 0)
  ex = 15;
  if (ex > 512)
  ex = 497;   
  if (ey < 0)
  ey = 15;
  if (ey > 512)
  ey = 497;    
 //coin movement
 
  if ((x >= ex-30 && x <= ex+30) && (y >= ey-30 && y <= ey+30)){
  money++;
  ex = random(20, 490);
  ey = random(20, 490);
  }
  // coin collection
  
  fill(255, 255, 255);
  rect(5, 15, 75, 19);
  fill(0, 0, 0);
  text("money: ", 8, 28);
  text(money, 48, 28);
  //displays money
 

  //death
 
  fill(255, 100, 100);
  text(r, 0, 10);
  fill(100, 100, 255);
  text(l, 50, 10);
  fill(100, 255, 100);
  text(s, 100, 10);  
  //testing #s
}
