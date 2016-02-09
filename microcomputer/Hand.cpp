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
#include <assert.h>
#include "Hand.h"

/*----------Hand::~Hand( )-----------------------------------------------------------

  PURPOSE:  Destructor function for a "Hand".

Hand::~Hand( ){

    if( lsm303 != NULL ){
        delete[] lsm303 ;
    }
    if( lsm9dof != NULL ){
        delete[] lsm9dof ;
    }

    return ;
}

-----------------------------------------------------------------------------------*/

/*----------Hand::Lsm303Vals( )------------------------------------------------------

  PURPOSE:  Given an index, return the corresponding LSM303 accelerometer values.

  INPUT  PARAMETERS:  i     -- the index value.

-----------------------------------------------------------------------------------*/

Lsm303 Hand::Lsm303Vals( unsigned int i ){

    /* Ensure that values have been read in and that the index is in range. */
    assert( lsm303 != NULL ) ;
    assert( i < NUM_LSM303 ) ;

    return lsm303[i] ;

}

/*----------Hand::Lsm9dofVals( )------------------------------------------------------

  PURPOSE:  Given an index, return the corresponding LSM9DOF accelerometer values.

  INPUT  PARAMETERS:  i     -- the index value.

-----------------------------------------------------------------------------------*/

Lsm9dof Hand::Lsm9dofVals( unsigned int i ){

    /* Ensure that values have been read in and that the index is in range. */
    assert( lsm9dof != NULL ) ;
    assert( i < NUM_LSM9DOF ) ;

    return lsm9dof[i] ;

}

/*----------Hand::LsmInit( )---------------------------------------------------------

  PURPOSE:  Function to initialize the arrays for the LSM303 and LSM9DOF
            accelerometer values.

-----------------------------------------------------------------------------------*/

void Hand::LsmInit( ){

    lsm303 = new Lsm303 [ NUM_LSM9DOF ] ;
    lsm9dof = new Lsm9dof [ NUM_LSM9DOF ] ;

    return ;

}

/*----------Hand::Set( )-------------------------------------------------------------

  PURPOSE:  Given a set of fingers, store their values as a "Hand".

  INPUT  PARAMETERS:  th     -- the thumb.
                      in     -- the index finger.
                      mi     -- the middle finger.
                      ri     -- the ring finger.
                      pi     -- the pinky finger.
                      ti     -- the thumb-index interdigital fold.
                      im     -- the index-middle interdigital fold.
                      mr     -- the middle-ring interdigital fold.
                      rp     -- the ring-pinky interdigital fold.
                      l3030  -- the top set of LSM303 accelerometer values.
                      l3031  -- the bottom set of LSM303 accelerometer values.
                      l9dof0 -- the top set of LSM9DOF accelerometer values.
                      l9dof1 -- the bottom set of LSM9DOF accelerometer values.

-----------------------------------------------------------------------------------*/

void Hand::Set( Finger th, Finger in, Finger mi, Finger ri, Finger pi, Fold ti, Fold im, Fold mr, Fold rp, 
                Lsm303 l3030, Lsm303 l3031, Lsm9dof l9dof0, Lsm9dof l9dof1 ){

	thumb  = th ;
	index  = in ;
        middle = mi ;
        ring   = ri ;
        pinky  = pi ;
        tiFold = ti ;
        imFold = im ;
        mrFold = mr ;
        rpFold = rp ;
	lsm303[0] = l3031 ;
	lsm303[1] = l3031 ;
	lsm9dof[0] = l9dof0 ;
	lsm9dof[1] = l9dof1 ;
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
