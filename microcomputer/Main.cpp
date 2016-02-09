/***********Main.cpp*****************************************************************

  By:       Timothy Miskell         
            Virinchi Balabhadrapatruni
            16.499 Capstone Proposal
            ECE Department                               
            Umass Lowell                                                                        
 
  PURPOSE:  The Main() function is defined in this module.

  CHANGES:  09/04/2015
                                                                                 
************************************************************************************/

/* Standard includes. */
#include <iostream>
#include <sstream>
#include <fstream>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>
#include <string>
#include <string.h>
#include <signal.h>
#include <ncurses.h>
#include <time.h>
/* XML parsing includes. */
#include "includes/rapidxml.hpp"
#include "includes/rapidxml_utils.hpp"
/* MySQL includes. */
#include "mysql_driver.h"
#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
/* Festival includes. */
//#include <festival/src/include/festival.h>
/* Custom includes. */
#include "Gesture.h"
#include "ScreenText.h"
/* Custom definitions. */
#define NUM_LSM303       2  /* Number of attached LSM303 accelerometers. */
#define NUM_LSM9DOF      2  /* Number of attached LSM9DOF accelerometers. */
#define NUM_LSM303_VALS  6  /* Number of LSM303 values. */
#define NUM_LSM9DOF_VALS 9  /* Number of LSM9DOF values. */
#define NUM_HANDS        2  /* Number of hands. */
#define NUM_FINGERS      5  /* The number of fingers on a hand. */
#define NUM_FOLDS        4  /* The number of interdigital folds on a hand. */

using namespace std ;
using namespace sql ;
using namespace rapidxml ;

bool init( ScreenText &scrText ) ;
bool load_gesture_database( Driver* driver, Connection* &db, const char* dbURL, const char* un, const char* pw, const char* dbName, 
                            ScreenText &scrText ) ;
bool get_gesture( Hand nextHand[NUM_HANDS], const char* fName, ScreenText &scrText, xml_document<> &doc,
                  string &sensorStatus, string &xmlVersion, string &convert ) ;
bool output_xml( const char* outfName, string &text, Gesture &nextGesture, string &sensorStatus, string &xmlVersion ) ;
bool gesture_to_text( Gesture &nextGesture, Connection* db, string &text, ScreenText &scrText ) ;
bool text_to_speech( string text, string ttsScript, const char* tfName ) ;
void add_to_query( string &query, ostringstream &buffer, string stmt ) ;
void output_to_display( ScreenText scrText, bool eraseScr ) ;
bool clean_up( Connection* db ) ;
bool file_exists( const char* fName ) ;
void signal_handler( int sig ) ;
void print_error( SQLException e, ScreenText &scrText ) ;

volatile sig_atomic_t kbFlag = 0 ; // Keyboard interrupt flag.

/*----------main---------------------------------------------------------------------

  PURPOSE:  The main function.

  INPUT PARAMETERS: argc -- The count of the number of command line arguments.
                    argv -- The command line arguments

  RETURN VALUE:  0 if the program exited successfully.
                 1 otherwise.
    
-----------------------------------------------------------------------------------*/

