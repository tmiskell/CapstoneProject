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
#include <string.h>
#include <sstream>
#include <stdio.h>
#include "Gesture.h"

#define MAX_CHAR 1023 /* The number of characters in an array. */

void add_border( char border[MAX_CHAR], int border_len, char c_div, char v_div ) ;

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

    ostringstream buffer ;               // Buffer used to convert numerical values to strings.
    const unsigned int NUM_HANDS = 2 ;                         /* Number of hands. */
    const unsigned int NUM_FINGERS = 5 ;                       /* Number of fingers per hand. */
    const unsigned int NUM_FOLDS = 4 ;                         /* Number of inter-digital folds per hand. */
    const unsigned int NUM_303 = 2 ;                           /* Number of connected LSM303 accelerometers. */
    const unsigned int NUM_303_NAMES = 3 ;                     /* The number of LSM303 value names. */
    const unsigned int NUM_9DOF = 2 ;                          /* Number of connected LSM9DOF accelerometers. */
    const unsigned int NUM_9DOF_NAMES = 4 ;                    /* The number of LSM9DOF value names. */
    string hand_name[NUM_HANDS] = {"left",         /* A list of names for the hands. */
                                  "right"
                                  } ;
    string finger_name[NUM_FINGERS] = {"ind",    /* A list of names for the flex sensors. */
                                       "mid", 
                                       "ri", 
                                       "pi",
                                       "th"
                                      } ;
    string fold_name[NUM_FOLDS] = {"th-ind",  /* A list of names for the folds between fingers. */
                                   "ind-mid", 
                                   "mid-ri", 
                                   "ri-pi"
                                  } ;             
    string lsm303_name[NUM_303_NAMES] = {"LSM303 Loc.",           /* A list of the LSM303 value names. */
                                         "Accelerometer",
                                         "Magnetometer"
                                        } ;       
    string lsm9dof_name[NUM_9DOF_NAMES] = {"LSM9DOF Loc.",          /* A list of the LSM9DOF value names. */
                                           "Accelerometer",
                                           "Magnetometer",
                                           "Gyrometer"
                                          } ;       
    char border[MAX_CHAR] ;                    /* Buffer to store the border. */
    char header[MAX_CHAR] ;                    /* Buffer to store the table entry contents. */
    char entry[NUM_HANDS][MAX_CHAR] ;          /* Buffer to store the table entry contents. */
    char c_div = '+' ;                         /* The corner divider to print. */
    char v_div = '-' ;                         /* The vertical divider to print. */
    char h_div = '|' ;                         /* The horizontal divider to print. */    
    unsigned int i ;                           /* An iterator. */
    unsigned int j ;                           /* An iterator. */

    buffer.str( "" ) ;
    buffer.clear() ;
    if( !defined ){
      /* No data, simply return an empty string. */
      return buffer.str() ;
    }
    memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
    memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
    /* Collect the flex sensor data. */
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
        sprintf( entry[i], "%c %-*s ", h_div, (int)strlen("Flex Location"), (hand_name[i]).c_str() ) ;
    }
    sprintf( header, "%c %s ", h_div, "Flex Location" ) ;
    add_border( border, strlen("Flex Location") + 2, c_div, v_div ) ;
    for( j = 0 ; j < NUM_FINGERS ; j++ ){
        sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("xxx"), (finger_name[j]).c_str() ) ;
        add_border( border, strlen(" xxx "), c_div, v_div ) ;
    }
    sprintf( entry[0] + strlen(entry[0]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)left.Index().Flex() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)left.Middle().Flex() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)left.Ring().Flex() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)left.Pinky().Flex() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c %*u %c\n", h_div, (int)strlen("xxx"), (unsigned int)left.Thumb().Flex(), h_div ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)right.Index().Flex() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)right.Middle().Flex() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)right.Ring().Flex() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c %*u ", h_div, (int)strlen("xxx"), (unsigned int)right.Pinky().Flex() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c %*u %c\n", h_div, (int)strlen("xxx"), (unsigned int)right.Thumb().Flex(), h_div ) ;
    sprintf( border + strlen(border), "%c\n", c_div ) ;
    sprintf( header + strlen(header), "%c\n", h_div ) ;
    buffer << border << header << border << entry[0] << entry[1] << border ;
    /* Collect the contact sensor data. */
    memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
    memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
        sprintf( entry[i], "%c %-*s ", h_div, (int)strlen("Contact Loc."), (hand_name[i]).c_str() ) ;
    }
    sprintf( header, "%c %s ", h_div, "Contact Loc." ) ;
    add_border( border, strlen("Contact Loc.") + 2, c_div, v_div ) ;
    for( j = 0 ; j < NUM_FINGERS ; j++ ){
        sprintf( header + strlen(header), "%c %s tip ", h_div, (finger_name[j]).c_str() ) ;
        add_border( border, strlen((finger_name[j]).c_str()) + strlen(" tip ") + 1, c_div, v_div ) ;
	if( finger_name[j].compare( "th" ) == 0 ){
	    /* Currently the thumb only has a tip contact sensor. */
  	    continue ;
	}
        sprintf( header + strlen(header), "%c %s mid ", h_div, (finger_name[j]).c_str() ) ;
        add_border( border, strlen((finger_name[j]).c_str()) + strlen(" mid ") + 1, c_div, v_div ) ;
    }
    /* Print out the table of interdigital fold contact values. */
    for( j = 0 ; j < NUM_FOLDS ; j++ ){
        sprintf( header + strlen(header), "%c %s ", h_div, (fold_name[j]).c_str() ) ;
        add_border( border, strlen((fold_name[j]).c_str()) + 2, c_div, v_div ) ;
    }
    sprintf( border + strlen(border), "%c\n", c_div ) ;
    sprintf( header + strlen(header), "%c\n", h_div ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[0]).c_str()) + strlen(" tip ") + 1), 
             left.Index().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[0]).c_str()) + strlen(" mid ") + 1), 
             left.Index().ContactMid() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[1]).c_str()) + strlen(" tip ") + 1), 
             left.Middle().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[1]).c_str()) + strlen(" mid ") + 1), 
             left.Middle().ContactMid() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[2]).c_str()) + strlen(" tip ") + 1), 
             left.Ring().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[2]).c_str()) + strlen(" mid ") + 1), 
             left.Ring().ContactMid() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[3]).c_str()) + strlen(" tip ") + 1), 
             left.Pinky().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[3]).c_str()) + strlen(" mid ") + 1), 
             left.Pinky().ContactMid() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((finger_name[4]).c_str()) + strlen(" tip ") + 1), 
             left.Thumb().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((fold_name[0]).c_str()) + 2), 
             left.TiFold().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((fold_name[1]).c_str()) + 2), 
             left.ImFold().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u", h_div, (int)(strlen((fold_name[2]).c_str()) + 2), 
             left.MrFold().ContactTip() ) ;
    sprintf( entry[0] + strlen(entry[0]), "%c%*u%c\n", h_div, (int)(strlen((fold_name[3]).c_str()) + 2), 
             left.RpFold().ContactTip(), h_div ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[0]).c_str()) + strlen(" tip ") + 1), 
             right.Index().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[0]).c_str()) + strlen(" mid ") + 1), 
             right.Index().ContactMid() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[1]).c_str()) + strlen(" tip ") + 1), 
             right.Middle().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[1]).c_str()) + strlen(" mid ") + 1), 
             right.Middle().ContactMid() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[2]).c_str()) + strlen(" tip ") + 1), 
             right.Ring().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[2]).c_str()) + strlen(" mid ") + 1), 
             right.Ring().ContactMid() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[3]).c_str()) + strlen(" tip ") + 1), 
             right.Pinky().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[3]).c_str()) + strlen(" mid ") + 1), 
             right.Pinky().ContactMid() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((finger_name[4]).c_str()) + strlen(" tip ") + 1), 
             right.Thumb().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((fold_name[0]).c_str()) + 2), 
             right.TiFold().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((fold_name[1]).c_str()) + 2), 
             right.ImFold().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u", h_div, (int)(strlen((fold_name[2]).c_str()) + 2), 
             right.MrFold().ContactTip() ) ;
    sprintf( entry[1] + strlen(entry[1]), "%c%*u%c\n", h_div, (int)(strlen((fold_name[3]).c_str()) + 2), 
             right.RpFold().ContactTip(), h_div ) ;
    buffer << border << header << border << entry[0] << entry[1] << border ;
    /* Print out the LSM303 accelerometers. */
    memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
    memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
    }
    for( j = 0 ; j < NUM_303_NAMES ; j++ ){
        if( strcmp((lsm303_name[j]).c_str(), "LSM303 Loc.") == 0 ){
  	    sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("right bottom"), (lsm303_name[j]).c_str() ) ;
            add_border( border, strlen("right bottom") + 2, c_div, v_div ) ;
        }
        else{
    	    sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("(+xxxx.x, +xxxx.x, +xxxx.x)"), (lsm303_name[j]).c_str() ) ;
            add_border( border, strlen("(+xxxx.x, +xxxx.x, +xxxx.x)") + 2, c_div, v_div ) ;
        }
    }
    sprintf( border + strlen(border), "%c\n", c_div ) ;
    sprintf( header + strlen(header), "%c\n", h_div ) ;
    for( j = 0 ; j < NUM_303 ; j++ ){
        sprintf( entry[0] + strlen(entry[0]), "%c %-*s %-*s %c (%+07.1f, %+07.1f, %+07.1f) ", h_div, (int)strlen("right"), (hand_name[0]).c_str(), 
                 (int)strlen("bottom"), (left.Lsm303Vals(j).Side()).c_str(), h_div, 
                 left.Lsm303Vals(j).AccelX(), left.Lsm303Vals(j).AccelY(), left.Lsm303Vals(j).AccelZ() ) ;
        sprintf( entry[0] + strlen(entry[0]), "%c (%+07.1f, %+07.1f, %+07.1f) %c\n", h_div,
                 left.Lsm303Vals(j).MagX(), left.Lsm303Vals(j).MagY(), left.Lsm303Vals(j).MagZ(), h_div ) ;
        sprintf( entry[1] + strlen(entry[1]), "%c %-*s %-*s %c (%+07.1f, %+07.1f, %+07.1f) ", h_div, (int)strlen("right"), (hand_name[1]).c_str(), 
                 (int)strlen("bottom"), (right.Lsm303Vals(j).Side()).c_str(), h_div, 
                 right.Lsm303Vals(j).AccelX(), right.Lsm303Vals(j).AccelY(), right.Lsm303Vals(j).AccelZ() ) ;
        sprintf( entry[1] + strlen(entry[1]), "%c (%+07.1f, %+07.1f, %+07.1f) %c\n", h_div,
                 right.Lsm303Vals(j).MagX(), right.Lsm303Vals(j).MagY(), right.Lsm303Vals(j).MagZ(), h_div ) ;
    }
    buffer << border << header << border << entry[0] << entry[1] << border ;    
    /* Print out the LSM9DOF accelerometers. */
    memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
    memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
    }
    for( j = 0 ; j < NUM_9DOF_NAMES ; j++ ){
        if( strcmp((lsm9dof_name[j]).c_str(), "LSM9DOF Loc.") == 0 ){
  	    sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("right bottom"), (lsm9dof_name[j]).c_str() ) ;
            add_border( border, strlen("right bottom") + 2, c_div, v_div ) ;
        }
        else{
    	    sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("(+xxxxx.x, +xxxxx.x, +xxxxx.x)"), (lsm9dof_name[j]).c_str() ) ;
            add_border( border, strlen("(+xxxxx.x, +xxxxx.x, +xxxxx.x)") + 2, c_div, v_div ) ;
        }
    }
    sprintf( border + strlen(border), "%c\n", c_div ) ;
    sprintf( header + strlen(header), "%c\n", h_div ) ;
    for( j = 0 ; j < NUM_9DOF ; j++ ){
        sprintf( entry[0] + strlen(entry[0]), "%c %-*s %-*s %c (%+08.1f, %+08.1f, %+08.1f) ", h_div, (int)strlen("right"), (hand_name[0]).c_str(), 
                 (int)strlen("bottom"), (left.Lsm9dofVals(j).Side()).c_str(), h_div, 
                 left.Lsm9dofVals(j).AccelX(), left.Lsm9dofVals(j).AccelY(), left.Lsm9dofVals(j).AccelZ() ) ;
        sprintf( entry[0] + strlen(entry[0]), "%c (%+08.1f, %+08.1f, %+08.1f) ", h_div,
                 left.Lsm9dofVals(j).MagX(), left.Lsm9dofVals(j).MagY(), left.Lsm9dofVals(j).MagZ() ) ;
        sprintf( entry[0] + strlen(entry[0]), "%c (%+08.1f, %+08.1f, %+08.1f) %c\n", h_div,
                 left.Lsm9dofVals(j).GyroX(), left.Lsm9dofVals(j).GyroY(), left.Lsm9dofVals(j).GyroZ(), h_div ) ;
        sprintf( entry[1] + strlen(entry[1]), "%c %-*s %-*s %c (%+08.1f, %+08.1f, %+08.1f) ", h_div, (int)strlen("right"), (hand_name[1]).c_str(), 
                 (int)strlen("bottom"), (right.Lsm9dofVals(j).Side()).c_str(), h_div, 
                 right.Lsm9dofVals(j).AccelX(), right.Lsm9dofVals(j).AccelY(), right.Lsm9dofVals(j).AccelZ() ) ;
        sprintf( entry[1] + strlen(entry[1]), "%c (%+08.1f, %+08.1f, %+08.1f) ", h_div,
                 right.Lsm9dofVals(j).MagX(), right.Lsm9dofVals(j).MagY(), right.Lsm9dofVals(j).MagZ() ) ;
        sprintf( entry[1] + strlen(entry[1]), "%c (%+08.1f, %+08.1f, %+08.1f) %c\n", h_div,
                 right.Lsm9dofVals(j).GyroX(), right.Lsm9dofVals(j).GyroY(), right.Lsm9dofVals(j).GyroZ(), h_div ) ;
    }
    buffer << border << header << border << entry[0] << entry[1] << border ;    

    return buffer.str() ;

}

void add_border( char border[MAX_CHAR], int border_len, char c_div, char v_div ){
  /* Function to add a border to a table. */

  int i ; /* An iterator. */

  /* Print the border. */
  border[strlen(border)] = c_div ;
  for( i = 0 ; i < border_len ; i++ ){
    border[strlen(border)] = v_div ;
  }

  return ;

}
