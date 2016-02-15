# Setup directories.
export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export TRANSFER_DIR=microcontroller
export LOG_DIR=log
# Setup calibration settings.
THUMB_LB=1
THUMB_UB=60
INDEX_LB=50
INDEX_UB=60
MID_LB=50
MID_UB=60
RING_LB=50
RING_UB=60
PINKY_LB=50
PINKY_UB=60
# Setup the IP address for the server.
IP_ADDR=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
#IP_ADDR=127.0.0.1
# Configure the GPIO pins.
echo "Configuring GPIO pins"
gpio export 27 out
echo 1 > /sys/class/gpio/gpio27/value
sleep 1
# Start I2C transfers.
echo "Starting I2C transfers from sensors"
$TRANSFER_DIR/i2c_transfer $THUMB_LB $THUMB_UB $INDEX_LB $INDEX_UB $MID_LB $MID_UB $RING_LB $RING_UB $PINKY_LB $PINKY_UB > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
sleep 1
# Start the web server.
echo "Starting web server"
$GESTURE_DIR/server.py $IP_ADDR > $LOG_DIR/server.log 2> $LOG_DIR/server_error.log &
sleep 1
# Start sign to speech conversion.
cd $CONVERT_DIR
echo "Starting sign to speech conversion"
sleep 1
./sign2speech
