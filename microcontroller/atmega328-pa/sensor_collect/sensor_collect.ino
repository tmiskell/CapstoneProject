/***********Main.ino*****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Main function is defined in this module.

  CHANGES:  01/29/2016
                                                                                 
************************************************************************************/
#include <Wire.h>
#define SLAVE_ADDRESS 0x04

int iflex = 0 ;        // Value read from the index flex sensor.
int mflex = 0 ;        // Value read from the middle flex sensor.
int rflex = 0 ;        // Value read from the ring flex sensor.
int pflex = 0 ;        // Value read from the pinky flex sensor.
bool tcontact = 0 ;    // Value read from the thumb contact sensor.
bool icontact = 0 ;    // Value read from the index contact sensor.
bool mcontact = 0 ;    // Value read from the middle contact sensor.
bool rcontact = 0 ;    // Value read from the ring contact sensor.
bool pcontact = 0 ;    // Value read from the pinky contact sensor.
bool tilcontact = 0 ;  // Value read from the left thumb-index contact sensor.
bool tircontact = 0 ;  // Value read from the right thumb-index contact sensor.
bool imlcontact = 0 ;  // Value read from the left index-middle contact sensor.
bool imrcontact = 0 ;  // Value read from the right index-middle contact sensor.
bool mrlcontact = 0 ;  // Value read from the left middle-ring contact sensor.
bool mrrcontact = 0 ;  // Value read from the right middle-ring contact sensor.
bool rplcontact = 0 ;  // Value read from the left ring-pinky contact sensor.
bool rprcontact = 0 ;  // Value read from the right ring-pinky contact sensor.
int rcv_data = 0 ;     // Value read from RPi2

void print_values( ) ;

// The setup function runs once when you press reset or power the board
void setup( ){
  // Initialize serial communications at 115200 bps:
  Serial.begin( 115200 ) ;
  // Initialize the digital pins as inputs.
  pinMode( 2, OUTPUT ) ; 
  pinMode( 3, INPUT ) ; 
  pinMode( 4, INPUT ) ; 
  pinMode( 5, INPUT ) ; 
  pinMode( 6, INPUT ) ; 
  pinMode( 7, INPUT ) ; 
  pinMode( 8, INPUT ) ; 
  pinMode( 9, INPUT ) ; 
  pinMode( 10, INPUT ) ; 
  pinMode( 11, INPUT ) ; 
  pinMode( 12, INPUT ) ; 
  pinMode( 13, INPUT ) ; 
  // Initialize the analog pins as inputs.
  pinMode( A0, INPUT ) ;
  pinMode( A1, INPUT ) ;
  pinMode( A2, INPUT ) ;
  pinMode( A3, INPUT ) ;
  // Set the callback functions for I2C transfers.
  Wire.begin( SLAVE_ADDRESS ) ;
  Wire.onReceive( receiveData ) ;
  Wire.onRequest( sendData ) ;
}

// The loop function runs over and over again forever
void loop( ){
  // Turn the LED on to indicate a read is being performed.    
  digitalWrite( 2, HIGH ) ;   
  // Read the analog values.
  iflex = analogRead( A3 ) ;
  mflex = analogRead( A2 ) ;
  rflex = analogRead( A1 ) ;
  pflex = analogRead( A0 ) ;  
  // Read the digital values.
  tcontact = digitalRead( 2 ) ; 
  icontact = digitalRead( 3 ) ; 
  mcontact = digitalRead( 4 ) ;
  rcontact = digitalRead( 5 ) ;
  pcontact = digitalRead( 6 ) ;
  tilcontact = digitalRead( 7 ) ;
  tircontact = digitalRead( 8 ) ;
  imlcontact = digitalRead( 9 ) ;
  imrcontact = digitalRead( 10 ) ;
  mrlcontact = digitalRead( 11 ) ;
  mrrcontact = digitalRead( 12 ) ;
  rplcontact = digitalRead( 13 ) ;
  //rprcontact = digitalRead( 1 ) ;
  print_values( ) ;
  // Wait for a second
  delay( 1000 ) ;              
  // Turn the LED off to indicate a read has finished.
  digitalWrite( 2, LOW ) ;    
  // Wait for a second.
  delay( 1000 ) ;                
}

void receiveData( int byteCount ){
  // Receive data over I2C bus.
  while( Wire.available() ){
    rcv_data = Wire.read() ;
  } 
}

void sendData( ){
  Wire.write( iflex ) ;
  Wire.write( mflex ) ;
  Wire.write( rflex ) ;
  Wire.write( pflex ) ;

}

void print_values( ){
  // Print the results to the serial monitor:
  Serial.print( "Index Flex=\t" ) ;
  Serial.print( iflex ) ;   
  Serial.print( ", Middle Flex=\t" ) ;
  Serial.print( mflex ) ;
  Serial.print( ", Ring Flex=\t" ) ;
  Serial.print( rflex ) ;
  Serial.print( ", Pinky Flex=\t" ) ;
  Serial.print( pflex ) ;
  Serial.print( "\n" ) ;
  Serial.print( "Thumb Contact=\t" ) ;
  Serial.print( tcontact ) ;
  Serial.print( ", Index Contact=\t" ) ;
  Serial.print( icontact ) ;
  Serial.print( ", Middle Contact=\t" ) ;
  Serial.print( mcontact ) ;
  Serial.print( ", Ring Contact=\t" ) ;
  Serial.print( rcontact ) ;
  Serial.print( ", Pinky Contact=\t" ) ;
  Serial.print( pcontact ) ;  
  Serial.print( "\n" ) ;
  Serial.print( "LTI Contact=\t" ) ;
  Serial.print( tilcontact ) ;  
  Serial.print( ", RTI Contact=\t" ) ;
  Serial.print( tircontact ) ;  
  Serial.print( ", LIM Contact=\t" ) ;
  Serial.print( imlcontact ) ;  
  Serial.print( ", RIM Contact=\t" ) ;
  Serial.print( imrcontact ) ;  
  Serial.print( ", LML Contact=\t" ) ;
  Serial.print( mrlcontact ) ;  
  Serial.print( ", LMR Contact=\t" ) ;
  Serial.print( mrrcontact ) ;  
  Serial.print( ", LRP Contact=\t" ) ;
  Serial.print( rplcontact ) ;  
  Serial.print( ", RRP Contact=\t" ) ;
  Serial.print( rprcontact ) ;    
  Serial.print( "\n" ) ;
}

