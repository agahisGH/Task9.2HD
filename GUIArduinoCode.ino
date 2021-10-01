// Including the necessary libraries for application
#include <SoftwareSerial.h>
#include <ArduinoBlue.h>

// MOTOR A (right side)
int in1 = 13;
int in2 = 12;

// MOTOR B (left side)
int in3 = 11;
int in4 = 10;

void setup()
{
    // Starts serial monitor at 9600 bps
    Serial.begin(9600);

    // Sets up all motor pins as output
    pinMode(in1, OUTPUT);
    pinMode(in2, OUTPUT);
    pinMode(in3, OUTPUT);
    pinMode(in4, OUTPUT);

    // Sets up the LED pins as output
    pinMode(5, OUTPUT);
    pinMode(6, OUTPUT);

    pinMode(3, OUTPUT);
}

// Moves both motors forwards
void moveForward()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
}

// Moves right motors forwards
void moveRight()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  digitalWrite(in3, LOW);
  digitalWrite(in4, LOW);
}

// Moves left motors forwards
void moveLeft()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, LOW);
  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
}

// Moves both motors backwards
void moveBackward()
{
  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  digitalWrite(in3, LOW);
  digitalWrite(in4, HIGH);
}

// Turn off all motors
void moveStop()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, LOW);
  digitalWrite(in3, LOW);
  digitalWrite(in4, LOW);
}

// Turns on both LEDs
void ledOn()
{
  digitalWrite(5, HIGH);
  digitalWrite(6, HIGH);  
}

// Turns off both LEDs
void ledOff()
{
  digitalWrite(5, LOW);
  digitalWrite(6, LOW);
}

// Turns on Green LED
void ledGreenOn()
{
  digitalWrite(3, HIGH);
}

// Turns off Green LED
void ledGreenOff()
{
  digitalWrite(3, LOW);
}

void loop()
{
  // Listens for a signal in the serial port, if found, if statement is true
  if (Serial.available() > 0)
  {
    // Creating a local variable for data, for Serial to store what it reads... then creates a switch-case with this data
    int data = Serial.read();
    switch (data)
    {
      // Case Number 1 is received, go forwards
      case '1':
      moveForward();
      break;

      // Case Number 2 is received, go backwards
      case '2':
      moveBackward();
      break;

      // Case Number 3 is received, turn left
      case '3':
      moveLeft();
      break;

      // Case Number 4 is received, turn right
      case '4':
      moveRight();
      break;

      // Case Number 5 is received, push brakes
      case '5':
      moveStop();
      default : break;

      // Case Number 6 is received, turn on headlights
      case '6':
      ledOn();
      break;

      // Case Number 7 is received, turn off headlights
      case '7':
      ledOff();
      break;

      // Case Number 8 is received, turn on green LED
      case '8':
      ledGreenOn();
      break;

      // Case Number 9 is received, turn off green LED
      case '9':
      ledGreenOff();
      break;
    }
  }
}
