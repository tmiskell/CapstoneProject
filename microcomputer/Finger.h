/***********Gesture.h****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Finger", and also supplies the 
	    function prototypes for the functions exported from the module Finger.cpp.
	    Hand.h and Finger.cpp include this file.

  CHANGES:  08/08/2015
                                                                                 
************************************************************************************/

#ifndef FINGER_H
#define FINGER_H

#include <iostream>
using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Finger" represents a specific finger on a hand. Each finger includes a contact and flex sensor value. */

class Finger { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Finger( ) : defined(false) { }          
	 inline Finger( double flexVal, bool contactVal ) : flex(flexVal), contact(contactVal), defined(true) { }

	 /* Accessor functions */
   	 inline double Flex( )       const { return flex    ; }  /* Access flex sensor value.  */
	 inline bool Contact( )      const { return contact ; }  /* Access contact sensor value.  */
	 inline bool Defined( )      const { return defined ; }  /* Access defined value. */
	 
	 /* Mutator function */
	 void Set( double flexVal, bool contactVal ) ;            /* Sets sensor values. */
			  
	 /* Input/Output functions */
	 void Show( ostream &os = cout ) const ;
	 
  private:
	
	 bool defined ;                                  /* True if gesture is defined.  */
	 double flex  ;                                  /* Flex sensor value.    */
	 bool contact ;                                  /* Contact sensor value. */
	 				
} ;

#endif