int main( int argc, char* argv[] ) {

    Gesture nextGesture ;                                            /* The next gesture to be read in. */
    Hand nextHand[NUM_HANDS] ;                                       /* The next pair of hands to be read in. */
    const char* fName   = "../gesture_data/gesture_data_init.xml" ;  /* The XML file containing sensor data. */
    const char* newfName = "../gesture_data/gesture_data.complete" ; /* The parsed XML file containing sensor data. */
    const char* outfName = "../gesture_data/gesture_data.xml" ;      /* The XML file that was just read. */
    const char* dbName   = "gesture" ;                               /* The database name to use. */
    string text ;                                                    /* The current gesture converted to a text string. */
    int result = EXIT_SUCCESS ;                                      /* Indicates whether program terminated successfully. */ 
    Driver* driver = NULL ;                                          /* The SQL driver. */
    Connection* db = NULL ;                                          /* The connection to the database. */
    const char* dbURL = "tcp://127.0.0.1:3306" ;                     /* The database location. */
    const char* un = "sign2speech" ;                                 /* The database username. */
    const char* pw = "sign2speech" ;                                 /* The database password. */
    string ttsScript = "festival" ;                                  /* Location of the text to speech script. */
    string xmlVersion ;                                              /* The XML version. */
    string sensorStatus ;                                            /* An indicator of the sensor status. */
    const char* tfName = "speech.txt" ;                              /* Name of the file to write to. */
    ScreenText scrText ;                                             /* The collection of text to display on the screen. */
    xml_document<> doc ;                                             /* The contents of the most recent XML document. */
    string convert = "false" ;                                       /* Used to track whether gesture conversion should be performed. */
    struct timespec t1 ;                                             /* The amount of time to sleep in nanoseconds. */
    struct timespec t2 ;                                             /* The time residual. */

    /* Perform initialization. */
    if( !init( scrText ) ){
        scrText.SetStatus( "*** Error during initialization ***\n" ) ;
	output_to_display( scrText, true ) ;
        result = EXIT_FAILURE ;
        exit( result ) ;
    }
    t1.tv_sec = 0 ;
    t1.tv_nsec = 500000000L ;
    scrText.SetStatus( "Initialized\n" ) ;
    output_to_display( scrText, true ) ;
    /* Connect to the gesture database. */
    if( !load_gesture_database( driver, db, dbURL, un, pw, dbName, scrText ) ){
        scrText.SetStatus( "*** Error connecting to database ***\n" ) ;
	output_to_display( scrText, true ) ;
        result = EXIT_FAILURE ;
        exit( result ) ;    
    }
    scrText.SetStatus( "Loaded gesture database\n" ) ;
    output_to_display( scrText, true ) ;
    /* Start sign to speech conversion. */
    while( true ){
        /* Check if sensor data is available. */
        if( file_exists(fName) ){
	    /* Collect next set of data and store it as a gesture. */ 
  	    scrText.SetStatus( "Reading:\t" + string(fName) + "\n" ) ;
   	    output_to_display( scrText, true ) ;
            /* Add delay to make sure file has finished being written to before attempting to read. */
  	    nanosleep( &t1, &t2 ) ;
            if( get_gesture( nextHand, fName, scrText, doc, sensorStatus, xmlVersion, convert ) ){
                /* Store the next gesture set of data. */
                nextGesture = Gesture( nextHand[0], nextHand[1] ) ;     
                /* Update display for the next set of sensor values. */
  	        scrText.SetGestureData( nextGesture.AsString() ) ;
                /* Indicate file was successfully read. */
		scrText.SetStatus( "Successfully read:\t" + string(fName) + "\n" ) ;
                /* Rename the file so as not to re-read it. */
                if( rename(fName, newfName) != 0 ){
  	   	    scrText.SetStatus( "Unable to rename file:\t" + string(fName) + "\n" ) ;
		}
   	        output_to_display( scrText, true ) ;
	    }
	    else{
  	        scrText.SetStatus( "*** Error reading file. Attempting to continue ***\n" ) ;
        	output_to_display( scrText, true ) ;
		continue ;
	    }
            /* Convert the gesture to text. */
            if( gesture_to_text(nextGesture, db, text, scrText) ){
                /* Output the text to display */
  	        scrText.SetGestureConv( text + "\n" ) ;
                output_to_display( scrText, true ) ;
	    }
	    else{
	        /* Gesture to text error. */
	        scrText.SetStatus( "*** Unable to convert gesture to text. Attempting to continue ***\n" ) ;
                output_to_display( scrText, true ) ;
		continue ;
	    }
  	    scrText.SetStatus( "Wrote:\t" + string(outfName) + "\n" ) ;
            /* Update XML file. */
            if( !output_xml(outfName, text, nextGesture, sensorStatus, xmlVersion) ){
  	        scrText.SetStatus( "Error while writing:\t" + string(outfName) + "\n" ) ;
	    }
   	    output_to_display( scrText, true ) ;
	}
        /* Check if user wants to output the gesture. */
        if( convert.compare("true") == 0 ){
            /* User signaled end of conversion. Convert the text to speech */ 
            if( !text_to_speech( text, ttsScript, tfName ) ){
  	        /* Text to speech error. */
	        scrText.SetStatus( "*** Unable to convert text to speech. Attempting to continue ***\n" ) ;
	    }
	    output_to_display( scrText, true) ;
            /* Reset text string for next gesture input. */
	    text = "" ;
            /* Indicate that the gesture has been converted. */
            convert = "false" ;
            /* Update XML file. */
            if( !output_xml(outfName, text, nextGesture, sensorStatus, xmlVersion) ){
  	        scrText.SetStatus( "Error while writing:\t" + string(outfName) + "\n" ) ;
	    }
            /* Indicate gesture was successfully converted. */
            scrText.SetStatus( "Successfully converted gesture\n" ) ;
            scrText.SetGestureData( "\n" ) ;
	}
        if( kbFlag ){
  	    /* Keyboard interrupt pressed. Perform clean up. */
	    break ;
        }
    }
    /* Perform clean up and then exit. */
    if( !clean_up(db) ){
        result = EXIT_FAILURE ;
    }
    scrText.SetStatus( "\nExiting\n" ) ;
    output_to_display( scrText, true ) ;

    return result ;
  			
}

/*----------print_error--------------------------------------------------------------

  PURPOSE:  Function to print out the details of a SQL exception.

  INPUT PARAMETERS: e       -- The SQL exception containing details about what caused the
                               error.
                    scrText -- The collection of text to display on the screen.

-----------------------------------------------------------------------------------*/

void print_error( SQLException e, ScreenText &scrText ){

    ostringstream buffer ; /* Buffer used to convert numerical values to strings */

    buffer << "SQL Error:\t" << e.what() << "\n" ;
    buffer << "SQL Error Code:\t" << e.getErrorCode() << "\n" ;
    buffer << "Current SQL State:\t" << e.getSQLState() << "\n" ;
    scrText.SetStatus( buffer.str() ) ;
    
    return ;
}

/*----------init---------------------------------------------------------------------

  PURPOSE:  Function to perform initialization upon the start of the program.

  INPUT PARAMETERS: scrText -- The collection of data to display on the screen.

  RETURN VALUE:  true if initialization completed successfully
                 false otherwise.

-----------------------------------------------------------------------------------*/

