/***********Accel.cpp***************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The SetXYZ() function is defined in this module.

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#include "Accel.h"

/*----------Accel::SetXYZ( )---------------------------------------------------------

  PURPOSE:  Given a set of x, y, and z axis accelerometer values, store them.

  INPUT  PARAMETERS:  xVal -- the x axis accelerometer value.
                      yVal -- the y axis accelerometer value.
                      zVal -- the z axis accelerometer value.

-----------------------------------------------------------------------------------*/

void Accel::SeXYZ( double xVal, double yVal, double zVal ) {

    x = xVal ;
    y = yVal ;
    z = zVal ;
    defined = true ;
	
    return ;

}
