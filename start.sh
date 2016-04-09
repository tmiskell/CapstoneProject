#/bin/sh
# Setup directories.
export BASE_DIR=/home/$USER/CapstoneProject
export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export I2C_DIR=microcontroller
export LOG_DIR=log
# Setup calibration settings for each finger.
IN_LB=550
IN_UB=675
MID_LB=525
MID_UB=650
RI_LB=525
RI_UB=650
PI_LB=525
PI_UB=700
TH_LB=0
TH_UB=1023
UP_DEL=125
RD_DEL=100
# Setup the IP address for the server.
IP_ADDR=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
if ! [[ -z "$IP_ADDR" ]] ; then
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
# Start I2C transfers.
echo "Starting I2C transfers from sensors"
$I2C_DIR/i2c_transfer $IN_LB $IN_UB $MID_LB $MID_UB $RI_LB $RI_UB $PI_LB $PI_UB $TH_LB $TH_UB $UP_DEL $RD_DEL > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
sleep 1
# Start sign to speech conversion.
cd $CONVERT_DIR
gnome-terminal -e ./sign2speech
sleep 1
# Return to base directory and perform clean up.
cd $BASE_DIR
# Stop sign to speech conversion.
PID=$(pgrep sign2speech)
if ! [[ -z "$PID" ]] ; then
  echo "Stopping sign to speech conversion."
  kill $PID
  sleep 1
fi
# Stop I2C transfers.
PID=$(pgrep i2c_transfer)
if ! [[ -z "$PID" ]] ; then
  echo "Stopping I2C transfers from sensors"
  kill $PID
  sleep 1
fi
# Clean up GPIO pin configuration.
echo "Cleaning up GPIO pin configuration"
gpio unexportall
# Clean up XML files.
if [ -f $GESTURE_DIR/gesture_data_init.xml ] ; then
  echo "Cleaning up XML files"
  rm -v $GESTURE_DIR/gesture_data_init.xml
fi
# Request shutdown
echo "Requesting shutdown"
echo "shutdown" > /tmp/shutdown_request.txt