bool init( ScreenText &scrText ){

    string instrDataVal = "CTRL-C to quit.\n" ; /* The instructions to display */

    try{
        /* Initialize the screen. Register keyboard interrupt handler. */
        signal( SIGINT, signal_handler ) ;
	initscr() ;
	cbreak() ;
	noecho() ;
        /* Set any attempt to read from standard input to be non-blocking. */
        nodelay( stdscr, true ) ;
        /* Initialize the text to display on the screen. */
	scrText.SetStatus( "\n" ) ;
	scrText.SetGestureData( "\n" ) ;
	scrText.SetGestureConv( "\n" ) ;
	scrText.SetInstrData( instrDataVal ) ;
    } catch( ... ){
        return false ;
    }
    return true ;

}

/*----------load_gesture_database-----------------------------------------------------

  PURPOSE:  Function to connect to the sign language gesture database.

  INPUT PARAMETERS: driver -- The name of the database to connect to.
                    db     -- The connection to the database.
                    dbURL  -- The database location.
                    un     -- The database username.
                    pw     -- The database password.
                    dbName -- The database name to use.

  RETURN VALUE:  true if a connection was successfully established to the database
                 false otherwise.

-----------------------------------------------------------------------------------*/

bool load_gesture_database( Driver* driver, Connection* &db, const char* dbURL, const char* un, const char* pw, const char* dbName, 
                            ScreenText &scrText ){

    try{
        /* Connect to the SQL database and supply credentials. Turn off autocommit. */
        driver = get_driver_instance() ;
        db = driver->connect( dbURL, un, pw ) ;
        db->setAutoCommit( 0 ) ;
        /* Choose the database to use. */
        db->setSchema( dbName ) ;
    } catch( SQLException &e ){
        /* Database connection error. */
        print_error( e, scrText ) ;
	output_to_display( scrText, true ) ;
	return false ;
    }
    return true ;

}

/*----------gesture_to_text----------------------------------------------------------

  PURPOSE:  Function to attempt to match the current gesture to the gesture database.
            If a match is found, the gesture is converted into text.
            Special cases: 2/V  -- Try differentiating with V angled forward and
                                   2 angled straight up. Thus, different
                                   accelerometer values should be present for these.
                           6/W  -- Try differentiating based on context. Some people
                                   tap the pinky and thumb together a few times to
                                   distinguish 6 from W. Thus multiple W's in 
                                   succession could be an indication of a 6.
                           9/F  -- Try differentiating based on context. Some people
                                   tap the index and thumb together a few times to
                                   distinguish 9 from F. Thus multiple F's in 
                                   succession could be an indication of a 9.

  INPUT PARAMETERS: nextGesture -- The next set of gesture data to read in.
                                   An instance of class Gesture.
                    db          -- The connection to the database.
                    text        -- The gesture converted to text
                    scrText     -- The collection of text to display on the screen.

  RETURN VALUE:  true if the gesture was successfully converted to text
                 false otherwise.

-----------------------------------------------------------------------------------*/

