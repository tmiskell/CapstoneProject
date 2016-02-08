/***********Gesture.cpp**************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Set(), Show(), and AsString() functions are defined in this module.

  CHANGES:  09/07/2015
                                                                                 
************************************************************************************/

#include <climits>
#include <sstream>
#include "Gesture.h"

/*----------Gesture::Set( )----------------------------------------------------------

  PURPOSE:  Given a pair of hands, store their values as a "Gesture".

  INPUT  PARAMETERS:  tFlexVal -- the thumb flex sensor value.
                      iFlexVal -- the index flex sensor value.

-----------------------------------------------------------------------------------*/

void Gesture::Set( Hand lHand, Hand rHand ) {

    left  = lHand ;
    right = rHand ;
    defined = true ;
	
    return ;

}

/*----------Gesture::Show( )---------------------------------------------------------

  PURPOSE:  Display a "Gesture" on the screen.

  INPUT PARAMETERS:  os -- an output stream.

  OUTPUT PARAMETERS: os -- the modified output stream.
    
-----------------------------------------------------------------------------------*/

void Gesture::Show( ostream &os ) const {

    if( defined ){
        os << "Left Hand:\n" ;
        left.Show() ;
        os << "Right Hand:\n" ;
        right.Show() ;
    }

    return ;

}

/*----------Gesture::AsString( )-----------------------------------------------------

  PURPOSE:  Conver a "Gesture" into a string.

  OUTPUT PARAMETERS: The "Gesture" converted to a string.
    
-----------------------------------------------------------------------------------*/

