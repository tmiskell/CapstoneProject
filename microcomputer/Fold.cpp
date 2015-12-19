/***********Finger.cpp**************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Set() and Show() functions are defined in this module.

  CHANGES:  08/23/2015
                                                                                 
************************************************************************************/

#include <climits>
#include "Fold.h"

/*----------Fold::Set( )-------------------------------------------------------------

  PURPOSE:  Given a pair of sensors, store their values as a "Finger".

  INPUT  PARAMETERS:  contactVal -- the contact sensor value.

-----------------------------------------------------------------------------------*/

void Fold::Set( bool contactVal ) {

        contact = contactVal ;
	defined = true ;
	
	return ;

}

/*----------Fold::Show( )------------------------------------------------------------

  PURPOSE:  Display a "Finger" on the screen.

  INPUT PARAMETERS:  os -- an output stream.

  OUTPUT PARAMETERS: os -- the modified output stream.
    
-----------------------------------------------------------------------------------*/

void Fold::Show( ostream &os ) const {

  if( defined ){
    os << "\t\t" << "Contact Sensor:\t" << Contact() << "\n" ;
  }

  return ;

}