bool gesture_to_text( Gesture &nextGesture, Connection* db, string &text, ScreenText &scrText ){

    ResultSet* rSet ;                       /* The result set returned by the SQL query. */
    Statement* st   ;                       /* SQL statement. */
    string query ;                          /* SQL query. */
    ostringstream buffer ;                  /* Buffer used to convert numerical values to strings. */

    try{
        /* Query database for closest matching gesture */
        st = db->createStatement() ; 
        /* Construct the query. Assume only that the right hand is used for now. */
        buffer << "SELECT gest FROM gesture_tbl WHERE hand = \"right\"" ;
        add_to_query( query, buffer, " AND in_flex = " ) ;
        buffer << nextGesture.Right().Index().Flex() ;
        add_to_query( query, buffer, " AND mi_flex = " ) ;
        buffer << nextGesture.Right().Middle().Flex() ;
        add_to_query( query, buffer, " AND ri_flex = " ) ;
        buffer << nextGesture.Right().Ring().Flex() ;
        add_to_query( query, buffer, " AND pi_flex = " ) ;
        buffer << nextGesture.Right().Pinky().Flex() ;
        add_to_query( query, buffer, " AND th_con_t = " ) ;
        buffer << nextGesture.Right().Thumb().ContactTip() ;
        add_to_query( query, buffer, " AND in_con_t = " ) ;
        buffer << nextGesture.Right().Index().ContactTip() ;
        add_to_query( query, buffer, " AND mi_con_t = " ) ;
        buffer << nextGesture.Right().Middle().ContactTip() ;
        add_to_query( query, buffer, " AND ri_con_t = " ) ;
        buffer << nextGesture.Right().Ring().ContactTip() ;
        add_to_query( query, buffer, " AND pi_con_t = " ) ;
        buffer << nextGesture.Right().Pinky().ContactTip() ;
        add_to_query( query, buffer, " AND ti_con_t = " ) ;
        buffer << nextGesture.Right().TiFold().ContactTip() ;
        add_to_query( query, buffer, " AND im_con_t = " ) ;
        buffer << nextGesture.Right().ImFold().ContactTip() ;
        add_to_query( query, buffer, " AND mr_con_t = " ) ;
        buffer << nextGesture.Right().MrFold().ContactTip() ;
        add_to_query( query, buffer, " AND rp_con_t = " ) ;
        buffer << nextGesture.Right().RpFold().ContactTip() ;
	/* Additional elements eventually to be added to query. */
	/* add_to_query( query, buffer, " AND in_con_m = " ) ;
           buffer << nextGesture.Right().Index.ContactMid() ;
           add_to_query( query, buffer, " AND mi_con_m = " ) ;
           buffer << nextGesture.Right().Middle.ContactMid() ;
           add_to_query( query, buffer, " AND ri_con_m = " ) ;
           buffer << nextGesture.Right().Ring.ContactMid() ;
           add_to_query( query, buffer, " AND pi_con_m = " ) ;
           buffer << nextGesture.Right().Pinky.ContactMid() ;
           unsigned int i ;                        // An iterator.
           for( i = 0 ; i < NUM_LSM303 ; i ++ ) {              
               add_to_query( query, buffer, " AND accel_303_" + string(itoa(i)) + "_x = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).AccelX() ;
               add_to_query( query, buffer, " AND accel_303_" + string(itoa(i)) + "_y = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).AccelY() ;
               add_to_query( query, buffer, " AND accel_303_" + string(itoa(i)) + "_z = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).AccelZ() ;
               add_to_query( query, buffer, " AND mag_303_" + string(itoa(i)) + "_x = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).MagX() ;
               add_to_query( query, buffer, " AND mag_303_" + string(itoa(i)) + "_y = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).MagY() ;
               add_to_query( query, buffer, " AND mag_303_" + string(itoa(i)) + "_z = " ) ;
               buffer << nextGesture.Right().Lsm303Vals(i).MagZ() ;
           }
           for( i = 0 ; i < NUM_LSM9DOF ; i ++ ) {
               add_to_query( query, buffer, " AND accel_9dof_" + string(itoa(i)) + "_x = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).AccelX() ;
               add_to_query( query, buffer, " AND accel_9dof_" + string(itoa(i)) + "_y = " ) ; 
               buffer << nextGesture.Right().Lsm9dofVals(i).AccelY() ;
               add_to_query( query, buffer, " AND accel_9dof_" + string(itoa(i)) + "_z = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).AccelZ() ;
               add_to_query( query, buffer, " AND accel_9dof_" + string(itoa(i)) + "_x = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).MagX() ;
               add_to_query( query, buffer, " AND mag_9dof_" + string(itoa(i)) + "_y = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).MagY() ;
               add_to_query( query, buffer, " AND mag_9dof_" + string(itoa(i)) + "_z = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).MagZ() ;
               add_to_query( query, buffer, " AND gyro_9dof_" + string(itoa(i)) + "_x = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).GyroX() ;
               add_to_query( query, buffer, " AND gyro_9dof_" + string(itoa(i)) + "_y = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).GyroY() ;
               add_to_query( query, buffer, " AND gyro_9dof_" + string(itoa(i)) + "_z = " ) ;
               buffer << nextGesture.Right().Lsm9dofVals(i).GyroZ() ;                      
           } 
	 */
        add_to_query( query, buffer, ";" ) ;
	/* Perform the query. */
        rSet = st->executeQuery( query ) ;
        if( rSet->rowsCount() > 0 ){
            /* Assume for now that the first element is correct.
               However, we should be refining the query in a do while loop 
               if there are multiple matches until there is a single match. */
   	    rSet->next() ;
    	    text += rSet->getString( "gest" ) ;
	}
    } catch( SQLException &e ){
        /* Database connection error. */
        print_error( e, scrText ) ;
        output_to_display( scrText, true ) ;
	return false ;
    }
    /* Clean up results. */ 
    delete rSet ;
    delete st ;

    return true ;

}

/*----------text_to_speech-----------------------------------------------------------

  PURPOSE:  Function to convert text to speech.  Consider using Festival APIs 
            directly in source code.
            Key functions include: festival_say_text
                                   festival_say_file
                                   festival_eval_command
                                   festival_text_to_wave
                                   festival_wait_for_spooler

  INPUT PARAMETERS: speech -- The text converted to speech.
                    text   -- The gesture converted to text

  RETURN VALUE:  true if the text was successfully converted to speech
                 false otherwise.

-----------------------------------------------------------------------------------*/

bool text_to_speech( string text, string ttsScript, const char* tfName ){

    string args = "--tts" ;                                   /* Command line arguments to supply to text to speech script. */
    string sysCall = ttsScript + " " + args + " "  + tfName ; /* The complete system call. */
    ofstream outputFile ;                                     /* File to write to. */
    int result ;                                              /* The status code returned by the text to speech script. */

    if( text.size() == 0 ){
        /* No text to convert, simply return. */
        return true ;
    }
    try{
        /* Write text to new file. */
        outputFile.open( tfName ) ;
        outputFile << text ;
        outputFile.close() ;
        /* Call text to speech script and supply the recently written to file. */
        result = system( sysCall.c_str() ) ;
    }catch( ... ){
        return false ;
    }
    if( result == EXIT_SUCCESS )
        return true ;
    return false ;

}

/*----------output_to_display---------------------------------------------------------

  PURPOSE:  Function to output text to the display.

  INPUT PARAMETERS: scrText  -- The collection of text to be printed to the screen.
                    eraseScr -- If true, erase the screen before printing.

-----------------------------------------------------------------------------------*/

