# Setup directories.
export GESTURE_DIR=gesture_data
export CONVERT_DIR=microcomputer
export I2C_DIR=microcontroller
export LOG_DIR=log
# Setup calibration settings for each finger.
IN_LB=550
IN_UB=675
MID_LB=525
MID_UB=675
RI_LB=525
RI_UB=675
PI_LB=525
PI_UB=700
TH_LB=0
TH_UB=1023
UP_DEL=125
RD_DEL=100
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
$I2C_DIR/i2c_transfer $IN_LB $IN_UB $MID_LB $MID_UB $RI_LB $RI_UB $PI_LB $PI_UB $TH_LB $TH_UB $UP_DEL $RD_DEL > $LOG_DIR/transfer.log 2> $LOG_DIR/transfer_error.log &
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
