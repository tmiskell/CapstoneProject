/***********Lsm303.cpp***************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The SetAccel() function is defined in this module.

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#include "Lsm303.h"

/*----------Lsm303::SetAccel( )------------------------------------------------------

  PURPOSE:  Given a set of x, y, and z axis accelerometer values, store them.

  INPUT  PARAMETERS:  accelxVal -- the x axis accelerometer value.
                      accelyVal -- the y axis accelerometer value.
                      accelzVal -- the z axis accelerometer value.
                      magxVal   -- the x axis magnetometer value.
                      magyVal   -- the y axis magnetometer value.
                      magzVal   -- the z axis magnetometer value.
                      sideVal   -- the location of the LSM303.

-----------------------------------------------------------------------------------*/

void Lsm303::SetAccel( double accelxVal, double accelyVal, double accelzVal, double magxVal, double magyVal, double magzVal, string sideVal ) {

    accelx = accelxVal ;
    accely = accelyVal ;
    accelz = accelzVal ;
    magx = magxVal ;
    magy = magyVal ;
    magz = magzVal ;
    side = sideVal ;
    defined = true ;
	
    return ;

}
