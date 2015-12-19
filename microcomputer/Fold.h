/***********Gesture.h****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Fold", and also supplies the 
	    function prototypes for the functions exported from the module Fold.cpp.
	    Hand.h and Fold.cpp include this file.

  CHANGES:  08/23/2015
                                                                                 
************************************************************************************/

#ifndef FOLD_H
#define FOLD_H

#include <iostream>
using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Fold" represents a specific interdigital fold on the hand. Each interdigital fold includes a contact sensor value. */

class Fold { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Fold( ) : defined(false) { }          
	 inline Fold( bool contactVal ) : contact(contactVal), defined(true) { }

	 /* Accessor functions */
	 inline bool Contact( )      const { return contact ; }  /* Access contact sensor value. */
	 inline bool Defined( )      const { return defined ; }  /* Access defined value. */
	 
	 /* Mutator function */
	 void Set( bool contactVal ) ;            /* Sets sensor values. */
			  
	 /* Input/Output functions */
	 void Show( ostream &os = cout ) const ;
	 
  private:
	
	 bool defined ;                                  /* True if gesture is defined. */
	 bool contact ;                                  /* Contact sensor value. */
	 				
} ;

#endif
