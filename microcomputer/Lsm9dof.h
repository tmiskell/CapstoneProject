/***********Lsm9dof.h****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Lsm303".

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#ifndef LSM9DOF_H
#define LSM9DOF_H

#include <string>

using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Lsm9dof" represents a collection of LSM9DOF values.  */

class Lsm9dof { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Lsm9dof( ) : defined(false) { }          
         inline Lsm9dof( double accelxVal, double accelyVal, double accelzVal,
                         double magxVal, double magyVal, double magzVal, 
                         double gyroxVal, double gyroyVal, double gyrozVal, string sideVal ) : 
         accelx(accelxVal), accely(accelyVal), accelz(accelzVal), magx(magxVal), magy(magyVal), magz(magzVal), 
         gyrox(gyroxVal), gyroy(gyroyVal), gyroz(gyrozVal), side(sideVal), defined(true) { }

	 /* Accessor functions */
   	 inline double AccelX( )   const { return accelx ; }  /* Access x axis accelerometer value.  */
   	 inline double AccelY( )   const { return accely ; }  /* Access y axis accelerometer value.  */
   	 inline double AccelZ( )   const { return accelz ; }  /* Access z axis accelerometer value.  */
   	 inline double MagX( )       const { return magx ; }  /* Access x axis magnetometer value.  */
   	 inline double MagY( )       const { return magy ; }  /* Access y axis magnetometer value.  */
   	 inline double MagZ( )       const { return magz ; }  /* Access z axis magnetometer value.  */
   	 inline double GyroX( )      const { return magx ; }  /* Access x axis gyrometer value.  */
   	 inline double GyroY( )      const { return magy ; }  /* Access y axis gyrometer value.  */
   	 inline double GyroZ( )      const { return magz ; }  /* Access z axis gyrometer value.  */
   	 inline string Side( )       const { return side ; }  /* Access location of LSM9DOF.  */
	 inline bool   Defined( ) const { return defined ; }  /* Access defined value. */
	 
	 /* Mutator functions */
	 void SetAccel( double accelxVal, double accelyVal, double accelzVal, 
                        double magxVal, double magyVal, double magzVal, 
                        double gyroxVal, double gyroyVal, double gyrozVal, string side ) ;  /* Sets LSM9DOF values. */
			  
  private:
	
	 bool defined ;                             /* True if accelerometer values are defined. */
         double accelx ;                            /* The x axis accelerometer value. */
         double accely ;                            /* The y axis accelerometer value. */
         double accelz ;                            /* The z axis accelerometer value. */	
         double magx ;                              /* The x axis magnetometer value. */
         double magy ;                              /* The y axis magnetometer value. */
         double magz ;                              /* The z axis magnetometer value. */
         double gyrox ;                             /* The x axis gyrometer value. */
         double gyroy ;                             /* The y axis gyrometer value. */
         double gyroz ;                             /* The z axis gyrometer value. */
	 string side ;                              /* The location of the LSM9DOF. */
 				
} ;

#endif
