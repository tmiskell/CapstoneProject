/***********Gesture.h****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Gesture", and also supplies the 
   	    function prototypes for the functions exported from the module Gesture.cpp.
	    Main.cpp includes this file.

  CHANGES:  08/08/2015
                                                                                 
************************************************************************************/

#ifndef GESTURE_H
#define GESTURE_H

#include <iostream>
#include "Hand.h"
using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Gesture" represents a sign language gesture.       */

class Gesture { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Gesture( ) : defined(false) { }          
	 inline Gesture( Hand lHand, Hand rHand ) : left(lHand), right(rHand), defined(true) { }

	 /* Accessor functions */
   	 inline Hand Left( )       const { return left       ; }  /* Access left hand.  */
	 inline Hand Right( )      const { return right      ; }  /* Access right hand.  */
	 inline bool Defined( )    const { return defined ; }      /* Access defined value. */
	 
	 /* Mutator function */
	 void Set( Hand lHand, Hand rHand ) ;            /* Sets left hand and right hand. */
			  
	 /* Input/Output functions */
	 void Show( ostream &os = cout ) const ;
         string AsString( ) ;
	 
  private:
	
	 bool defined ;                                /* True if gesture is defined.  */
	 Hand left  ;                                  /* Left  hand. */
	 Hand right ;                                  /* Right hand. */
	 				
} ;

#endif