string Gesture::AsString( ) {

    ostringstream buffer ; // Buffer used to numerical values to strings.
    buffer.str( "" ) ;
    buffer.clear() ;

    if( defined ){
        buffer << "Left Hand:\t\t\t\t|Right Hand:\n" ;
	buffer << "\n" ;
        buffer << "Thumb  Flex:\t\t" << left.Thumb().Flex()  << "\t\t" ;
        buffer << "|Thumb  Flex:\t\t" << right.Thumb().Flex()  << "\n" ;
        buffer << "Index  Flex:\t\t" << left.Index().Flex()  << "\t\t" ;
        buffer << "|Index  Flex:\t\t" << right.Index().Flex()  << "\n" ;
        buffer << "Middle Flex:\t\t" << left.Middle().Flex()  << "\t\t" ;
        buffer << "|Middle Flex:\t\t" << right.Middle().Flex()  << "\n" ;
        buffer << "Ring   Flex:\t\t" << left.Ring().Flex() << "\t\t" ;
        buffer << "|Ring   Flex:\t\t" << right.Ring().Flex() << "\n" ;
        buffer << "Pinky  Flex:\t\t" << left.Pinky().Flex()  << "\t\t" ;
        buffer << "|Pinky  Flex:\t\t" << right.Pinky().Flex()  << "\n" ;
        buffer << "Thumb  Contact Tip:\t" << left.Thumb().ContactTip()  << "\t\t" ;
        buffer << "|Thumb  Contact Tip:\t" << right.Thumb().ContactTip()  << "\n" ;
        buffer << "Index  Contact Tip:\t" << left.Index().ContactTip()  << "\t\t" ;
        buffer << "|Index  Contact Tip:\t" << right.Index().ContactTip()  << "\n" ;
        buffer << "Index  Contact Mid:\t" << left.Index().ContactMid()  << "\t\t" ;
        buffer << "|Index  Contact Mid:\t" << right.Index().ContactMid()  << "\n" ;
        buffer << "Middle Contact Tip:\t" << left.Middle().ContactTip()  << "\t\t" ;
        buffer << "|Middle Contact Tip:\t" << right.Middle().ContactTip()  << "\n" ;
        buffer << "Middle Contact Mid:\t" << left.Middle().ContactMid()  << "\t\t" ;
        buffer << "|Middle Contact Mid:\t" << right.Middle().ContactMid()  << "\n" ;
        buffer << "Ring   Contact Tip:\t" << left.Ring().ContactTip() << "\t\t" ;
        buffer << "|Ring   Contact Tip:\t" << right.Ring().ContactTip() << "\n" ;
        buffer << "Ring   Contact Mid:\t" << left.Ring().ContactMid() << "\t\t" ;
        buffer << "|Ring   Contact Mid:\t" << right.Ring().ContactMid() << "\n" ;
        buffer << "Pinky  Contact Tip:\t" << left.Pinky().ContactTip()  << "\t\t" ;
        buffer << "|Pinky  Contact Tip:\t" << right.Pinky().ContactTip()  << "\n" ;
        buffer << "Pinky  Contact Mid:\t" << left.Pinky().ContactMid()  << "\t\t" ;
        buffer << "|Pinky  Contact Mid:\t" << right.Pinky().ContactMid()  << "\n" ;
        buffer << "Thumb-Index  Contact:\t" << left.TiFold().ContactTip()  << "\t\t" ;
        buffer << "|Thumb-Index  Contact:\t" << right.TiFold().ContactTip()  << "\n" ;
        buffer << "Index-Middle Contact:\t" << left.ImFold().ContactTip()  << "\t\t" ;
        buffer << "|Index-Middle Contact:\t" << right.ImFold().ContactTip()  << "\n" ;
        buffer << "Middle-Ring  Contact:\t" << left.MrFold().ContactTip()  << "\t\t" ;
        buffer << "|Middle-Ring  Contact:\t" << right.MrFold().ContactTip()  << "\n" ;
        buffer << "Ring-Pinky   Contact:\t" << left.RpFold().ContactTip()  << "\t\t" ;
        buffer << "|Ring-Pinky   Contact:\t" << right.RpFold().ContactTip()  << "\n" ;
	buffer << "LSM303 Side:\t\t" << left.Lsm303Vals().Side() << "\t\t" ;
	buffer << "|LSM303 Side:\t\t" << right.Lsm303Vals().Side() << "\n" ;
	buffer << "LSM303 Accel X:\t\t" << left.Lsm303Vals().AccelX() << "\t\t" ;
	buffer << "|LSM303 Accel X:\t" << right.Lsm303Vals().AccelX() << "\n" ;
	buffer << "LSM303 Accel Y:\t\t" << left.Lsm303Vals().AccelY() << "\t\t" ;
	buffer << "|LSM303 Accel Y:\t" << right.Lsm303Vals().AccelY() << "\n" ;
	buffer << "LSM303 Accel Z:\t\t" << left.Lsm303Vals().AccelZ() << "\t\t" ;
	buffer << "|LSM303 Accel Z:\t" << right.Lsm303Vals().AccelZ() << "\n" ;
	buffer << "LSM303 Mag X:\t\t" << left.Lsm303Vals().MagX() << "\t\t" ;
	buffer << "|LSM303 Mag X:\t\t" << right.Lsm303Vals().MagX() << "\n" ;
	buffer << "LSM303 Mag Y:\t\t" << left.Lsm303Vals().MagY() << "\t\t" ;
	buffer << "|LSM303 Mag Y:\t\t" << right.Lsm303Vals().MagY() << "\n" ;
	buffer << "LSM303 Mag Z:\t\t" << left.Lsm303Vals().MagZ() << "\t\t" ;
	buffer << "|LSM303 Mag Z:\t\t" << right.Lsm303Vals().MagZ() << "\n" ;
	buffer << "LSM9DOF Side:\t\t" << left.Lsm9dofVals().Side() << "\t\t" ;
	buffer << "|LSM9DOF Side:\t\t" << right.Lsm9dofVals().Side() << "\n" ;
	buffer << "LSM9DOF Accel X:\t" << left.Lsm9dofVals().AccelX() << "\t\t" ;
	buffer << "|LSM9DOF Accel X:\t" << right.Lsm9dofVals().AccelX() << "\n" ;
	buffer << "LSM9DOF Accel Y:\t" << left.Lsm9dofVals().AccelY() << "\t\t" ;
	buffer << "|LSM9DOF Accel Y:\t" << right.Lsm9dofVals().AccelY() << "\n" ;
	buffer << "LSM9DOF Accel Z:\t" << left.Lsm9dofVals().AccelZ() << "\t\t" ;
	buffer << "|LSM9DOF Accel Z:\t" << right.Lsm9dofVals().AccelZ() << "\n" ;
	buffer << "LSM9DOF Mag X:\t\t" << left.Lsm9dofVals().MagX() << "\t\t" ;
	buffer << "|LSM9DOF Mag X:\t\t" << right.Lsm9dofVals().MagX() << "\n" ;
	buffer << "LSM9DOF Mag Y:\t\t" << left.Lsm9dofVals().MagY() << "\t\t" ;
	buffer << "|LSM9DOF Mag Y:\t\t" << right.Lsm9dofVals().MagY() << "\n" ;
	buffer << "LSM9DOF Mag Z:\t\t" << left.Lsm9dofVals().MagZ() << "\t\t" ;
	buffer << "|LSM9DOF Mag Z:\t\t" << right.Lsm9dofVals().MagZ() << "\n" ;
	buffer << "LSM9DOF Gyro X:\t\t" << left.Lsm9dofVals().GyroX() << "\t\t" ;
	buffer << "|LSM9DOF Gyro X:\t" << right.Lsm9dofVals().GyroX() << "\n" ;
	buffer << "LSM9DOF Gyro Y:\t\t" << left.Lsm9dofVals().GyroY() << "\t\t" ;
	buffer << "|LSM9DOF Gyro Y:\t" << right.Lsm9dofVals().GyroY() << "\n" ;
	buffer << "LSM9DOF Gyro Z:\t\t" << left.Lsm9dofVals().GyroZ() << "\t\t" ;
	buffer << "|LSM9DOF Gyro Z:\t" << right.Lsm9dofVals().GyroZ() << "\n" ;
    }

    return buffer.str() ;

}