void output_to_display( ScreenText scrText, bool eraseScr ){

    string buffer = "" ; /* The buffer of screen text to display. */

    if( eraseScr ) {
        wclear( stdscr ) ;
    }
    buffer = "Instructions:\t" + scrText.InstrData() ;
    printw( buffer.c_str() ) ;
    buffer = "Status:\t\t" + scrText.Status() ;
    printw( buffer.c_str() ) ;
    buffer = "Gesture:\t" + scrText.GestureConv() ;
    printw( buffer.c_str() ) ;
    buffer = "Gesture Data:\n\n" + scrText.GestureData() ;
    printw( buffer.c_str() ) ;
    refresh() ;

    return ;

}

/*----------clean_up-----------------------------------------------------------------

  PURPOSE:  Function to perform clean up before exiting the program.

  INPUT PARAMETERS: db -- The connection to the database.

  RETURN VALUE:  true if clean up was successful
                 false otherwise.

-----------------------------------------------------------------------------------*/

bool clean_up( Connection* db ){

    delete db ;
    delwin( stdscr ) ;
    endwin() ;

    return true ;

}

/*----------signal_handler-----------------------------------------------------------

  PURPOSE:  Function to indicate that the keyboard interrupt was pressed by setting 
            the keyboard interrupt flag.

  INPUT PARAMETERS: sig -- The value of the interrupt signal that was caught. 

-----------------------------------------------------------------------------------*/

void signal_handler( int sig ){ 

    kbFlag = 1 ; 

    return ;

}

/*----------file_exists--------------------------------------------------------------

  PURPOSE:  Function to check if a file exists.

  INPUT PARAMETERS: fName -- The name of the file to check for.

  RETURN VALUE:  true if the file exists
                 false otherwise.
    
-----------------------------------------------------------------------------------*/

bool file_exists( const char* fName ){

    struct stat buffer ;  /* Buffer to use with the stat function. */
    bool result = false ; /* The result of whether the file exists or not. */

    if( stat(fName, &buffer) == 0){
        result = true ;
    }

    return result ;

}

/*----------get_gesture--------------------------------------------------------------

  PURPOSE:  Function to collect sensor data from an XML file.

  INPUT PARAMETERS: nextGesture  -- The next set of gesture data to read in.
                                    An instance of class Gesture.
                    fName        -- The name of the file to read gesture data from.
                    scrText      -- The collection of text to display on the screen.
                    sensorStatus -- An indicator of the sensor status.
                    xmlVersion   -- The XML version.
                    convert      -- Used to track whether gesture conversion should be performed.

  RETURN VALUE:  true if the file was read successfully
                 false otherwise.
    
-----------------------------------------------------------------------------------*/

