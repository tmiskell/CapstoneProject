#!/usr/bin/python
from __future__ import with_statement

import sys
import os

class Data( object ):
    """ Class to store the gesture data."""

    def __init__( self, flex=[], contact=[], lsm303=[], lsm9dof=[], gesture="" ):
        self.flex = flex
        self.contact = contact
        self.lsm303 = lsm303
        self.lsm9dof = lsm9dof
        self.gesture = gesture

def add_header( lines ):
    """ Adds the header to the output file. """

    lines.append( "/* Create the table. */\n" )
    lines.append( "/* Key: */\n" ) 
    lines.append( "/*        hand:		The hand, either left or right. */\n" )
    lines.append( "/*        th_flex: 	The thumb flex sensor value. */\n" )
    lines.append( "/*        in_flex: 	The index finger flex sensor value. */\n" )
    lines.append( "/*        mi_flex: 	The middle finger flex sensor value. */\n" ) 
    lines.append( "/*        ri_flex: 	The ring finger flex sensor value. */\n" ) 
    lines.append( "/*        pi_flex: 	The pinky finger flex sensor value. */\n" ) 
    lines.append( "/*        th_con_t:	The thumb tip contact sensor value. */\n" )
    lines.append( "/*        in_con_t:  	The index finger tip contact sensor value. */\n" )
    lines.append( "/*        mi_con_t:	The middle finger tip contact sensor value. */\n" )
    lines.append( "/*        ri_con_t:	The ring finger tip contact sensor value. */\n" )
    lines.append( "/*        pi_con_m:	The pinky finger mid contact sensor value. */\n" )
    lines.append( "/*        in_con_m:  	The index finger mid contact sensor value. */\n" )
    lines.append( "/*        mi_con_m:	The middle finger mid contact sensor value. */\n" )
    lines.append( "/*        ri_con_m:	The ring finger mid contact sensor value. */\n" )
    lines.append( "/*        pi_con_m:	The pinky finger mid contact sensor value. */\n" )
    lines.append( "/*        ti_con_t:	The thumb-index interdigital fold contact sensor value. */\n" )
    lines.append( "/*        im_con_t:	The index-middle interdigital fold contact sensor value. */\n" )
    lines.append( "/*        mr_con_t:	The middle-ring interdigital fold contact sensor value. */\n" )
    lines.append( "/*        rp_con_t:	The ring-pinky interdigital fold contact sensor value. */\n" )
    lines.append( "/*        accel_303_0_x:  Top LSM303 X axis accelerometer value. */\n" )
    lines.append( "/*        accel_303_0_y:  Top LSM303 Y axis accelerometer value. */\n" )
    lines.append( "/*        accel_303_0_z:  Top LSM303 X axis accelerometer value. */\n" )
    lines.append( "/*        mag_303_0_x:    Top LSM303 X axis magnetometer value. */\n" )
    lines.append( "/*        mag_303_0_y:    Top LSM303 Y axis magnetometer value. */\n" )
    lines.append( "/*        mag_303_0_z:    Top LSM303 X axis magnetometer value. */\n" )
    lines.append( "/*        accel_303_1_x:  Bottom LSM303 X axis accelerometer value. */\n" )
    lines.append( "/*        accel_303_1_y:  Bottom LSM303 Y axis accelerometer value. */\n" )
    lines.append( "/*        accel_303_1_z:  Bottom LSM303 X axis accelerometer value. */\n" )
    lines.append( "/*        mag_303_1_x:    Bottom LSM303 X axis magnetometer value. */\n" )
    lines.append( "/*        mag_303_1_y:    Bottom LSM303 Y axis magnetometer value. */\n" )
    lines.append( "/*        mag_303_1_z:    Bottom LSM303 X axis magnetometer value. */\n" )
    lines.append( "/*        accel_9dof_0_x: Top LSM9DOF X axis accelerometer value. */\n" )
    lines.append( "/*        accel_9dof_0_y: Top LSM9DOF Y axis accelerometer value. */\n" )
    lines.append( "/*        accel_9dof_0_z: Top LSM9DOF X axis accelerometer value. */\n" )
    lines.append( "/*        mag_9dof_0_x:   Top LSM9DOF X axis magnetometer value. */\n" )
    lines.append( "/*        mag_9dof_0_y:   Top LSM9DOF Y axis magnetometer value. */\n" )
    lines.append( "/*        mag_9dof_0_z:   Top LSM9DOF X axis magnetometer value. */\n" )
    lines.append( "/*        gyro_9dof_0_x:  Top LSM9DOF X axis gyrometer value. */\n" )
    lines.append( "/*        gyro_9dof_0_y:  Top LSM9DOF Y axis gyrometer value. */\n" )
    lines.append( "/*        gyro_9dof_0_z:  Top LSM9DOF X axis gyrometer value. */\n" )
    lines.append( "/*        accel_9dof_1_x: Top LSM9DOF X axis accelerometer value. */\n" )
    lines.append( "/*        accel_9dof_1_y: Top LSM9DOF Y axis accelerometer value. */\n" )
    lines.append( "/*        accel_9dof_1_z: Top LSM9DOF X axis accelerometer value. */\n" )
    lines.append( "/*        mag_9dof_1_x:   Top LSM9DOF X axis magnetometer value. */\n" )
    lines.append( "/*        mag_9dof_1_y:   Top LSM9DOF Y axis magnetometer value. */\n" )
    lines.append( "/*        mag_9dof_1_z:   Top LSM9DOF X axis magnetometer value. */\n" )
    lines.append( "/*        gyro_9dof_1_x:  Top LSM9DOF X axis gyrometer value. */\n" )
    lines.append( "/*        gyro_9dof_1_y:  Top LSM9DOF Y axis gyrometer value. */\n" )
    lines.append( "/*        gyro_9dof_1_z:  Top LSM9DOF X axis gyrometer value. */\n" )
    lines.append( "/*        gest:		The gesture that corresponds to the given set of sensor values. */\n" )
    lines.append( "/*        open:           100.0 */\n" )
    lines.append( "/*        half-open:       50.0 */\n" )
    lines.append( "/*        closed:           0.0 */\n" )
    lines.append( "/*        contact:            1 */\n" )
    lines.append( "/*        no contact:         0 */\n" )
    lines.append( "/*        upright:            (  0.0,   0.0,   0.0) */\n" )
    lines.append( "/*        angled-foward-45:   ( 25.0,  25.0,  25.0) */\n" )
    lines.append( "/*        angled-forward-90:  ( 50.0,  50.0,  50.0) */\n" )
    lines.append( "/*        angled-forward-135: ( 75.0,  75.0,  75.0) */\n" )
    lines.append( "/*        angled-forward-180: (100.0, 100.0, 100.0) */\n" )
    lines.append( "DROP TABLE IF EXISTS gesture_tbl;\n" ) 
    lines.append( "CREATE TABLE IF NOT EXISTS gesture_tbl (\n" )
    lines.append( "\tid INT NOT NULL AUTO_INCREMENT,\n" ) 
    lines.append( "\thand ENUM(\"left\", \"right\") NOT NULL,\n" ) 
    lines.append( "\tth_flex DOUBLE NOT NULL,\n" )
    lines.append( "\tin_flex DOUBLE NOT NULL,\n" )
    lines.append( "\tmi_flex DOUBLE NOT NULL,\n" )
    lines.append( "\tri_flex DOUBLE NOT NULL,\n" )
    lines.append( "\tpi_flex DOUBLE NOT NULL,\n" )
    lines.append( "\tth_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tin_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tmi_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tri_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tpi_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tin_con_m BOOLEAN NOT NULL,\n" )
    lines.append( "\tmi_con_m BOOLEAN NOT NULL,\n" )
    lines.append( "\tri_con_m BOOLEAN NOT NULL,\n" )
    lines.append( "\tpi_con_m BOOLEAN NOT NULL,\n" )
    lines.append( "\tti_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tim_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\tmr_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\trp_con_t BOOLEAN NOT NULL,\n" )
    lines.append( "\taccel_303_0_x DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_303_0_y DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_303_0_z DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_0_x DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_0_y DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_0_z DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_303_1_x DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_303_1_y DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_303_1_z DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_1_x DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_1_y DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_303_1_z DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_0_x DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_0_y DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_0_z DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_0_x DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_0_y DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_0_z DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_0_x DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_0_y DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_0_z DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_1_x DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_1_y DOUBLE NOT NULL,\n" )
    lines.append( "\taccel_9dof_1_z DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_1_x DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_1_y DOUBLE NOT NULL,\n" )
    lines.append( "\tmag_9dof_1_z DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_1_x DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_1_y DOUBLE NOT NULL,\n" )
    lines.append( "\tgyro_9dof_1_z DOUBLE NOT NULL,\n" )
    lines.append( "\tgest VARCHAR(100),\n" )
    lines.append( "\tin_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n" )
    lines.append( "\tPRIMARY KEY ( id )\n" )
    lines.append( "\t);\n" )
    lines.append( "/* Add entries to the table. Omit J and Z for now as they contain movement. */\n" )

    return lines

