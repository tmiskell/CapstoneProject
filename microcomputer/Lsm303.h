/***********Lsm303.h******************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Lsm303".

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#ifndef LSM303_H
#define LSM303_H

#include <string>

using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Lsm303" represents a collection of LSM303 values.  */

class Lsm303 { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Lsm303( ) : defined(false) { }          
         inline Lsm303( double accelxVal, double accelyVal, double accelzVal,
                        double magxVal, double magyVal, double magzVal, string sideVal ) : 
         defined(true), accelx(accelxVal), accely(accelyVal), accelz(accelzVal), magx(magxVal), magy(magyVal), magz(magzVal), side(sideVal) { }

	 /* Accessor functions */
   	 inline double AccelX( )   const { return accelx ; }  /* Access x axis accelerometer value.  */
   	 inline double AccelY( )   const { return accely ; }  /* Access y axis accelerometer value.  */
   	 inline double AccelZ( )   const { return accelz ; }  /* Access z axis accelerometer value.  */
   	 inline double MagX( )       const { return magx ; }  /* Access x axis magnetometer value.  */
   	 inline double MagY( )       const { return magy ; }  /* Access y axis magnetometer value.  */
   	 inline double MagZ( )       const { return magz ; }  /* Access z axis magnetometer value.  */
   	 inline string Side( )       const { return side ; }  /* Access location of LSM303.  */
	 inline bool   Defined( ) const { return defined ; }  /* Access defined value. */
	 
	 /* Mutator functions */
	 void SetAccel( double accelxVal, double accelyVal, double accelzVal, 
                        double magxVal, double magyVal, double magzVal, string side ) ;  /* Sets LSM303 values. */
			  
  private:
	
	 bool defined ;                             /* True if accelerometer values are defined. */
         double accelx ;                            /* The x axis accelerometer value. */
         double accely ;                            /* The y axis accelerometer value. */
         double accelz ;                            /* The z axis accelerometer value. */	
         double magx ;                              /* The x axis magnetometer value. */
         double magy ;                              /* The y axis magnetometer value. */
         double magz ;                              /* The z axis magnetometer value. */
	 string side ;                              /* The location of the LSM303. */
 				
} ;

#endif
