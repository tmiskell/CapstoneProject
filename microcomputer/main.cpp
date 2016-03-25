#include <iostream>
#include <gtkmm.h>
#include <cstdlib>
#include <unistd.h>
#include <linux/reboot.h>
#include <sys/reboot.h>
#include <thread>
#include "variables.h"

int main (int argc,
      char **argv)
{
  
  Glib::RefPtr<Gtk::Application> app = Gtk::Application::create(argc, argv, "edu.uml.eece.capstone.sign2speech");

  ExampleWindow *window = new ExampleWindow();

  return app->run(*(window->getWindow()));
}