def add_body( data, lines ):
    """ Adds the body of content to the output file. """

    for i in range( len(data) ):
        # Write the next set of data.
        lines.append( "INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,\n" )
        lines.append( "\t\tth_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,\n" )
        lines.append( "\t\taccel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,\n" )
        lines.append( "\t\taccel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,\n" )
        lines.append( "\t\taccel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,\n" )
        lines.append( "\t\taccel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z," +
                      "gest)\n" )
        nextLine = "\tVALUES(\"right\", "
        for j in range( len(data[i].flex) ):
            nextLine += data[i].flex[j] + ", "
        for j in range( len(data[i].contact) ):
            nextLine += data[i].contact[j] + ", "
        nextLine += "\n"
        lines.append( nextLine )
        nextLine = "\t\t"
        for j in range( len(data[i].lsm303) ):
            nextLine += data[i].lsm303[j] + ", "
        nextLine += "\n"
        lines.append( nextLine )
        nextLine = "\t\t"
        for j in range( len(data[i].lsm9dof) ):
            nextLine += data[i].lsm9dof[j] + ", "
        nextLine += "\"" + data[i].gesture + "\");\n"
        lines.append( nextLine )
    return lines

def output_data( f_name, data ):
    """ Generates the output file. """

    lines = []  # The lines to write to the output file.

    # Generate the output file.
    lines = add_header( lines )
    lines = add_body( data, lines )
    # Write the output file.
    with open( f_name, 'w' ) as output_file:
        output_file.writelines( lines )

    return

