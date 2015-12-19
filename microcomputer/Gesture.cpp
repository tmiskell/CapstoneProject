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
        buffer << "Left Hand:\t\t\t|Right Hand:\n" ;
	buffer << "\n" ;
        buffer << "Thumb  Flex:\t\t" << left.Thumb().Flex()  << "\t" ;
        buffer << "|Thumb  Flex:\t\t" << right.Thumb().Flex()  << "\n" ;
        buffer << "Index  Flex:\t\t" << left.Index().Flex()  << "\t" ;
        buffer << "|Index  Flex:\t\t" << right.Index().Flex()  << "\n" ;
        buffer << "Middle Flex:\t\t" << left.Index().Flex()  << "\t" ;
        buffer << "|Middle Flex:\t\t" << right.Index().Flex()  << "\n" ;
        buffer << "Ring   Flex:\t\t" << left.Middle().Flex() << "\t" ;
        buffer << "|Ring   Flex:\t\t" << right.Middle().Flex() << "\n" ;
        buffer << "Pinky  Flex:\t\t" << left.Pinky().Flex()  << "\t" ;
        buffer << "|Pinky  Flex:\t\t" << right.Pinky().Flex()  << "\n" ;
        buffer << "Thumb  Contact:\t\t" << left.Thumb().Contact()  << "\t" ;
        buffer << "|Thumb  Contact:\t" << right.Thumb().Contact()  << "\n" ;
        buffer << "Index  Contact:\t\t" << left.Index().Contact()  << "\t" ;
        buffer << "|Index  Contact:\t" << right.Index().Contact()  << "\n" ;
        buffer << "Middle Contact:\t\t" << left.Index().Contact()  << "\t" ;
        buffer << "|Middle Contact:\t" << right.Index().Contact()  << "\n" ;
        buffer << "Ring   Contact:\t\t" << left.Middle().Contact() << "\t" ;
        buffer << "|Ring   Contact:\t" << right.Middle().Contact() << "\n" ;
        buffer << "Pinky  Contact:\t\t" << left.Pinky().Contact()  << "\t" ;
        buffer << "|Pinky  Contact:\t" << right.Pinky().Contact()  << "\n" ;
        buffer << "Thumb-Index  Contact:\t" << left.TiFold().Contact()  << "\t" ;
        buffer << "|Thumb-Index  Contact:\t" << right.TiFold().Contact()  << "\n" ;
        buffer << "Index-Middle Contact:\t" << left.ImFold().Contact()  << "\t" ;
        buffer << "|Index-Middle Contact:\t" << right.ImFold().Contact()  << "\n" ;
        buffer << "Middle-Ring  Contact:\t" << left.MrFold().Contact()  << "\t" ;
        buffer << "|Middle-Ring  Contact:\t" << right.MrFold().Contact()  << "\n" ;
        buffer << "Ring-Pinky   Contact:\t" << left.RpFold().Contact()  << "\t" ;
        buffer << "|Ring-Pinky   Contact:\t" << right.RpFold().Contact()  << "\n" ;
	buffer << "X Axis:\t" << left.AccelVals().X() << "\t\t\t" ;
	buffer << "|X Axis:\t" << right.AccelVals().X() << "\n" ;
	buffer << "Y Axis:\t" << left.AccelVals().Y() << "\t\t\t" ;
	buffer << "|Y Axis:\t" << right.AccelVals().Y() << "\n" ;
	buffer << "Z Axis:\t" << left.AccelVals().Z() << "\t\t\t" ;
	buffer << "|Z Axis:\t" << right.AccelVals().Z() << "\n" ;
    }

    return buffer.str() ;

}
