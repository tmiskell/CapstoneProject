#include "variables.h"

Gesture nextGesture ;                                            /* The next gesture to be read in. */
    Hand nextHand[NUM_HANDS] ;                                       /* The next pair of hands to be read in. */
    const char* fName   = "../gesture_data/gesture_data_init.xml" ;  /* The XML file containing sensor data. */
    const char* intfName = "../gesture_data/gesture_data_read.xml" ; /* The XML file containing sensor data to be read. */
    const char* newfName = "../gesture_data/gesture_data.complete" ; /* The parsed XML file containing sensor data. */
    const char* outfName = "../gesture_data/gesture_data.xml" ;      /* The XML file that was just read. */
    const char* dbName   = "gesture" ;                               /* The database name to use. */
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
    string convert ="false" ;                                        /*Used to track whether gesture conversion should be performed.*/
    struct timespec t1 ;                                             /* The amount of time to sleep in nanoseconds. */
    struct timespec t2 ;                                             /* The time residual. */
