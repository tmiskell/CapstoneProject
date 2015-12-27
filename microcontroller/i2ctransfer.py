#!/usr/bin/python

from __future__ import with_statement

import smbus
import time
import sys
import os

class Data( object ):
    """ Class to store the gesture data."""

    def __init__( self, finger=[], fold=[], accel=None ):
        self.finger = finger
        self.fold = fold
        self.accel = accel
    num_hands = 2
    num_fingers = 5
    num_folds = 4

class Finger( object ):
    """ Class to store the finger data."""

    def __init__( self, flex=0, contact=False ):
        self.flex = flex
        self.contact = contact

class Fold( object ):
    """ Class to store the fold data."""

    def __init__( self, contact=False ):
        self.contact = contact

class Accel( object ):
    """ Class to store the accelerometer data. """

    def __init__( self, x=0.0, y=0.0, z=0.0 ):
        self.x = x
        self.y = y
        self.z = z

def init_data( ):
    """ Initializes the gesture data. """

    data = []  # The gesture data.

    for i in range( Data.num_hands ):
        finger = []     # The finger data.
        for j in range( Data.num_fingers ):
            finger.append( Finger() )
        fold = []       # The fold data.
        for j in range( Data.num_folds ):
            fold.append( Fold() )
        accel = Accel() # The accelerometer data.
        data.append( Data(finger, fold, accel) )

    return data

def i2c_read( bus, data, i2c_addr, num_bytes ):
    """ Transfers data from the slave device over the I2C bus.
        Adjusts the data accordingly. 
        Flex sensor values are expressed as a percentage. 
        Contact sensor values are expressed as a boolean. """

    num_bits = 10                 # The number of bits used by microcontroller for ADC conversion.
    max_val = (2 ** num_bits) - 1 # The maximum possible value for an ADC conversion.
    raw_data = None               # The next set of raw data read from the bus.
    dec_places = 0                # The number of decimal places to use when rounding the data.

    if bus is not None:
        # Read next set of gesture data.
        raw_data = bus.read_byte_data( i2c_addr, num_bytes ) 
        i = 0 # An iterator.
        k = 0 # An iterator.
        while i < (Data.num_hands - 1): # Reduce number of hands by 1 since there is currently only 1 glove.
            # Collect next set of finger data.
            j = 0 # An iterator.
            while j < Data.num_fingers:
                data[i].finger[j].flex = round((float(raw_data[k]) / max_val) * 100.0, dec_places)
                k += 1
                data[i].finger[j].contact = bool( int(raw_data[k]) )
                k += 1
                j += 1
            j = 0
            # Collect next set of fold data.
            while j < Data.num_folds:
                data[i].fold[j].contact = bool( int(raw_data[k]) )
                k += 1
                j += 1
            # Collect the next set of accelerometer data.
            data[i].accel.x = float(raw_data[k])
            k += 1
            data[i].accel.y = float(raw_data[k])
            k += 1
            data[i].accel.z = float(raw_data[k])
            k += 1
            i += 1

    return data

def add_header( lines ):
    """ Adds th header to the output file. """

    lines.append( "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\n" )
    lines.append( "<?xml-stylesheet type=\"text/xsl\" href=\"gesture_data.xsl\"?>\n" )
    lines.append( "<!DOCTYPE gestures SYSTEM \"gesture_data.dtd\">\n" )

    return lines

