#include "battery_indicator.h"

int getBatteryState() {

  system("upower -i /org/freedesktop/UPower/devices/battery_BAT0 |grep 'percentage:' |awk '{print $2}' > percentage.txt");

  char * buffer = 0;
  long length; 
  FILE * f = fopen ("percentage.txt", "rb");

  if (f)
  {
    fseek (f, 0, SEEK_END);
    length = ftell (f);
    fseek (f, 0, SEEK_SET);
    buffer = (char *) malloc (length);
    if (buffer)
    {
      fread (buffer, 1, length, f);
    }
    fclose (f);
  }

  if (buffer)
  {
    // start to process your data / extract strings here...
    std::string str(buffer);
    str = str.substr(0, str.length() - 1);
    return stoi(str);
  }

  return 100;

}