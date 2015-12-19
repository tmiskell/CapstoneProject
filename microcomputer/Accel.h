/***********Accel.h******************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  This header file defines the class "Accel".

  CHANGES:  09/08/2015
                                                                                 
************************************************************************************/

#ifndef ACCEL_H
#define ACCEL_H

using namespace std ;

/*----------Type Definitions-------------------------------------------------------*/

/* Type "Accel" represents a collection of x, y, and z axis accelerometer values.  */

class Accel { 

  public:  
	
	 /* Default and explicit constructor functions */
	 inline Accel( ) : defined(false) { }          
         inline Accel( double xVal, double yVal, double zVal ) : x(xVal), y(yVal), z(zVal), defined(true) { }

	 /* Accessor functions */
   	 inline double X( )       const { return x      ; }  /* Access x axis accelerometer value.  */
   	 inline double Y( )       const { return y      ; }  /* Access y axis accelerometer value.  */
   	 inline double Z( )       const { return z      ; }  /* Access z axis accelerometer value.  */
	 inline bool   Defined( ) const { return defined ; }      /* Access defined value. */
	 
	 /* Mutator functions */
	 void SetXYZ( double xVal, double yVal, double zVal ) ;  /* Sets x, y, and z axis accelerometer values. */
			  
  private:
	
	 bool defined ;                             /* True if accelerometer values are defined. */
         double x ;                                 /* The x axis accelerometer value. */
         double y ;                                 /* The y axis accelerometer value. */
         double z ;                                 /* The z axis accelerometer value. */
	 				
} ;

#endif
