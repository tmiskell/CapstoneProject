export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export TRANSFER_DIR=microcontroller
export LOG_DIR=log
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
