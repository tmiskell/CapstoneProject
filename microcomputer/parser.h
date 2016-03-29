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
#include "lib/rapidxml/rapidxml.hpp"
#include "lib/rapidxml/rapidxml_utils.hpp"
/* MySQL includes. */
#include <mysql_driver.h>
#include <mysql_connection.h>
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
#define FLEX_TOL         5  /* The tolerance to use when matching flex sensor values. */
#define LSM303_TOL     100  /* The tolerance to use when matching LSM303 sensor values. */
#define LSM9DOF_TOL    100  /* The tolerance to use when matching LSM9DOF sensor values. */
#define NUM_J_MOTION     2  /* The number of intermediate gestures that involve the letter J. */
#define NUM_Z_MOTION     3  /* The number of intermediate gestures that involve the letter Z. */

using namespace std ;
using namespace sql ;
using namespace rapidxml ;

bool init( ScreenText &scrText ) ;
bool load_gesture_database( Driver* driver, Connection* &db, const char* dbURL, const char* un, const char* pw, const char* dbName, 
                            ScreenText &scrText ) ;
bool get_gesture( Hand nextHand[NUM_HANDS], const char* fName, ScreenText &scrText, xml_document<> &doc,
                  string &sensorStatus, string &xmlVersion, string &convert ) ;
bool output_xml( const char* outfName, string &text, Gesture &nextGesture, string &sensorStatus, string &xmlVersion ) ;
bool gesture_to_text( Gesture &nextGesture, Connection* db, string &text, ScreenText &scrText, bool motion ) ;
bool text_to_speech( string text, string ttsScript, const char* tfName ) ;
bool motion_gesture( string &text, const string motion[], const string invalid_motion, 
                     const string completed_motion, const unsigned int num_motion, const string motion_text ) ;
void add_to_query( string &query, ostringstream &buffer, string stmt ) ;
void output_to_display( ScreenText scrText, bool eraseScr ) ;
bool clean_up( Connection* db ) ;
bool file_exists( const char* fName ) ;
void signal_handler( int sig ) ;
void print_error( SQLException e, ScreenText &scrText ) ;
int setup();


