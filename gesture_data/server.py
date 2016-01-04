#!/usr/bin/python

from __future__ import with_statement

import os
import sys
import time
import BaseHTTPServer
import lxml.etree as ET
import urlparse

def get_file_names( ):

    # Return the XML and XSL file names.
    baseDir = os.path.expanduser( "~/CapstoneProject/gesture_data/" )
    xmlFName = os.path.join( baseDir, "gesture_data.xml" )
    xslFName = os.path.join( baseDir, "gesture_data.xsl" )
    newxmlFName = os.path.join( baseDir, "gesture_data_init.xml" )

    return xmlFName, xslFName, newxmlFName

def update_xml( ):

    # Get the file names.
    xmlFName, xslFName, newxmlFName = get_file_names()
    # Read in the XML file.
    with open( xmlFName, 'r' ) as inputFile:
        lines = inputFile.readlines()
    # Adjust file to indicate a conversion for be performed.
    for i in range( len(lines) ):
        if "<convert>" in lines[i]:
            lines[i] = "\t<convert>true</convert>\n"
            break
    # Write the updated XML file.
    with open( newxmlFName, 'w' ) as outputFile:
        outputFile.writelines( lines )

    return

def convert_xml( ):

    # Get the file names.
    xmlFName, xslFName, newxmlFName = get_file_names()
    # Convert the XML file to HTML.
    dom = ET.parse( xmlFName )
    xlst = ET.parse( xslFName )
    transform = ET.XSLT( xlst )
    newDom = transform ( dom )
    lines = ET.tostring( newDom, pretty_print=True )

    return lines

class GestureHandler( BaseHTTPServer.BaseHTTPRequestHandler ):

    def do_HEAD( server ):
        server.send_response( 200 )
        server.send_header( "Content-type", "text/html" )
        server.end_headers( )

    def do_GET( server ):
        """Respond to a GET request."""
        server.send_response( 200 )
        server.send_header( "Content-type", "text/html" )
        server.end_headers( )
        lines = convert_xml( )
        for line in lines:
            server.wfile.write( line )

    def do_POST( server ):
        """ Handle a POST. """
        # Get the file names.
        xmlFName, xslFName, newxmlFName = get_file_names()

        # Extract and print the contents of the POST
        length = int( server.headers['Content-Length'] )
        postData = urlparse.parse_qs( server.rfile.read(length).decode('utf-8') )
        convert = False
        for key, value in postData.iteritems():
            if key == "setting":
                if value:
                    if value[0] == "convert":
                        convert = True
                        break
        if convert:
            update_xml( )
        server.send_response( 200 )
        server.send_header( "Content-type", "text/html" )
        server.end_headers( )
        lines = convert_xml( )
        for line in lines:
            server.wfile.write( line )

def main( args ):

    HOST_NAME = 'localhost'
    PORT_NUMBER = 8080
    serverClass = BaseHTTPServer.HTTPServer
    httpd = serverClass( (HOST_NAME, PORT_NUMBER), GestureHandler )

    sys.stdout.write( "[" + time.asctime() + "]" )
    sys.stdout.write( "Server started - %s:%s\n" % (HOST_NAME, PORT_NUMBER) )
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        httpd.server_close()
        sys.stdout.write( "[" +  time.asctime() + "]" )
        sys.stdout.write( "Server stopped - %s:%s\n" % (HOST_NAME, PORT_NUMBER) )

    return os.EX_OK

if __name__ == '__main__':
    sys.exit( main(sys.argv) )
