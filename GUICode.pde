// Code Inspired by Roy Pe'er.
// Importing necessary libraries, such as the Serial library
import processing.serial.*;

// Creating variables, such as port variable
Serial myPort;

// Initializing variables, like for colours
int r;
int g;
int b;

// Creating variables, such as strings, used for the GUI
String T = "Task 9.2HD - Simon's GUI";
String T1 = "↑";
String T2 = "→";
String T3 = "←";
String T4 = "↓";
String T5 = "STOP"; 

String T6 = "HL ON";
String T7 = "HL OFF";
String T8 = "LED ON";
String T9 = "LED OFF";

String T10 = "↑ = W     ← = A     STOP = S     → = D     ↓ = X";
String T11 = "Headlights On(HL ON) = O";
String T12 = "Headlights Off(HL OFF) = P";
String T13 = "LED ON = K";
String T14 = "LED OFF = L";

void setup()
{
  // Creates a display window with the size (x,y) as parameters
  size(1000, 600);
  
  // Sets up the colours
  r = 0;
  g = 0;
  b = 0;
  
  // Prints the available serial ports
  println(Serial.list());
  
  String portName = Serial.list()[0]; // 0 represents my port
  
  // Initializes the serial port
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  background(0, 255, 204); // background's colour - aqua
  
  fill(0, 255, 0); // rectangle's colour - green
  
  // (int x, int y, int width, int height, int radius)
  rect(725, 375, 100, 100, 15); // FORWARDS rectangle
  rect(850, 250, 100, 100, 15); // RIGHT rectangle
  rect(725, 250, 100, 100, 15); // STOP rectangle
  rect(600, 250, 100, 100, 15); // LEFT rectangle
  rect(725, 125, 100, 100, 15); // BACKWARDS rectangle
  
  rect(50, 250, 100, 100, 15); // HEADLIGHTS ON rectangle
  rect(175, 250, 100, 100, 15); // HEADLIGHTS OFF rectangle
  rect(50, 375, 100, 100, 15); // LED ON rectangle
  rect(175, 375, 100, 100, 15); // LED OFF rectangle
  
  textSize(32); // title's size - 32
  fill(255, 0, 0); // title's colour - red
  text(T, 25, 50);  // title's location - "T", x, y
  
  textSize(12);
  fill(0, 0, 255); // title's colour - blue
  text(T10, 30, 85);  // text's location - "T10", x, y
  text(T11, 30, 110);  // text's location - "T11", x, y
  text(T12, 30, 140);  // text's location - "T12", x, y
  text(T13, 30, 170);  // text's location - "T13", x, y
  text(T14, 30, 200);  // text's location - "T14", x, y
  
  textSize(25); // button's text size - 20
  fill(255, 0, 255); // button's text - purple
  
  text(T1, 770, 185); // FORWARD text - "T1", x, y
  text(T2, 890, 310); // RIGHT text - "T2", x, y
  text(T3, 640, 310); // LEFT text - "T3", x, y
  text(T4, 770, 435); // BACKWARD text - "T4", x, y
  text(T5, 745, 310); // STOP text - "T5", x, y
  
  text(T6, 62, 310); // HEADLIGHTS ON text - "T6", x, y
  text(T7, 182, 310); // HEADLIGHTS OFF text - "T7", x, y
  text(T8, 54, 435); // LED ON text - "T8", x, y
  text(T9, 176, 435); // LED OFF text - "T9", x, y
}

void keyPressed()
{
  // Switch-case which sends different signals to serial and shades buttons red according to which was pressed
  switch(key)
  {
    case 'w': // if W button is pressed
    myPort.write('1'); // sends '1' to serial
    println("FORWARDS"); // prints "FORWARDS" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(725, 125, 100, 100, 15); // location of button
    break;
    
    case 'x': // if X button is pressed
    myPort.write('2'); // sends '2' to serial
    println("BACKWARDS"); // prints "BACKWARDS" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(725, 375, 100, 100, 15); // location of button
    break; 
    
    case 'a': // if A button is pressed
    myPort.write('3'); // sends '3' to serial
    println("LEFT"); // prints "LEFT" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(600, 250, 100, 100, 15); // location of button
    break;
    
    case 'd': // if D button is pressed
    myPort.write('4'); // sends '4' to serial
    println("RIGHT"); // prints "RIGHT" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(850, 250, 100, 100, 15); // location of button
    break;
    
    case 's' : // if S is pressed
    myPort.write ('5'); // sends '5' to serial
    println("STOP"); // prints "STOP" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(725, 250, 100, 100, 15); // location of button
    break;
    default:
    break;
    
    case 'o': // if O button is pressed
    myPort.write('6'); // sends '6' to serial
    println("HEADLIGHTS ON"); // prints "HEADLIGHTS ON" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(50, 250, 100, 100, 15); // location of button
    break;
    
    case 'p': // if P button is pressed
    myPort.write('7'); // sends '7' to serial
    println("HEADLIGHTS OFF"); // prints "HEADLIGHTS OFF" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(175, 250, 100, 100, 15); // location of button
    break;
    
    case 'k': // if K button is pressed
    myPort.write('8'); // sends '8' to serial
    println("LED ON"); // prints "LED ON" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(50, 375, 100, 100, 15); // location of button
    break;
    
    case 'l': // if L button is pressed
    myPort.write('9'); // sends '9' to serial
    println("LED OFF"); // prints "LED OFF" (into console)
    fill(255, 0, 0); // colour of click - red
    rect(175, 375, 100, 100, 15); // location of button
    break;
  }
}