def add_body( data, lines ):
    """ Adds the body of content to the output file. """

    i = 0                       # An iterator.
    j = 0                       # An iterator.
    hand_name = ["left",        # A list of names for the hands.
                 "right"
                ]
    finger_name = ["thumb",     # A list of names for the fingers.
                   "index", 
                   "middle", 
                   "ring", 
                   "pinky"
                  ]
    fold_name = ["thumb-index", # A list of names for the folds between fingers.
                 "index-middle", 
                 "middle-ring", 
                 "ring-pinky"
                ]                 

    # Write the next set of gestures.
    lines.append( "<gestures>\n" )
    # Write the next gesture.
    lines.append( "\t<gesture>\n" )
    for i in range( Data.num_hands ):
        # Write the next set of hand data.
        lines.append( "\t\t<hand side=\"" + hand_name[i] + "\">\n" )
        for j in range( Data.num_fingers ):
            # Write the next set of finger data.
            lines.append( "\t\t\t<" + finger_name[j] + ">\n" )
            lines.append( "\t\t\t\t<flex>" + str(data[i].finger[j].flex) + "</flex>\n" )
            lines.append( "\t\t\t\t<contact>" + str(data[i].finger[j].contact) + "</contact>\n" )
            # Close out the finger data.
            lines.append( "\t\t\t</" + finger_name[j] + ">\n" )
        for j in range( Data.num_folds ):
            # Write the next set of fold data.
            lines.append( "\t\t\t<" + fold_name[j] + ">\n" )
            lines.append( "\t\t\t\t<contact>" + str(data[i].fold[j].contact) + "</contact>\n" )
            # Close out the fold data.
            lines.append( "\t\t\t</" + fold_name[j] + ">\n" )
        # Write the next set of accelerometer data. 
        lines.append( "\t\t\t<accel>\n")
        lines.append( "\t\t\t\t<x>" + str(data[i].accel.x) + "</x>\n" )
        lines.append( "\t\t\t\t<y>" + str(data[i].accel.y) + "</y>\n" )
        lines.append( "\t\t\t\t<z>" + str(data[i].accel.z) + "</z>\n" )
        lines.append( "\t\t\t</accel>\n")
        # Close out the hand data.
        lines.append( "\t\t</hand>\n" )
    # Close out the gesture data.
    lines.append( "\t</gesture>\n" )
    # Close out the set of gestures.
    lines.append( "</gestures>\n" )

    return lines

def output_data( fName, data ):
    """ Generates the output file. """

    lines = []  # The lines to write to the output file.

    # Generate the output file.
    lines = add_header( lines )
    lines = add_body( data, lines )
    # Write the output file.
    with open( fName, 'w' ) as outputFile:
        outputFile.writelines( lines )

    return

def main( args ):
    """ Main program. """

    prefix = "gesture_data"                                             # Prefix of the output file.
    suffix = ".xml"                                                     # Suffix of the output file. 
    outputDir = os.path.expanduser( "~/CapstoneProject/microcomputer" ) # Directory of the output file.
    fName = os.path.join( outputDir, prefix + suffix )                  # Absolute path of output file.
    i2c_addr = 0x22                                                     # I2C address of microcontroller slave.
    ret_val = os.EX_OK                                                  # Return status code
    num_bytes = 20                                                      # The total number of bytes to read from the slave device.
    sleepTime = 5                                                       # The amount of time to sleep between transfers.
    bus = None                                                          # I2C connection.

    # Initialize the gesture data.
    sys.stdout.write( "Initializing gesture data\n" )
    data = init_data( )
    try:
        while( True ):
            if bus is None:
                # Open the I2C connection.
                sys.stdout.write( "Opening I2C connection\n" )
                try:
                    bus = smbus.SMBus( 0 )
                except IOError as io_error:
                    sys.stderr.write( "*** Error while attempting I2C communication. ***\n" )
                    sys.stderr.write( "***" + str(io_error) + "***\n" )
                    sys.stderr.write( "*** Attempting to continue. ***\n" )
            # Read the gesture data.
            sys.stdout.write( "Reading gesture data\n" )
            data = i2c_read( bus, data, i2c_addr, num_bytes )
            # Update the output file.
            sys.stdout.write( "Writing:\t" + os.path.basename(fName) + "\n" )
            output_data( fName, data )
            # Wait for a brief period of time and then perform the next transfer.
            time.sleep( sleepTime )
    except KeyboardInterrupt:
        sys.stdout.write( "Exiting\n" )

    return ret_val

if __name__ == "__main__":
    sys.exit( main(sys.argv) )
