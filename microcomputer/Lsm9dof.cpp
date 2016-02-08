/***********Lsm9dof.cpp*************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The SetAccel() function is defined in this module.

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#include "Lsm9dof.h"

/*----------Lsm9dof::SetAccel( )------------------------------------------------------

  PURPOSE:  Given a set of x, y, and z axis accelerometer values, store them.

  INPUT  PARAMETERS:  accelxVal -- the x axis accelerometer value.
                      accelyVal -- the y axis accelerometer value.
                      accelzVal -- the z axis accelerometer value.
                      magxVal   -- the x axis magnetometer value.
                      magyVal   -- the y axis magnetometer value.
                      magzVal   -- the z axis magnetometer value.
                      gyroxVal  -- the x axis gyrometer value.
                      gyroyVal  -- the y axis gyrometer value.
                      gyrozVal  -- the z axis gyrometer value.
                      sideVal   -- the location of the LSM303.

-----------------------------------------------------------------------------------*/

void Lsm9dof::SetAccel( double accelxVal, double accelyVal, double accelzVal, double magxVal, double magyVal, double magzVal, 
                        double gyroxVal, double gyroyVal, double gyrozVal, string sideVal ) {

    accelx = accelxVal ;
    accely = accelyVal ;
    accelz = accelzVal ;
    magx = magxVal ;
    magy = magyVal ;
    magz = magzVal ;
    gyrox = gyroxVal ;
    gyroy = gyroyVal ;
    gyroz = gyrozVal ;
    side = sideVal ;
    defined = true ;
	
    return ;

}
