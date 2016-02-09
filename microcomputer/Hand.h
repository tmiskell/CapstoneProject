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
#include "Lsm303.h"
#include "Lsm9dof.h"
using namespace std ;

#define NUM_LSM303 2
#define NUM_LSM9DOF 2

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Hand" represents a left or hand.       */

class Hand { 

  public:  
	
	 /* Default and explicit constructor functions */
         inline Hand( ) : defined(false), lsm303(NULL), lsm9dof(NULL) { }          
         inline Hand( Finger th, Finger in, Finger mi, Finger ri, Finger pi, Fold ti, Fold im, Fold mr, Fold rp ) : 
	   defined(true), thumb(th), index(in), middle(mi), ring(ri), pinky(pi), tiFold(ti), imFold(im), mrFold(mr), rpFold(rp) { }
	 /* Destructor function. ~Hand( ) ; */

	 /* Accessor functions */
   	 inline Finger  Thumb( )       const { return thumb       ; }  /* Access thumb.  */
	 inline Finger  Index( )       const { return index       ; }  /* Access index finger.  */
	 inline Finger  Middle( )      const { return middle      ; }  /* Access middle finger.  */
	 inline Finger  Ring( )        const { return ring        ; }  /* Access ring finger.  */
	 inline Finger  Pinky( )       const { return pinky       ; }  /* Access pinky finger.  */
	 inline Fold    TiFold( )      const { return tiFold      ; }  /* Access thumb-index interdigital fold. */
	 inline Fold    ImFold( )      const { return imFold      ; }  /* Access index-middle interdigital fold. */
	 inline Fold    MrFold( )      const { return mrFold      ; }  /* Access middler-ring interdigital fold. */
	 inline Fold    RpFold( )      const { return rpFold      ; }  /* Access ring-pinky interdigital fold. */
	 inline bool    Defined( )     const { return defined ; }      /* Access defined value. */         
	 Lsm303  Lsm303Vals( unsigned int i )  ;                       /* Access LSM303 accelerometer. */
	 Lsm9dof Lsm9dofVals( unsigned int i ) ;                       /* Access LSM9DOF accelerometer. */
	 
	 /* Mutator function */
         /* Set fingers, interdigital folds, accelerometer values. */
	 void Set( Finger th, Finger in, Finger mi, Finger ri, Finger pi, 
                   Fold tiFold, Fold imFold, Fold mrFold, Fold rpFold, Lsm303 l3030, Lsm303 l3031, Lsm9dof l9dof0, Lsm9dof l9dof1 ) ;  
	 /* Initializers for accelerometers. */
	 void LsmInit( ) ;
			  
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
	 Lsm303* lsm303 ;                                /* The LSM303 accelerometer values. There are 2 accelerometers attached. */
	 Lsm9dof* lsm9dof ;                              /* The LSM9DOF accelerometer values. There are 2 accelerometers attached.*/
	 				
} ;

#endif