bool get_gesture( Hand nextHand[NUM_HANDS], const char* fName, ScreenText &scrText, xml_document<> &doc,
                  string &sensorStatus, string &xmlVersion, string &convert ){

    unsigned int i ;                                                                                     /* An iterator. */
    unsigned int j ;                                                                                     /* An iterator. */
    unsigned int k ;                                                                                     /* An iterator. */
    string fingerName[NUM_FINGERS] = {"thumb", "index", "middle", "ring", "pinky"} ;                     /* Finger names. */
    string foldName[NUM_FOLDS] = {"thumb-index", "index-middle", "middle-ring", "ring-pinky" } ;         /* Interdigital fold names. */
    string lsm303Names[NUM_LSM303_VALS] = {"accel-x", "accel-y", "accel-z", "mag-x", "mag-y", "mag-z"} ; /* LSM303 value names. */
    double lsm303AccelVals[NUM_LSM303_VALS] ;                                                            /* The next set of accelerometer values. */
    string lsm9dofNames[NUM_LSM9DOF_VALS] = {"accel-x", "accel-y", "accel-z", "mag-x", "mag-y", "mag-z", /* LSM303 value names. */
                                             "gyro-x", "gyro-y", "gyro-z"} ; 
    double lsm9dofAccelVals[NUM_LSM9DOF_VALS] ;                                                          /* The next set of accelerometer values. */

    /* Parse the XML file. */
    file<> xmlFile( fName ) ;
    doc.parse<0>( xmlFile.data() ) ;
    /* Collect sensor values. Start with the gestures node. */   
    xml_node<>* gestures = doc.first_node("gestures") ;      
    if( gestures == NULL )
        return false ;
    /* Get the gesture node. */
    xml_node<>* gesture = gestures->first_node("gesture") ;  
    if( gesture == NULL )
        return false ;
    xml_node<>* hand = gesture->first_node("hand") ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        if( hand == NULL )
            return false ;
        /* Initialize the hand, fingers, and inter-digital folds. */
        nextHand[i].LsmInit() ;
        Finger nextFinger[NUM_FINGERS] ;    /* The next set of fingers to be read in. */
        Fold nextFold[NUM_FOLDS] ;          /* The next set of interdigital folds to be read in. */
	Lsm303 nextLsm303[NUM_LSM303] ;     /* The next set of LSM303 accelerometer values to be read in. */
	Lsm9dof nextLsm9dof[NUM_LSM9DOF] ;  /* The next set of LSM9DOF accelerometer values to be read in. */
        /* Read the next hand node. */
        xml_attribute<> *handSide = hand->first_attribute("side") ;
        scrText.SetStatus( "Reading " + string(handSide->value()) + " hand\n" ) ;
	output_to_display( scrText, true ) ;
        for( j = 0 ; j < NUM_FINGERS ; j++ ){
	    /* Get the finger node. */ 
            xml_node<>* nextNode = hand->first_node( fingerName[j].c_str() ) ;  
            if( nextNode == NULL )
                return false ;
	    /* Get the tip contact sensor node. */ 
       	    xml_node<>* contactTip = nextNode->first_node("contact-tip") ;             
            if( contactTip == NULL )
                return false ;
            bool nextContactTipVal = false ;
            if( strcmp(contactTip->value(), "true") == 0 )
  	        nextContactTipVal = true ;
            /* Get the mid contact sensor node. The thumb only has a tip contact sensor. */ 
            bool nextContactMidVal = false ;
            if( fingerName[j].compare("thumb") != 0 ){
       	        xml_node<>* contactMid = nextNode->first_node("contact-mid") ;             
                if( contactMid == NULL )
                    return false ;
                if( strcmp(contactMid->value(), "true") == 0 )
    	            nextContactMidVal = true ;
	    }
	    /* Get the flex sensor node. */ 
   	    xml_node<>* flex = nextNode->first_node("flex") ;
            if( flex == NULL )
                return false ;
            double nextFlexVal = (double)atof( flex->value() ) ;
            nextFinger[j] = Finger( nextFlexVal, nextContactTipVal, nextContactMidVal ) ; 
        }
        for( j = 0 ; j < NUM_FOLDS ; j++ ){
	    /* Get the next interdigital fold node. */
            xml_node<>* nextNode = hand->first_node( foldName[j].c_str() ) ;     
            if( nextNode == NULL )
                return false ;
            /* Get the next contact sensor node. */
       	    xml_node<>* contactTip = nextNode->first_node("contact-tip") ;              
            if( contactTip == NULL )
                return false ;
            bool nextContactTipVal = false ;
            if( strcmp(contactTip->value(), "true") == 0 )
  	        nextContactTipVal = true ;
            nextFold[j] = Fold( nextContactTipVal ) ; 
	}
	/* Get the top and bottom LSM303 accelerometer values. */
        xml_node<>* lsm303 ;
	for( j = 0 ; j < NUM_LSM303 ; j++ ){
  	    if( j == 0 )
                lsm303 = hand->first_node("lsm303") ;  	  
	    else
   	        lsm303 = lsm303->next_sibling("lsm303") ;
            if( lsm303 == NULL )
                return false ;
            for( k = 0 ; k < NUM_LSM303_VALS ; k++ ){
	        xml_node<>* nextNode = lsm303->first_node( lsm303Names[k].c_str() ) ;  
                if( nextNode == NULL )
                    return false ;
                lsm303AccelVals[k] = (double)atof( nextNode->value() ) ;
	    }
            xml_attribute<>* lsm303Attr = lsm303->first_attribute("side") ;
  	    string lsm303Side = string( lsm303Attr->value() ) ;
  	    nextLsm303[j] = Lsm303( lsm303AccelVals[0], lsm303AccelVals[1], lsm303AccelVals[2],
                                    lsm303AccelVals[3], lsm303AccelVals[4], lsm303AccelVals[5], lsm303Side ) ;
	}
	/* Get the top and bottom LSM9DOF accelerometer values. */
        xml_node<>* lsm9dof ;
	for( j = 0 ; j < NUM_LSM9DOF ; j++ ){
	    if( j == 0 )
                lsm9dof = hand->first_node("lsm9dof") ;  
	    else
                lsm9dof = lsm9dof->next_sibling("lsm9dof") ;  
            if( lsm9dof == NULL )
                return false ;
            for( k = 0 ; k < NUM_LSM9DOF_VALS ; k++ ){
	        xml_node<>* nextNode = lsm9dof->first_node( lsm9dofNames[k].c_str() ) ;  
                if( nextNode == NULL )
                    return false ;
                lsm9dofAccelVals[k] = (double)atof( nextNode->value() ) ;
	    }
	    xml_attribute<>* lsm9dofAttr = lsm9dof->first_attribute("side") ;
            string lsm9dofSide = string( lsm9dofAttr->value() ) ;
            nextLsm9dof[j] = Lsm9dof( lsm9dofAccelVals[0], lsm9dofAccelVals[1], lsm9dofAccelVals[2],
                                      lsm9dofAccelVals[3], lsm9dofAccelVals[4], lsm9dofAccelVals[5],
                                      lsm9dofAccelVals[6], lsm9dofAccelVals[7], lsm9dofAccelVals[8], lsm9dofSide ) ;
	}
        /* Store the next hand set of data. */
        nextHand[i].Set( nextFinger[0], nextFinger[1], nextFinger[2], nextFinger[3], nextFinger[4],
                         nextFold[0], nextFold[1], nextFold[2], nextFold[3], 
                         nextLsm303[0], nextLsm303[1], nextLsm9dof[0], nextLsm9dof[1] ) ;         
        hand = hand->next_sibling("hand") ;
    }
    /* Get the sensor status. */
    xml_node<>* status = gestures->first_node( "status" ) ;
    if( status == NULL )
        return false ;
    sensorStatus = string( status->value() ) ;
    /* Get the conversion status. */
    xml_node<>* convertStatus = gestures->first_node( "convert" ) ;
    if( convertStatus == NULL )
        return false ;
    convert = string( convertStatus->value() ) ;
    /* Get the XML version. */
    xml_node<>* version = gestures->first_node("version") ;
    if( version == NULL )
        return false ;
    xmlVersion = string( version->value() ) ;     
    /* File read successfully. */ 
    return true ;

}