def input_data( alpha_dir, num_dir ):

    suffix = ".xml"                                                     # Suffix of the input file. 
    f_names = []
    data = []

    for content in os.listdir( alpha_dir ):
        next_file = os.path.join(alpha_dir, content)
        if (os.path.isfile(next_file)) and (suffix in content):
            f_names.append( next_file )
    for content in os.listdir( num_dir ):
        next_file = os.path.join(num_dir, content)
        if (os.path.isfile(next_file)) and (suffix in content):
            f_names.append( next_file )
    f_names.sort( key=lambda x: os.path.basename(x).split('.')[0], reverse=False ) 
    for i in range( len(f_names) ):
        sys.stdout.write( "Reading data from: " + os.path.basename(f_names[i]) + "\n" )
        gesture = os.path.basename( f_names[i].split(".xml")[0] )
        flex = []
        contact = []
        lsm303 = []
        lsm9dof = []
        with open( f_names[i], 'r' ) as input_file:
            lines = input_file.readlines()
        j = 0
        # Advance to right hand for right now.
        while not "<hand side=\"right\">" in lines[j]:
            j += 1
        while not "<lsm303 side=\"" in lines[j]:
            if "<flex>" in lines[j]:
                flex.append( lines[j].split('>')[1].split('<')[0] )
            elif "<contact-" in lines[j]:
                contact.append( lines[j].split('>')[1].split('<')[0] )
            j += 1
        while not "<lsm9dof side=\"" in lines[j]:
            if ("<accel-" in lines[j]) or ("<mag-" in lines[j]):
                lsm303.append( lines[j].split('>')[1].split('<')[0] )
            j += 1
        while not "</hand>" in lines[j]:
            if ("<accel-" in lines[j]) or ("<mag-" in lines[j]) or ("<gyro-" in lines[j]):
                lsm9dof.append( lines[j].split('>')[1].split('<')[0] )
            j += 1
        data.append( Data(flex, contact, lsm303, lsm9dof, gesture) )
            
    return data

def match( data_1, data_2 ):

    # Focus solely on checking the flex sensor and contact sensor values for duplicates.
    for i in range( len(data_1.flex) ):
        if data_1.flex[i] != data_2.flex[i]:
            return False
    for i in range( len(data_1.contact) ):
        if data_1.contact[i] != data_2.contact[i]:
            return False
    # All flex sensor and contact sensor values match.
    return True

def check_data( data ):

    result = False
    for i in range( len(data) ):
        for j in range( i+1, len(data) ):
            if match( data[i], data[j] ):
                sys.stderr.write( "*** " + data[i].gesture + ".xml matches " + data[j].gesture + ".xml ***\n" )            
                result = True

    return result

def main( args ):
    """ Main program. """

    alpha_dir = os.path.expanduser( "~/CapstoneProject/gesture_data/alphabet_xml" ) # Directory of the input files.
    num_dir = os.path.expanduser( "~/CapstoneProject/gesture_data/numbers_xml" )    # Directory of the input files.
    output_file = "gesture_db.sql"                                      # The output file.
    ret_val = os.EX_OK                                                  # Return status code

    try:
        # Read the gesture data.
        sys.stdout.write( "Reading gesture data\n" )
        data = input_data( alpha_dir, num_dir )
        # Check for gestures whose data match one another, and thus will produce a conflict
        result = check_data( data )
        response = 'y'
        if result:
            response = raw_input( "Continue to write output file? (y/n)\t" )
            response = response.lower()
            while not( (response == 'y') or (response == 'n') ):
                response = raw_input( "Continue to write output file? (y/n)\t" )
        if response == 'y':
            # Update the output file.
            sys.stdout.write( "Writing:\t" + os.path.basename(output_file) + "\n" )
            output_data( output_file, data )
    except KeyboardInterrupt:
        sys.stdout.write( "Exiting\n" )

    return ret_val

if __name__ == "__main__":
    sys.exit( main(sys.argv) )
