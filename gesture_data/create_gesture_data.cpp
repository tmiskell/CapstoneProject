/*----------Main---------------------------------------------------------------------

  PURPOSE:  The main function.

  INPUT  PARAMETERS: argc -- The count of the number of command line arguments.
                     argv -- The command line arguments

  RETURN VALUE:  0 if the program exited successfully.
                 1 otherwise.
    
-----------------------------------------------------------------------------------*/
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <unistd.h>
#include <string>
#include <signal.h>

using namespace std ;

void write_to_file( const char* fName ) ;
void signal_handler( int sig ) ;

volatile sig_atomic_t kbFlag = 0 ; // Keyboard interrupt flag.

int main( int argc, char* argv[] ) {

    int sleepTime = 15 ;
    const char* fName    = "../microcomputer/gesture_data.new" ; // New XML file.
    const char* newfName = "../microcomputer/gesture_data.xml" ; // Finished XML file.

    /* Register keyboard interrupt handler. */
    signal( SIGINT, signal_handler ) ;
    /* Seed random number generator */
    srand( time(NULL) ) ;
    while( true ){
        if( kbFlag ){
            /* Keyboard interrupt pressed. Perform clean up. */
            break ;
        }
        write_to_file( fName ) ;
        if( rename( fName, newfName ) == 0 ){
            cout << "Successfully wrote:\t" << newfName << "\n" ;
        }
        else{
            perror( "*** Error renaming file ***\n*** Attempting to continue ***\n" ) ;
        }
        sleep( sleepTime ) ;
    }
    cout << "\nExiting\n" ;

    return 0 ;
}

void signal_handler( int sig ){ 

    kbFlag = 1 ; 

    return ;

}

void write_to_file( const char* fName ){

    int i ;                       // Index variable.
    int j ;                       // Index variable
    const int NumHands = 2 ;      // The number of hands.
    const int NumFingers = 5 ;    // The number of fingers on a hand.
    const int NumFolds   = 4 ;    // The number of interdigital folds on a hand.
    string handName[NumHands] = {"left", "right"} ; // Hand names.
    string fingerName[NumFingers] = {"thumb", "index", "middle", "ring", "pinky"} ; // Finger names.
    string foldName[NumFolds] = {"thumb-index", "index-middle", "middle-ring", "ring-pinky" } ; // Interdigital fold names.
    const int maxFlexVal = 51 ;   // Largest random flex sensor value to generate.
    const int maxContactVal = 2 ; // Largest random contact sensor value to generate.
    double flexVal ;              // Next flex sensor value. 
    string contactVal ;           // Next contact sensor value.
    ofstream outputFile ;         // File to write to.

    outputFile.open( fName ) ;
    outputFile << "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\n" ;
    outputFile << "<!DOCTYPE gestures SYSTEM \"gesture_data.dtd\">\n" ;
    outputFile << "<gestures>\n" ;
    outputFile << "\t<gesture>\n" ;
    /* Set the next left hand and right sensor values. */
    for( i = 0 ; i < NumHands ; i++ ){
        outputFile << "\t\t<hand side=\"" << handName[i] << "\">\n" ;
        for( j = 0 ; j < NumFingers ; j++ ){
            outputFile << "\t\t\t<" << fingerName[j] << ">\n" ;
            outputFile << "\t\t\t\t<flex>" ;
            flexVal = (double)(rand() % maxFlexVal) ;
      	    outputFile << flexVal ;
            outputFile << "</flex>\n" ;
            outputFile << "\t\t\t\t<contact>" ;
            contactVal = "true" ;
            if( (rand() % maxContactVal) == 0 ){
                contactVal = "false" ;
            }
	    outputFile <<  contactVal ;
            outputFile << "</contact>\n" ;
            outputFile << "\t\t\t</" << fingerName[j] << ">\n" ;
        }
        for( j = 0 ; j < NumFolds ; j++ ){
            outputFile << "\t\t\t<" << foldName[j] << ">\n" ;
            outputFile << "\t\t\t\t<contact>" ;
            contactVal = "true" ;
            if( (rand() % maxContactVal) == 0 ){
                contactVal = "false" ;
            }
	    outputFile <<  contactVal ;
            outputFile << "</contact>\n" ;
            outputFile << "\t\t\t</" << foldName[j] << ">\n" ;
	}        
        outputFile << "\t\t</hand>\n" ;
    }
    outputFile << "\t</gesture>\n" ;
    outputFile << "</gestures>\n" ;
    outputFile.close() ;

    return ;

}
