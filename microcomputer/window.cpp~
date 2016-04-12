#include "variables.h"
#include <iostream>
#include <unistd.h>

ExampleWindow::ExampleWindow() :
  m_ButtonStart("Start Conversion"),
  m_ButtonOutput("Output"),
  m_ButtonReset("Reset"),
  m_ButtonQuit("Quit"),
  m_Label("Welcome to sign2speech!"),
  m_Label2("Power: "),
  m_box1(Gtk::ORIENTATION_VERTICAL),
  m_box2(Gtk::ORIENTATION_HORIZONTAL),
  m_box3(Gtk::ORIENTATION_HORIZONTAL),
  m_Dispatcher(),
  m_Worker(),
  m_WorkerThread(nullptr)
  
{

    /* Perform initialization. */
    if( !init( scrText ) ){
        scrText.SetStatus( "*** Error during initialization ***\n" ) ;
	output_to_display( scrText, true ) ;
        result = EXIT_FAILURE ;
        exit( result ) ;
    }
    t1.tv_sec = 0 ;
    t1.tv_nsec = 20000000L ;
    scrText.SetStatus( "Initialized\n" ) ;
    output_to_display( scrText, true ) ;
    /* Connect to the gesture database. */
    if( !load_gesture_database( driver, db, dbURL, un, pw, dbName, scrText ) ){
        //scrText.SetStatus( "*** Error connecting to database ***\n" ) ;
	//output_to_display( scrText, true ) ;
        result = EXIT_FAILURE ;
        exit( result ) ;    
    }
    scrText.SetStatus( "Loaded gesture database\n" ) ;
    output_to_display( scrText, true ) ;

    fullscreen();
    m_box1.pack_start(m_box3);
    m_box1.pack_start(m_Label, true, true);

    m_Label.set_line_wrap(true);
    m_Label.set_line_wrap_mode(Pango::WRAP_WORD);
    m_Label.set_ellipsize(Pango::ELLIPSIZE_NONE);

    m_Label.override_font(Pango::FontDescription("Arial, bold, 30"));
    m_ButtonStart.override_font(Pango::FontDescription("Arial, medium, 24"));
    m_ButtonOutput.override_font(Pango::FontDescription("Arial, medium, 24"));
    m_ButtonReset.override_font(Pango::FontDescription("Arial, medium, 24"));
    m_ButtonQuit.override_font(Pango::FontDescription("Arial, medium, 24"));

    m_box2.pack_start(m_ButtonQuit);
    m_box2.pack_start(m_ButtonReset);
    m_box2.pack_start(m_ButtonOutput);
    m_box2.pack_start(m_ButtonStart);

    m_box1.pack_start(m_box2);

    m_box1.set_homogeneous(false);
    m_box1.set_spacing(250);
    m_box3.set_homogeneous(false);

    m_box3.pack_end(m_bar, Gtk::PACK_SHRINK);
    m_box3.pack_end(m_Label2, Gtk::PACK_SHRINK);

    m_bar.set_show_text(true);
    

    m_connection_timeout = Glib::signal_timeout().connect(sigc::mem_fun(*this,
              &ExampleWindow::update_battery), 50 );

      // Connect the signal handlers to the buttons.
    m_ButtonStart.signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_start_button_clicked));
    m_ButtonOutput.signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_output_button_clicked));
    m_ButtonReset.signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_reset_button_clicked));
    m_ButtonQuit.signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_quit_button_clicked));

    // Connect the handler to the dispatcher.
    m_Dispatcher.connect(sigc::mem_fun(*this, &ExampleWindow::on_notification_from_worker_thread));  

    add(m_box1);
    m_bar.set_fraction(0.0);

    show_all_children();
}

void ExampleWindow::on_start_button_clicked()
{
  if (m_WorkerThread)
  {
    std::cout << "Can't start a worker thread while another one is running." << std::endl;
  }
  else
  {
    // Start a new worker thread.
    m_WorkerThread = Glib::Threads::Thread::create(
      sigc::bind(sigc::mem_fun(m_Worker, &ExampleWorker::do_work), this));
  }
}

bool ExampleWindow::update_battery() {

  int chargelevel = getBatteryState();

  m_bar.set_fraction(chargelevel / 100.0);

  return true;

}

void ExampleWindow::on_stop_button_clicked()
{
  if (!m_WorkerThread)
  {
    std::cout << "Can't stop a worker thread. None is running." << std::endl;
  }
  else
  {
   // Order the worker thread to stop.
    m_Worker.stop_work();
  }
}

void ExampleWindow::on_reset_button_clicked()
{
  if (m_WorkerThread)
  {
    m_Worker.stop_work();
    usleep(10);
    m_Worker.set_data("");
    motion = false;
    m_Label.set_text("");
  }
    // Start a new worker thread.
    m_WorkerThread = Glib::Threads::Thread::create(
      sigc::bind(sigc::mem_fun(m_Worker, &ExampleWorker::do_work), this));
}

void ExampleWindow::on_output_button_clicked() {
cout << "Output Clicked" << endl;
if (m_WorkerThread)
  {
    m_Worker.stop_work();
    usleep(10);
    m_Worker.set_data("");
    m_Label.set_text("");
    motion = false;
  }
    system ("festival --tts speech.txt");
    // Start a new worker thread.
    m_WorkerThread = Glib::Threads::Thread::create(
      sigc::bind(sigc::mem_fun(m_Worker, &ExampleWorker::do_work), this));

}

void ExampleWindow::update_widgets()
{
  string text_done;
  Glib::ustring message_from_worker_thread;
  m_Worker.get_data(&text_done, &message_from_worker_thread);
  m_Label.set_text(text_done);
  ofstream outputFile ;
  try{
        /* Write text to new file. */
        outputFile.open( "speech.txt" ) ;
        outputFile << text_done ;
        outputFile.close() ;
    }catch( ... ){
    }

}

void ExampleWindow::on_quit_button_clicked()
{
  exit(0);
}

// notify() is called from ExampleWorker::do_work(). It is executed in the worker
// thread. It triggers a call to on_notification_from_worker_thread(), which is
// executed in the GUI thread.
void ExampleWindow::notify()
{
  m_Dispatcher.emit();
}

void ExampleWindow::on_notification_from_worker_thread()
{
  if (m_WorkerThread && m_Worker.has_stopped())
  {
    // Work is done.
    m_WorkerThread->join();
    m_WorkerThread = nullptr;
  }
  update_widgets();
}
