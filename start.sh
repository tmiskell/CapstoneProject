export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export TRANSFER_DIR=microcontroller
export LOG_DIR=log
IP_ADDR=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
#echo "Configuring GPIO pins"
#gpio export 17 out
#sleep 1
echo "Starting I2C transfers from sensors"
$TRANSFER_DIR/i2c_transfer > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
sleep 1
echo "Starting web server"
$GESTURE_DIR/server.py $IP_ADDR > $LOG_DIR/server.log 2> $LOG_DIR/server_error.log &
sleep 1
cd $CONVERT_DIR
pwd
echo "Starting sign to speech conversion"
sleep 1
./sign2speech
