export BASE_DIR=/home/$USER/CapstoneProject_No_GUI
export GESTURE_DIR=gesture_data
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
  kill $PID
  sleep 1
fi
# Clean up GPIO pin configuration.
echo "Cleaning up GPIO pin configuration"
gpio unexportall
# Clean up XML files.
cd $BASE_DIR
if [ -f $GESTURE_DIR/gesture_data_init.xml ] ; then
  echo "Cleaning up XML files"
  rm -v $GESTURE_DIR/gesture_data_init.xml
fi