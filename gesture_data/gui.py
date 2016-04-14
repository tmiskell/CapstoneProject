#!/usr/bin/python

""" gui.py

  By:       Timothy Miskell
            16.499 Capstone Project
            ECE Department                               
            Umass Lowell                                                        

  PURPOSE:  This program is designed to provide a GUI
            for the user of the sign to speech program. 

  CHANGES:  4/11/2016
                                                                                 
"""

from __future__ import with_statement

import Tkinter as tk
import datetime
import string
import time
import sys
import os
import tkFont
import functools

class Window( tk.Frame ):

    def __init__( self, master=None, text='' ):
        tk.Frame.__init__( self, master )                 
        self.master = master
        self.converted_text = tk.StringVar()
        self.version = tk.StringVar()
        self.sensor_status = tk.StringVar()
        self.prog_status = tk.StringVar()
        self.converted_text_label = None
        self.version_label = None
        self.sensor_status_label = None
        self.convert_font = tkFont.Font( family="Helvetica", size=35 )
        self.version_font = tkFont.Font( family="Helvetica", size=11 )
        self.sensor_status_font = tkFont.Font( family="Helvetica", size=11 )
        self.prog_status_font = tkFont.Font( family="Helvetica", size=11 )
        self.button_font = tkFont.Font( family="Helvetica", weight="bold", size=14 )
        self.stopped = True
        self.prev_time = None
        self.next_time = None
        self.cmdfName = 'cmd.txt'
        self.xmlfName = 'gesture_data.xml'
        self.init_window( )
        self.cmd = ""

    #Creation of init_window
    def init_window( self ):
        # Changing the title of our master widget      
        self.master.title( "Sign to Speech" )
        # Allowing the widget to take the full space of the root window
        self.pack( fill=tk.BOTH, expand=1 )
        # Create label instances
        self.converted_text.set( 'Press Start' )
        self.version.set( 'XML Version: -' )
        self.sensor_status.set( 'Sensor Status: -' )
        self.prog_status.set( 'Program Status: -' )
        self.converted_text_label = tk.Label( self.master, textvariable=self.converted_text, font=self.convert_font )
        self.version_label = tk.Label( self.master, textvariable=self.version, font=self.version_font )
        self.sensor_status_label = tk.Label( self.master, textvariable=self.sensor_status, font=self.sensor_status_font )
        self.prog_status_label = tk.Label( self.master, textvariable=self.prog_status, font=self.prog_status_font )
        # Placing labels on the window
        self.converted_text_label.place( x=25, y=100 )
        self.prog_status_label.place( x=75, y=225 )
        self.sensor_status_label.place( x=75, y=250 )
        self.version_label.place( x=75, y=275 )
        # Creating a button instances
        start_button = tk.Button( self, text="Start", width=5, font=self.button_font, command=functools.partial(self.write_cmd, "start") )
        convert_button = tk.Button( self, text="Output", width=5, font=self.button_font, command=functools.partial(self.write_cmd, "convert") )
        reset_button = tk.Button( self, text="Reset", width=5, font=self.button_font, command=functools.partial(self.write_cmd, "reset") )
        stop_button = tk.Button( self, text="Stop", width=5, font=self.button_font, command=functools.partial(self.write_cmd, "stop") )
        exit_button = tk.Button( self, text="Exit", width=5, font=self.button_font, command=functools.partial(self.exit_cmd) )
        # Placing the buttons on the window
        start_button.place( x=25, y=0 )
        convert_button.place( x=113, y=0 )
        reset_button.place( x=200, y=0 )
        stop_button.place( x=288, y=0 )
        exit_button.place( x=375, y=0 )

    # Write the command.
    def write_cmd( self, cmd_text ):
        prev_status = self.prog_status.get() # Previous program status.
        self.cmd = cmd_text
        if self.cmd == "stop":
            self.stopped = True
            self.prog_status.set( "Program Status: Conversion Stopped" )
        elif self.cmd == "start":
            if self.stopped:
                self.prog_status.set( "Program Status: Conversion in Progress" )
                self.stopped = False
                with open( self.cmdfName, 'w' ) as outputFile:
                    outputFile.writelines( self.cmd )            
        if self.cmd != "start":
            # Write the command.
            with open( self.cmdfName, 'w' ) as outputFile:
                outputFile.writelines( self.cmd )
        else:
            self.read_xml()
        return

    # Read gesture data.
    def read_xml( self ):
        delay = 125 # Delay in ms.

        # Check if file has been updated.
        self.next_time = datetime.datetime.strptime(time.ctime(os.path.getmtime(self.xmlfName)), "%a %b %d %H:%M:%S %Y")
        changed = False
        if not self.prev_time:
             changed = True
        else:
             if self.next_time > self.prev_time:
                 changed = True
        self.prev_time = self.next_time
        if changed:
            # Read the updated converted text to shown on screen.
            with open( self.xmlfName, 'r' ) as inputFile:
               lines = inputFile.readlines()
            i = 0
            xml_text = ""
            while i < len(lines):
                # Update the converted text on screen. Replace spaces with underscores for clarity.
                if "<converted-text>" in lines[i]:
                    self.converted_text.set( lines[i].split(">")[1].split("</")[0].replace(" ", "_") )
                # Update sensor status.
                if "<status>" in lines[i]:
                    self.sensor_status.set( "Sensor Status: " + lines[i].split(">")[1].split("</")[0] )
                    if self.sensor_status.get().split(':')[1].strip() == "connected":
                        self.sensor_status_label.config( fg="green" )
                    else:
                        self.sensor_status_label.config( fg="red" )
                # Get version  number of XML file.
                if "<version>" in lines[i]: 
                    self.version.set( "XML Version: " + lines[i].split(">")[1].split("</")[0] )
                i += 1
        self.master.after( delay, self.read_xml )
        return

    # Exit command.
    def exit_cmd( self ):
        self.prog_status.set( "Program Status: Exiting" )
        sys.exit( os.EX_OK )

def main( ):
    """

       PURPOSE: The main function.

       RETURN VALUE:  status -- EX_OK if all operations completed successfully. EX_IOERR if all operations did not 
                                complete successfully.

    """
    status = os.EX_OK                                                          # Status code to return to the OS

    sys.stdout.write( 'Initializing\n' )
    root = init( )
    window = Window( root )
    try:
        root.mainloop()
    except KeyboardInterrupt:
        sys.stdout.write( 'Exiting\n' )

    return status

def init( ):
    """ 

        PURPOSE:  This function performs any necessary initialization

        RETURN VALUE: 

    """

    #title = "Sign to Speech"
    fg_color = "dark green"
    root = None
    #width = 480
    #height = 320

    if not root:
        # Initialize the window and its offset position on the screen. Allow time for window to draw.
        root = tk.Tk()
    # Size of the window
    sWidth  = root.winfo_screenwidth()
    sHeight = root.winfo_screenheight()
    # Make sure to remove title bar and menus.
    root.overrideredirect( 1 )
    #xOffset = (sWidth / 2) - (sWidth / 8)
    #yOffset = 0
    root.geometry( '%dx%d+0+0' % (sWidth, sHeight) )
    #root.geometry( str(width) + "x" + str(height) )

    return root

if __name__ == '__main__':

    sys.exit( main() )
