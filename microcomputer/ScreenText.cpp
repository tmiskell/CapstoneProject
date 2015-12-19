/***********ScreenText.cpp***********************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The SetStatus(), SetGestureData(), SetGestureConv(), and SetInstrData() 
            functions are defined in this module.

  CHANGES:  09/07/2015
                                                                                 
************************************************************************************/

#include "ScreenText.h"

/*----------ScreenText::SetStatus( )-------------------------------------------------

  PURPOSE:  Given a status message, store it as part of the collection of screen 
            text.

  INPUT  PARAMETERS:  statVal -- the status message.

-----------------------------------------------------------------------------------*/

void ScreenText::SetStatus( string statVal ) {

        status  = statVal ;
	defined = true ;
	
	return ;

}

/*----------ScreenText::SetGestureData( )--------------------------------------------

  PURPOSE:  Given a set of gesture data, store it as part of the collection of screen 
            text.

  INPUT  PARAMETERS:  gestDataVal -- the gesture data message.

-----------------------------------------------------------------------------------*/

void ScreenText::SetGestureData( string gestDataVal ) {

        gestureData  = gestDataVal ;
	defined = true ;
	
	return ;

}

/*----------ScreenText::SetGestureConv( )--------------------------------------------

  PURPOSE:  Given a set of gesture conversions, store it as part of the collection of
            screen text.

  INPUT  PARAMETERS:  gestConvVal -- the gesture conversion message.

-----------------------------------------------------------------------------------*/

void ScreenText::SetGestureConv( string gestConvVal ) {

        gestureConv  = gestConvVal ;
	defined = true ;
	
	return ;

}

/*----------ScreenText::SetInstrData( )----------------------------------------------

  PURPOSE:  Given a set of instruction, store it as part of the collection of
            screen text.

  INPUT  PARAMETERS:  instrDataVal -- the instruction message.

-----------------------------------------------------------------------------------*/

void ScreenText::SetInstrData( string instrDataVal ) {

        instrData = instrDataVal ;
	defined = true ;
	
	return ;

}
