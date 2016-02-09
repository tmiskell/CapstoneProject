/***********ScreenText.h*************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "ScreenText".

  CHANGES:  09/07/2015
                                                                                 
************************************************************************************/

#ifndef SCREENTEXT_H
#define SCREENTEXT_H

#include <string>

using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "ScreenText" represents a collection of text to display on the screen.     */

class ScreenText { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline ScreenText( ) : defined(false) { }          
         inline ScreenText( string statVal, string gestDataVal, string gestConvVal, string instrDataVal ) : 
	   defined(true), status(statVal), gestureData(gestDataVal), gestureConv(gestConvVal), instrData(instrDataVal) { }

	 /* Accessor functions */
   	 inline string Status( )      const { return status      ; }  /* Access status.  */
	 inline string GestureData( ) const { return gestureData ; }  /* Access gesture data.  */
	 inline string GestureConv( ) const { return gestureConv ; }  /* Access gesture conversion.  */
	 inline string InstrData( )   const { return instrData   ; }  /* Access instruction.  */
	 inline bool   Defined( )     const { return defined ; }      /* Access defined value. */
	 
	 /* Mutator functions */
	 void SetStatus(      string statVal      ) ;  /* Sets status value. */
	 void SetGestureData( string gestDataVal  ) ;  /* Sets gesture data value. */
	 void SetGestureConv( string gestConvVal  ) ;  /* Sets gesture conversion value. */
	 void SetInstrData(   string instrDataVal ) ;  /* Sets instruction value. */
			  
  private:
	
	 bool defined ;                                  /* True if screen text is defined.  */
         string status ;                                 /* The status message to display. */
	 string gestureData ;                            /* The gesture data to display.  */
         string gestureConv ;                            /* The current gestures that have been converted to a string of text. */
         string instrData ;                              /* The instruction message to display.   */
	 				
} ;

#endif
