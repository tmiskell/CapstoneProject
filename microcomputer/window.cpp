#include "variables.h"
#include <iostream>
#include <unistd.h>

ExampleWindow::ExampleWindow() :
  m_Dispatcher(),
  m_Worker(),
  m_WorkerThread(nullptr)
{
  
  //Load the GtkBuilder file and instantiate its widgets:
  Glib::RefPtr<Gtk::Builder> refBuilder = Gtk::Builder::create();
  try
  {
    refBuilder->add_from_file("Main.glade");
  }
  catch(const Glib::FileError& ex)
  {
    std::cerr << "FileError: " << ex.what() << std::endl;
  }
  catch(const Glib::MarkupError& ex)
  {
    std::cerr << "MarkupError: " << ex.what() << std::endl;
  }
  catch(const Gtk::BuilderError& ex)
  {
    std::cerr << "BuilderError: " << ex.what() << std::endl;
  }

  refBuilder->get_widget("applicationwindow1", m_Window);

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
    
    refBuilder->get_widget("label1", m_Label);
    if (m_Label) {
      // place label logic here
      m_Label->set_text("Welcome to sign2speech!");
    }

    refBuilder->get_widget("button1", m_ButtonOutput);
    refBuilder->get_widget("button2", m_ButtonReset);
    refBuilder->get_widget("button3", m_ButtonQuit);
    refBuilder->get_widget("button4", m_ButtonStart);

    

  // Connect the signal handlers to the buttons.
  m_ButtonStart->signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_start_button_clicked));
  m_ButtonOutput->signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_output_button_clicked));
  m_ButtonReset->signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_reset_button_clicked));
  m_ButtonQuit->signal_clicked().connect(sigc::mem_fun(*this, &ExampleWindow::on_quit_button_clicked));

  // Connect the handler to the dispatcher.
  m_Dispatcher.connect(sigc::mem_fun(*this, &ExampleWindow::on_notification_from_worker_thread));

  show_all_children();
}

Gtk::ApplicationWindow* ExampleWindow::getWindow() {

  return m_Window;

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

  m_Label->set_text(text_done);
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
