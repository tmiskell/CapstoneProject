#!/usr/bin/python

from __future__ import with_statement

import smbus
import time
import sys
import os

class Data( object ):
    def __init__( self, finger=[], fold=[], accel=None ):
        self.finger = finger
        self.fold = fold
        self.accel = accel
    num_hands = 2
    num_fingers = 5
    num_folds = 4

class Finger( object ):
    def __init__( self, flex=0.0, contact=False ):
        self.flex = flex
        self.contact = contact

class Fold( object ):
    def __init__( self, contact=False ):
        self.contact = contact

class Accel( object ):
    def __init__( self, x=0.0, y=0.0, z=0.0 ):
        self.x = x
        self.y = y
        self.z = z

def init_data( ):

    data = []

    for i in range( Data.num_hands ):
        finger = []
        for j in range( Data.num_fingers ):
            finger.append( Finger() )
        fold = []
        for j in range( Data.num_folds ):
            fold.append( Fold() )
        accel = Accel()
        data.append( Data(finger, fold, accel) )

    return data

def i2c_read( bus, data, i2c_addr, num_bytes ):

    if bus is not None:
        raw_data = bus.read_byte_data( i2c_addr, num_bytes )
        i = 0
        k = 0
        while i < (Data.num_hands - 1): # Reduce number of hands by 1 since there is currently only 1 glove.
            j = 0
            while j < Data.num_fingers:
                data[i].finger[j].flex = float( raw_data[k] )
                k += 1
                data[i].finger[j].contact = bool( int(raw_data[k]) )
                k += 1
                j += 1
            j = 0
            while j < Data.num_folds:
                data[i].fold[j].contact = bool( int(raw_data[k]) )
                k += 1
                j += 1
            data[i].accel.x = float( raw_data[k] )
            k += 1
            data[i].accel.y = float( raw_data[k] )
            k += 1
            data[i].accel.z = float( raw_data[k] )
            k += 1
            i += 1

    return data

def add_header( lines ):

    lines.append( "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\n" )
    lines.append( "<!DOCTYPE gestures SYSTEM \"gesture_data.dtd\">\n" )
    lines.append( "<gestures>\n" )

    return lines

def add_body( data, lines ):

    i = 0
    j = 0

    hand_name = ["left",
                 "right"
                ]
    finger_name = ["thumb", 
                   "index", 
                   "middle", 
                   "ring", 
                   "pinky"
                  ]
    fold_name = ["thumb-index", 
                 "index-middle", 
                 "middle-ring", 
                 "ring-pinky"
                ]                 

    lines.append( "\t<gesture>\n" )
    for i in range( Data.num_hands ):
        lines.append( "\t\t<hand side=\"" + hand_name[i] + "\">\n" )
        for j in range( Data.num_fingers ):
            lines.append( "\t\t\t<" + finger_name[j] + ">\n" )
            lines.append( "\t\t\t\t<flex>" + str(data[i].finger[j].flex) + "</flex>\n" )
            lines.append( "\t\t\t\t<contact>" + str(data[i].finger[j].contact) + "</contact>\n" )
            lines.append( "\t\t\t</" + finger_name[j] + ">\n" )
        for j in range( Data.num_folds ):
            lines.append( "\t\t\t<" + fold_name[j] + ">\n" )
            lines.append( "\t\t\t\t<contact>" + str(data[i].fold[j].contact) + "</contact>\n" )
            lines.append( "\t\t\t</" + fold_name[j] + ">\n" )
        lines.append( "\t\t\t<accel>\n")
        lines.append( "\t\t\t\t<x>" + str(data[i].accel.x) + "</x>\n" )
        lines.append( "\t\t\t\t<y>" + str(data[i].accel.y) + "</y>\n" )
        lines.append( "\t\t\t\t<z>" + str(data[i].accel.z) + "</z>\n" )
        lines.append( "\t\t\t</accel>\n")
        lines.append( "\t\t</hand>\n" )
    lines.append( "\t</gesture>\n" )

    return lines

def add_footer( lines ):

    lines.append( "</gestures>\n" )

    return lines

def output_data( fName, data ):

    lines = []
    lines = add_header( lines )
    lines = add_body( data, lines )
    lines = add_footer( lines )

    with open( fName, 'w' ) as outputFile:
        outputFile.writelines( lines )

    return

def main( args ):

    prefix = "gesture_data"
    suffix = ".xml"
    outputDir = os.path.expanduser( "~/CapstoneProject/microcomputer" )
    fName = os.path.join( outputDir, prefix + suffix )
    i2c_addr = 0x60
    ret_val = os.EX_OK
    num_bytes = 20
    sleepTime = 5

    sys.stdout.write( "Initializing gesture data\n" )
    data = init_data( )
    sys.stdout.write( "Opening I2C connection\n" )
    try:
        bus = smbus.SMBus( 0 )
    except IOError as io_error:
        sys.stderr.write( "***" + str(io_error) + "***\n" )
        bus = None

    try:
        while( True ):
            sys.stdout.write( "Reading gesture data\n" )
            data = i2c_read( bus, data, i2c_addr, num_bytes )
            sys.stdout.write( "Writing:\t" + os.path.basename(fName) + "\n" )
            output_data( fName, data )
            time.sleep( sleepTime )
    except KeyboardInterrupt:
        sys.stdout.write( "Exiting\n" )

    return ret_val


if __name__ == "__main__":
    sys.exit( main(sys.argv) )
