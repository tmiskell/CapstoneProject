/***********Hand.cpp**************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Set() and Show() functions are defined in this module.

  CHANGES:  08/09/2015
                                                                                 
************************************************************************************/

#include <climits>
#include "Hand.h"

/*----------Hand::Set( )-------------------------------------------------------------

  PURPOSE:  Given a set of fingers, store their values as a "Hand".

  INPUT  PARAMETERS:  th -- the thumb.
                      in -- the index finger.
                      mi -- the middle finger.
                      ri -- the ring finger.
                      pi -- the pinky finger.
                      ti -- the thumb-index interdigital fold.
                      im -- the index-middle interdigital fold.
                      mr -- the middle-ring interdigital fold.
                      rp -- the ring-pinky interdigital fold.
                      ac -- the set of accelerometer values.

-----------------------------------------------------------------------------------*/

void Hand::Set( Finger th, Finger in, Finger mi, Finger ri, Finger pi, Fold ti, Fold im, Fold mr, Fold rp, Accel ac ) {

	thumb  = th ;
	index  = in ;
        middle = mi ;
        ring   = ri ;
        pinky  = pi ;
        tiFold = ti ;
        imFold = im ;
        mrFold = mr ;
        rpFold = rp ;
	accel  = ac ;
	defined = true ;
	
	return ;

}

/*----------Hand::Show( )------------------------------------------------------------

  PURPOSE:  Display a "Hand" on the screen.

  INPUT PARAMETERS:  os -- an output stream.

  OUTPUT PARAMETERS: os -- the modified output stream.
    
-----------------------------------------------------------------------------------*/

void Hand::Show( ostream &os ) const {

  if( defined ){
    os << "\t" << "Thumb:\n" ;
    thumb.Show() ;
    os << "\t" << "Index:\n" ;
    index.Show() ;
    os << "\t" << "Middle:\n" ;
    middle.Show() ;
    os << "\t" << "Ring:\n" ;
    ring.Show() ;
    os << "\t" << "Pinky:\n" ;
    pinky.Show() ;
    os << "\t" << "Thumb-Index Fold:\n" ;
    tiFold.Show() ;
    os << "\t" << "Index-Middle Fold:\n" ;
    imFold.Show() ;
    os << "\t" << "Middle-Ring Fold:\n" ;
    mrFold.Show() ;
    os << "\t" << "Ring-Pinky Fold:\n" ;
    rpFold.Show() ;
  }

  return ;

}
