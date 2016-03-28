export GESTURE_DIR=gesture_data
echo "Stopping web server"
PID=$(pgrep server.py)
kill $PID
sleep 1
echo "Stopping I2C transfers from sensors"
PID=$(pgrep i2c_transfer)
kill $PID
sleep 1
echo "Cleaning up GPIO pin configuration"
gpio unexportall
echo "Cleaning up XML files"
rm -v $GESTURE_DIR/gesture_data_init.xml