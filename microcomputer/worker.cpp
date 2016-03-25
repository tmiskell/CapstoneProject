#include "variables.h"
#include <sstream>
#include <iostream>

ExampleWorker::ExampleWorker() :
  m_Mutex(),
  m_shall_stop(false),
  m_has_stopped(false),
  m_text_done("Welcome to sign2speech!"),
  m_message()
{
}

// Accesses to these data are synchronized by a mutex.
// Some microseconds can be saved by getting all data at once, instead of having
// separate get_fraction_done() and get_message() methods.
void ExampleWorker::get_data(string* text_done, Glib::ustring* message) const
{
  Glib::Threads::Mutex::Lock lock(m_Mutex);

  if (text_done)
    *text_done = m_text_done;

  if (message)
    *message = m_message;
}

void ExampleWorker::stop_work()
{
  Glib::Threads::Mutex::Lock lock(m_Mutex);
  m_shall_stop = true;
}

bool ExampleWorker::has_stopped() const
{
  Glib::Threads::Mutex::Lock lock(m_Mutex);
  return m_has_stopped;
}

void ExampleWorker::do_work(ExampleWindow* caller)
{
  {
    Glib::Threads::Mutex::Lock lock(m_Mutex);
    m_has_stopped = false;
    m_text_done = "";
    m_message = "";
  } // The mutex is unlocked here by lock's destructor.

  // Simulate a long calculation.
  /* Start sign to speech conversion. */
    while( true ){
        Glib::Threads::Mutex::Lock lock(m_Mutex);
        /* Check if sensor data is available. */
        if( file_exists(fName) ){
	    /* Collect next set of data and store it as a gesture. */ 
  	    scrText.SetStatus( "Reading:\t" + string(fName) + "\n" ) ;
   	    output_to_display( scrText, true ) ;
            /* Add delay to make sure file has finished being written to before attempting to read. */
  	    nanosleep( &t1, &t2 ) ;
            if( rename(fName, intfName) != 0 ){
       	        scrText.SetStatus( "Unable to rename file:\t" + string(fName) + "\n" ) ;
	    }
            if( get_gesture( nextHand, intfName, scrText, doc, sensorStatus, xmlVersion, convert ) ){
                /* Store the next gesture set of data. */
                nextGesture = Gesture( nextHand[0], nextHand[1] ) ;     
                /* Update display for the next set of sensor values. */
  	        scrText.SetGestureData( nextGesture.AsString() ) ;
                /* Indicate file was successfully read. */
		scrText.SetStatus( "Successfully read:\t" + string(fName) + "\n" ) ;
                /* Rename the file so as not to re-read it. */
                if( rename(intfName, newfName) != 0 ){
  	   	    scrText.SetStatus( "Unable to rename file:\t" + string(intfName) + "\n" ) ;
		}
   	        output_to_display( scrText, true ) ;
	    }
	    else{
  	        scrText.SetStatus( "*** Error reading file. Attempting to continue ***\n" ) ;
        	output_to_display( scrText, true ) ;
		continue ;
	    }
            /* Convert the gesture to text. */
            if( gesture_to_text(nextGesture, db, m_text_done, scrText) ){
                /* Output the text to display */
  	        scrText.SetGestureConv( m_text_done + "\n" ) ;
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
            if( !output_xml(outfName, m_text_done, nextGesture, sensorStatus, xmlVersion) ){
  	        scrText.SetStatus( "Error while writing:\t" + string(outfName) + "\n" ) ;
	    }
   	    output_to_display( scrText, true ) ;
	}
	lock.release();
    	caller->notify();
	/* Check if user wants to output the gesture. */
        if( convert.compare("true") == 0 ){
            /* User signaled end of conversion. Convert the text to speech */ 
            if( !text_to_speech( m_text_done, ttsScript, tfName ) ){
  	        /* Text to speech error. */
	        scrText.SetStatus( "*** Unable to convert text to speech. Attempting to continue ***\n" ) ;
	    }
	    output_to_display( scrText, true) ;
            /* Reset text string for next gesture input. */
	    m_text_done = "" ;
            /* Indicate that the gesture has been converted. */
            convert = "false" ;
            /* Update XML file. */
            if( !output_xml(outfName, m_text_done, nextGesture, sensorStatus, xmlVersion) ){
  	        scrText.SetStatus( "Error while writing:\t" + string(outfName) + "\n" ) ;
	    }
            /* Indicate gesture was successfully converted. */
            scrText.SetStatus( "Successfully converted gesture\n" ) ;
            scrText.SetGestureData( "\n" ) ;
	}

    }
  Glib::Threads::Mutex::Lock lock(m_Mutex);
  m_shall_stop = false;
  m_has_stopped = true;
  lock.release();
  caller->notify();
}