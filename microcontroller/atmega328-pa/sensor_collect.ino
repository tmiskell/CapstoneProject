/***********Main.ino*****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Main function is defined in this module.

  CHANGES:  01/29/2016
                                                                                 
************************************************************************************/

int iflex = 0 ;       // Value read from the index flex sensor
int rflex = 0 ;       // Value read from the ring flex sensor
int mflex = 0 ;       // Value read from the middle flex sensor
int pflex = 0 ;       // Value read from the pinky flex sensor
int icontact = 0 ;    // Value read from the index contact sensor.

// The setup function runs once when you press reset or power the board
void setup( ){
  // Initialize serial communications at 115200 bps:
  Serial.begin( 115200 ) ;
  // Initialize digital pin 12 as an output.
  pinMode( 2, OUTPUT ) ;
  pinMode( 13, INPUT ) ;
}

// The loop function runs over and over again forever
void loop( ){
  // Wait for a second.
  delay( 1000 ) ;                
  // Turn the LED on to indicate a read is being performed.    
  digitalWrite( 2, HIGH ) ;   
  // Read the analog values.
  iflex = analogRead( A0 ) ;
  mflex = analogRead( A1 ) ;
  rflex = analogRead( A2 ) ;
  pflex = analogRead( A3 ) ;  
  // Read the digital values.
  icontact = digitalRead( 13 ) ; 
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
  Serial.print( "Index Contact=\t" ) ;
  Serial.print( icontact ) ;
  Serial.print( "\n" ) ;
  // Wait for a second
  delay( 1000 ) ;              
  // Turn the LED off to indicate a read has finished.
  digitalWrite( 2, LOW ) ;    
}