/*----------output_xml---------------------------------------------------------------

  PURPOSE:  Function to output updated XML file contents.

  INPUT PARAMETERS: outfName     -- The new name of the XML file.
                    text         -- The gesture converted to text.
                    nextGesture  -- The current set of gesture data.
                    sensorStatus -- An indicator of the sensor status.
                    xmlVersion   -- The XML version.

  RETURN VALUE:  true if the file was written successfully
                 false otherwise.
    
-----------------------------------------------------------------------------------*/

bool output_xml( const char* outfName, string &text, Gesture &nextGesture, string &sensorStatus, string &xmlVersion ){

    int i ;                                                                                              /* An iterator. */
    int j ;                                                                                              /* An iterator. */
    int k ;                                                                                              /* An iterator. */
    ofstream outputFile ;                                                                                /* File to write to. */
    string handName[NUM_HANDS] = {"left", "right"} ;                                                     /* Hand names. */
    string fingerName[NUM_FINGERS] = {"thumb", "index", "middle", "ring", "pinky"} ;                     /* Finger names. */
    string foldName[NUM_FOLDS] = {"thumb-index", "index-middle", "middle-ring", "ring-pinky"} ;          /* Interdigital fold names. */
    string lsm303Names[NUM_LSM303_VALS] = {"accel-x", "accel-y", "accel-z", "mag-x", "mag-y", "mag-z"} ; /* LSM303 value names. */
    string lsm9dofNames[NUM_LSM9DOF_VALS] = {"accel-x", "accel-y", "accel-z", "mag-x", "mag-y", "mag-z", /* LSM9DOF value names. */
                                             "gyro-x", "gyro-y", "gyro-z"} ; 

    /* Open the file and output the header information. */
    outputFile.open( outfName ) ;
    outputFile << "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\n" ;
    outputFile << "<?xml-stylesheet type=\"text/xsl\" href=\"gesture_data.xsl\"?>\n" ;
    outputFile << "<!DOCTYPE gestures SYSTEM \"gesture_data.dtd\">\n" ;
    /* Start with the gestures node. */   
    outputFile << "<gestures>\n" ;
    /* Proceed to the gesture node. */
    outputFile << "\t<gesture>\n" ;
    if( !nextGesture.Defined() ){
        /* No gesture data. Simply close out the XML file and return. */
        outputFile << "\t</gesture>\n" ;
        outputFile << "</gestures>\n" ;
	return true ;
    }
    for( i = 0 ; i < NUM_HANDS ; i++ ){
        /* Get the next hand .*/
        Hand nextHand ;
        if( handName[i].compare("left") == 0 ){
            nextHand = nextGesture.Left() ;
        }
        else if( handName[i].compare("right") == 0 ){
            nextHand = nextGesture.Right() ;
        }
	else{
  	    return false ;
	}
        outputFile << "\t\t<hand side=\"" << handName[i] << "\">\n" ;
        if( !nextHand.Defined() ){
            /* No hand data. Simply close out the hand and proceed. */
            outputFile << "\t\t</hand>\n" ;
            continue ;
        }
        for( j = 0 ; j < NUM_FINGERS ; j++ ){
            /* Get the next finger.*/
            Finger nextFinger ;
            if( fingerName[j].compare("thumb") == 0 ){
      	        nextFinger = nextHand.Thumb() ;
	    }
	    else if( fingerName[j].compare("index") == 0 ){
  	        nextFinger = nextHand.Index() ;
	    }
	    else if( fingerName[j].compare("middle") == 0 ){
  	        nextFinger = nextHand.Middle() ;
	    }
	    else if( fingerName[j].compare("ring") == 0 ){
  	        nextFinger = nextHand.Ring() ;
	    }
	    else if( fingerName[j].compare("pinky") == 0 ){
  	        nextFinger = nextHand.Pinky() ;
	    }
	    else{
	        return false ;
	    }
            outputFile << "\t\t\t<" << fingerName[j] << ">\n" ;
            if( !nextFinger.Defined() ){
                /* No finger data. Simply close out the finger and proceed. */
                outputFile << "\t\t\t</" << fingerName[j] << ">\n" ;
		continue ;
	    }
	    /* Get the flex sensor node. */ 
            outputFile << "\t\t\t\t<flex>" << nextFinger.Flex() << "</flex>\n" ;
	    /* Get the contact sensor node. */ 
            outputFile << "\t\t\t\t<contact-tip>" << nextFinger.ContactTip() << "</contact-tip>\n" ;
	    if( fingerName[j].compare("thumb") != 0 ){
	        /* Currently the thumb only has a tip contact sensor. */
                outputFile << "\t\t\t\t<contact-mid>" << nextFinger.ContactMid() << "</contact-mid>\n" ;
	    }
            outputFile << "\t\t\t</" << fingerName[j] << ">\n" ;
        }
        for( j = 0 ; j < NUM_FOLDS ; j++ ){
	    /* Get the next interdigital fold node. */
            Fold nextFold ;
            if( foldName[j].compare("thumb-index") == 0 ){
      	        nextFold = nextHand.TiFold() ;
	    }
            else if( foldName[j].compare("index-middle") == 0 ){
      	        nextFold = nextHand.ImFold() ;
	    }
            else if( foldName[j].compare("middle-ring") == 0 ){
      	        nextFold = nextHand.MrFold() ;
	    }
            else if( foldName[j].compare("ring-pinky") == 0 ){
      	        nextFold = nextHand.RpFold() ;
	    }
            else {
  	        return false ;
	    }
            outputFile << "\t\t\t<" << foldName[j] << ">\n" ;
            if( !nextFold.Defined() ){
                /* No interdigital fold data. Simply close out the fold and proceed. */
                outputFile << "\t\t\t</" << foldName[j] << ">\n" ;
  	        continue ;
	    }
            /* Get the next contact sensor node. */
            outputFile << "\t\t\t\t<contact-tip>" << nextFold.ContactTip() << "</contact-tip>\n" ;
            outputFile << "\t\t\t</" << foldName[j] << ">\n" ;
	}        
	/* Get the LSM303 accelerometer values. */
        for( j = 0 ; j < NUM_LSM303 ; j++ ){
            outputFile << "\t\t\t<lsm303 side=\"" << nextHand.Lsm303Vals(j).Side() << "\">\n" ;
            if( nextHand.Lsm303Vals(j).Defined() ){
                for( k = 0 ; k < NUM_LSM303_VALS ; k++ ){
                    outputFile << "\t\t\t\t<" << lsm303Names[k] << ">" ;
                    if( lsm303Names[k].compare("accel-x") == 0 ){
                        outputFile << nextHand.Lsm303Vals(j).AccelX() ; 
		    }
		    else if( lsm303Names[k].compare("accel-y") == 0 ){
		        outputFile << nextHand.Lsm303Vals(j).AccelY() ; 
		    }
		    else if( lsm303Names[k].compare("accel-z") == 0 ){
		        outputFile << nextHand.Lsm303Vals(j).AccelZ() ; 
		    }   
		    else if( lsm303Names[k].compare("mag-x") == 0 ){
		        outputFile << nextHand.Lsm303Vals(j).MagX() ; 
		    } 
		    else if( lsm303Names[k].compare("mag-y") == 0 ){
		        outputFile << nextHand.Lsm303Vals(j).MagY() ; 
		    } 
		    else if( lsm303Names[k].compare("mag-z") == 0 ){
		       outputFile << nextHand.Lsm303Vals(j).MagZ() ; 
		    } 
		    else{
		        return false ;
		    }
       	            outputFile << "</" << lsm303Names[j] << ">\n" ;
		}
 	    }
            outputFile << "\t\t\t</lsm303>\n" ;
	}
	/* Get the LSM9DOF accelerometer values. */
        for( j = 0 ; j < NUM_LSM9DOF ; j++ ){
            outputFile << "\t\t\t<lsm9dof side=\"" << nextHand.Lsm9dofVals(j).Side() << "\">\n" ;
            if( nextHand.Lsm9dofVals(j).Defined() ){
                for( k = 0 ; k < NUM_LSM9DOF_VALS ; k++ ){
      	            outputFile << "\t\t\t\t<" << lsm9dofNames[k] << ">" ;
                    if( lsm9dofNames[k].compare("accel-x") == 0 ){
  		        outputFile << nextHand.Lsm9dofVals(j).AccelX() ; 
		    }
		    else if( lsm9dofNames[k].compare("accel-y") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).AccelY() ; 
		    }
		    else if( lsm9dofNames[k].compare("accel-z") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).AccelZ() ; 
		    } 
		    else if( lsm9dofNames[k].compare("mag-x") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).MagX() ; 
		    } 
		    else if( lsm9dofNames[k].compare("mag-y") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).MagY() ; 
		    } 
		    else if( lsm9dofNames[k].compare("mag-z") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).MagZ() ; 
		    } 
		    else if( lsm9dofNames[k].compare("gyro-x") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).GyroX() ; 
		    } 
		    else if( lsm9dofNames[k].compare("gyro-y") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).GyroY() ; 
		    } 
		    else if( lsm9dofNames[k].compare("gyro-z") == 0 ){
		        outputFile << nextHand.Lsm9dofVals(j).GyroZ() ; 
		    } 
		    else{
		        return false ;
		    }
       	            outputFile << "</" << lsm9dofNames[k] << ">\n" ;
		}
 	    }
            outputFile << "\t\t\t</lsm9dof>\n" ;
	}
        outputFile << "\t\t</hand>\n" ;
    }
    outputFile << "\t</gesture>\n" ;
    /* Output the converted text. */
    outputFile << "\t\t<converted-text>" << text << "</converted-text>\n" ;
    /* Get the sensor status. */
    outputFile << "\t<status>" << sensorStatus << "</status>\n" ;
    /* After each read, the conversion status should always be set to false. */
    outputFile << "\t<convert>false</convert>\n" ;
    /* Get the XML version. */
    outputFile << "\t<version>" << xmlVersion << "</version>\n" ;
    outputFile << "</gestures>\n" ;
    outputFile.close() ;

    return true ;

}

void add_to_query( string &query, ostringstream &buffer, string stmt ){
    /* Function to add to query to be sent to SQL database. */

    /* Add in current buffer. */
    query += buffer.str() ;   
    /* Prepare next statement. */ 
    query += stmt ;
    /* Clear buffer. */
    buffer.str( "" ) ;
    buffer.clear() ;

    return ;

}
