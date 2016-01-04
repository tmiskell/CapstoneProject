export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export TRANSFER_DIR=microcontroller
export LOG_DIR=log
echo "Starting I2C transfers from sensors"
$TRANSFER_DIR/i2ctransfer.py > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
sleep 1
echo "Starting web server"
$GESTURE_DIR/server.py > $LOG_DIR/server.log 2> $LOG_DIR/server_error.log &
sleep 1
echo "Starting sign to speech conversion"
$CONVERT_DIR/sign2speech
