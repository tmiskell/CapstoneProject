#/bin/sh
# Setup directories.
export BASE_DIR=$HOME/CapstoneProject_No_GUI/CapstoneProject
export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export I2C_DIR=microcontroller
export LOG_DIR=log
# Setup scripts.
export I2C_PROG=i2c_transfer
export S2S_PROG=sign2speech
export GUI_PROG=gui.py
# Setup I2C calibration settings.
IN_LB=575
IN_UB=675
MID_LB=550
MID_UB=700
RI_LB=575
RI_UB=675
PI_LB=525
PI_UB=700
TH_LB=0
TH_UB=1023
UP_DEL=125
RD_DEL=100
# Setup sign to speech calibration settings.
FLEX_TOL=10
LSM303_TOL=100
LSM9DOF_TOL=100
GEST_DEL=3000
# Loop control variables used to check program flow.
CONT_EXEC=true
# Setup the IP address for the server.
IP_ADDR=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
if [[ -z "$IP_ADDR" ]] ; then
  # No internet connection
  IP_ADDR=127.0.0.1
fi
# Allow time for desktop environment to setup.
sleep 5
# Configure the GPIO pins.
echo "Configuring GPIO pins"
gpio export 27 out
echo 1 > /sys/class/gpio/gpio27/value
sleep 1
# Change to base directory
cd $BASE_DIR
while [ "$CONT_EXEC" = true ] ; do
  # Start I2C transfers.
  echo "Starting I2C transfers from sensors"
  $I2C_DIR/$I2C_PROG $IN_LB $IN_UB $MID_LB $MID_UB $RI_LB $RI_UB $PI_LB $PI_UB $TH_LB $TH_UB $UP_DEL $RD_DEL > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
  sleep 1
  if [ $? -ne 0 ] ; then
     echo $I2C_PROG " exited prematurely"
     continue
  fi
  # Start sign to speech conversion.
  cp $GESTURE_DIR/gesture_data_start.xml $GESTURE_DIR/gesture_data.xml
  echo "stop" > $GESTURE_DIR/cmd.txt
  cd $CONVERT_DIR
  echo "Starting sign to speech conversion"
  #CMD='"./'$S2S_PROG' '$FLEX_TOL' '$LSM303_TOL' '$LSM9DOF_TOL' '$GEST_DEL'"'
  #gnome-terminal --maximize --show-menubar --title=sign2speech --zoom=1.0 -e $CMD &
  #gnome-terminal --maximize --show-menubar --title=sign2speech --zoom=0.5 -e "./sign2speech 10 100 100 3000" &
  ./$S2S_PROG $FLEX_TOL $LSM303_TOL $LSM9DOF_TOL $GEST_DEL &
  sleep 3
  if [ $? -ne 0 ] ; then
     echo $S2S_PROG " exited prematurely"
     # Stop I2C transfers.
     PID=$(pgrep i2c_transfer)
     if ! [[ -z "$PID" ]] ; then
       echo "Stopping I2C transfers from sensors"
       kill $PID
       sleep 1
     fi
     # Stop web server.
     PID=$(pgrep server.py)
     if ! [[ -z "$PID" ]] ; then
       echo "Stopping web server"
       kill $PID
       sleep 1
     fi
     continue
  fi
  # Open the web browser. Add -e Fullscreen to open browser in full screen. Alternatives include:
  #echo "Opening the web browser"
  #epiphany-browser -a --profile $HOME/.config http://$IP_ADDR:8080
  #epiphany-browser http://$IP_ADDR:8080 > /dev/null 2>&1
  cd $BASE_DIR/$GESTURE_DIR
  echo "Starting GUI"
  ./$GUI_PROG > $BASE_DIR/$LOG_DIR/gui.log 2> $BASE_DIR/$LOG_DIR/gui_error.log
  # Determine if program exited normally. If not restart all processes.
  STATUS=$?
  if [ $STATUS -eq 0 ] ; then
    CONT_EXEC=false
  fi
  # Return to base directory and perform clean up.
  cd $BASE_DIR
  echo "stop" > $GESTURE_DIR/cmd.txt
  # Stop web server.
  PID=$(pgrep server.py)
  if ! [[ -z "$PID" ]] ; then
    echo "Stopping web server"
    kill $PID
    sleep 1
  fi
  # Stop I2C transfers.
  PID=$(pgrep i2c_transfer)
  if ! [[ -z "$PID" ]] ; then
    echo "Stopping I2C transfers from sensors"
    kill -9 $PID
    sleep 1
  fi
  # Stop sign to speech conversion.
  PID=$(pgrep sign2speech)
  if ! [[ -z "$PID" ]] ; then
    echo "Stopping sign to speech conversion."
    kill $PID
    sleep 1
  fi
  # Clean up XML files.
  if [ -f $GESTURE_DIR/gesture_data_init.xml ] ; then
    echo "Cleaning up XML files"
    rm -v $GESTURE_DIR/gesture_data_init.xml
  fi
done
# Clean up GPIO pin configuration.
echo "Cleaning up GPIO pin configuration"
gpio unexportall
# Make sure we reset to terminal after using GUI
reset
# Request shutdown
echo "Requesting shutdown"
echo "shutdown" > /tmp/shutdown_request.txt
