/***********Hand.h*******************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Hand", and also supplies the 
	    function prototypes for the functions exported from the module Hand.cpp.
	    Gesture.h and Hand.cpp include this file.

  CHANGES:  08/23/2015
                                                                                 
************************************************************************************/

#ifndef HAND_H
#define HAND_H

#include <iostream>
#include "Finger.h"
#include "Fold.h"
#include "Accel.h"
using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Hand" represents a left or hand.       */

class Hand { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Hand( ) : defined(false) { }          
         inline Hand( Finger th, Finger in, Finger mi, Finger ri, Finger pi, Fold ti, Fold im, Fold mr, Fold rp, Accel ac ) : 
    	              thumb(th), index(in), middle(mi), ring(ri), pinky(pi), 
   	              tiFold(ti), imFold(im), mrFold(mr), rpFold(rp), accel(ac), defined(true) { }

	 /* Accessor functions */
   	 inline Finger Thumb( )      const { return thumb       ; }  /* Access thumb.  */
	 inline Finger Index( )      const { return index       ; }  /* Access index finger.  */
	 inline Finger Middle( )     const { return middle      ; }  /* Access middle finger.  */
	 inline Finger Ring( )       const { return ring        ; }  /* Access ring finger.  */
	 inline Finger Pinky( )      const { return pinky       ; }  /* Access pinky finger.  */
	 inline Fold   TiFold( )     const { return tiFold      ; }  /* Access thumb-index interdigital fold. */
	 inline Fold   ImFold( )     const { return imFold      ; }  /* Access index-middle interdigital fold. */
	 inline Fold   MrFold( )     const { return mrFold      ; }  /* Access middler-ring interdigital fold. */
	 inline Fold   RpFold( )     const { return rpFold      ; }  /* Access ring-pinky interdigital fold. */
	 inline Accel  AccelVals( )  const { return accel       ; }  /* Access accelerometer values. */
	 inline bool   Defined( )    const { return defined ; }      /* Access defined value. */
	 
	 /* Mutator function */
	 void Set( Finger th, Finger in, Finger mi, Finger ri, Finger pi, 
                   Fold tiFold, Fold imFold, Fold mrFold, Fold rpFold, Accel ac ) ;  /* Sets fingers, interdigital folds, and accelerometer values. */
			  
	 /* Input/Output functions */
	 void Show( ostream &os = cout ) const ;
	 
  private:
	
	 bool defined ;                                  /* True if gesture is defined.  */
	 Finger thumb ;                                  /* Thumb finger.  */
	 Finger index ;                                  /* Index finger.  */
         Finger middle ;                                 /* Middle finger. */
         Finger ring ;                                   /* Ring finger.   */
         Finger pinky ;                                  /* Pinky finger.  */
         Fold   tiFold ;                                 /* Thumb-index interdigital fold. */
         Fold   imFold ;                                 /* Index-middle interdigital fold. */
         Fold   mrFold ;                                 /* Middle-ring interdigital fold. */
         Fold   rpFold ;                                 /* Ring-pinky interdigital fold. */
	 Accel  accel ;                                  /* The accelerometer values. */
	 				
} ;

#endif
