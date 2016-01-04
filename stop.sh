export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export TRANSFER_DIR=microcontroller
export LOG_DIR=log
echo "Stopping web server"
PID=$(pgrep server.py)
kill $PID
sleep 1
cat $LOG_DIR/server_error.log >> $LOG_DIR/server.log
rm $LOG_DIR/server_error.log
echo "Stopping I2C transfers from sensors"
PID=$(pgrep i2ctransfer.py)
kill $PID
cat $LOG_DIR/transfer_error.log >> $LOG_DIR/transfer.log
rm $LOG_DIR/transfer_error.log
