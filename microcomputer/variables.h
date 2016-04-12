#ifndef VARIABLES_H
#define VARIABLES_H

#include <gtkmm.h>
#include <gdkmm.h>
#include "parser.h"
#include <iostream>
#include "battery_indicator.h"

extern Gesture nextGesture ;                                           /* The next gesture to be read in. */
extern Hand nextHand[NUM_HANDS] ;                                      /* The next pair of hands to be read in. */
extern const char* fName; 					       /* The XML file containing sensor data. */
extern const char* intfName;                                           /* The XML file containing sensor data to be read. */
extern const char* newfName;                                           /* The parsed XML file containing sensor data. */
extern const char* outfName;                                           /* The XML file that was just read. */
extern const char* dbName;                                             /* The database name to use. */
extern int result ;                                                    /* Indicates whether program terminated successfully. */ 
extern Driver* driver;                                                 /* The SQL driver. */
extern Connection* db;                                                 /* The connection to the database. */
extern const char* dbURL;                                              /* The database location. */
extern const char* un;                                                 /* The database username. */
extern const char* pw;                                                 /* The database password. */
extern string ttsScript;                                               /* Location of the text to speech script. */
extern string xmlVersion ;                                             /* The XML version. */
extern string sensorStatus ;                                           /* An indicator of the sensor status. */
extern const char* tfName;                                             /* Name of the file to write to. */
extern ScreenText scrText ;                                            /* The collection of text to display on the screen. */
extern xml_document<> doc ;                                          /* The contents of the most recent XML document. */
extern string convert;                                               /*Used to track whether gesture conversion should be performed.*/
extern struct timespec t1 ;                                            /* The amount of time to sleep in nanoseconds. */
extern struct timespec t2 ;                                            /* The time residual. */
extern bool motion;                                            /* An indicator if the current gesture involves motion. */
extern const string completed_j;                            /* A completed J gesture. */
extern const string completed_z;                          /* A completed Z gesture. */
extern const string invalid_j;
extern const string invalid_z;
extern const string j_motion[NUM_J_MOTION];
extern const string z_motion[NUM_Z_MOTION];
extern bool added_text;
extern struct timespec t3 ; /* The amount of time to sleep in nanoseconds. */
extern struct timespec t4 ; /* The time residual. */

class ExampleWindow;

class ExampleWorker
{
public:
  ExampleWorker();

  // Thread function.
  void do_work(ExampleWindow *caller);

  void get_data(string* text_done, Glib::ustring* message) const;
  string get_data_2();
  void set_data(string text_done);
  void stop_work();
  bool has_stopped() const;

private:
  // Synchronizes access to member data.
  mutable Glib::Threads::Mutex m_Mutex;

  // Data used by both GUI thread and worker thread.
  bool m_shall_stop;
  bool m_has_stopped;
  string m_text_done;
  Glib::ustring m_message;
};

class ExampleWindow : public Gtk::Window
{
public:
  ExampleWindow();

  // Called from the worker thread.
  void notify();

private:
  // Signal handlers.
  void on_start_button_clicked();
  void on_stop_button_clicked();
  void on_output_button_clicked();
  void on_reset_button_clicked();
  void on_quit_button_clicked();
  bool update_battery();

  void update_widgets();

  // Dispatcher handler.
  void on_notification_from_worker_thread();

  // Member data.
  Gtk::Button m_ButtonStart;
  Gtk::Button m_ButtonOutput;
  Gtk::Button m_ButtonReset;
  Gtk::Button m_ButtonQuit;
  Gtk::Label  m_Label, m_Label2;
  Gtk::Box    m_box1;
  Gtk::Box    m_box2;
  Gtk::Box    m_box3;
  Gtk::ProgressBar m_bar;

  Glib::Dispatcher m_Dispatcher;
  ExampleWorker m_Worker;
  Glib::Threads::Thread* m_WorkerThread;
  sigc::connection m_connection_timeout;
};


#endif
