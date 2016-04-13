<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Gesture Data</title>
                <meta http-equiv="refresh" content="5" />
            </head>  
            <body>
                <div>
                    <p style="text-align: center; font-size: 14px; font-weight: bold;">
                        Converted Text:  <xsl:value-of select="gestures/converted-text" /><br />
                        <form style="text-align: center;" action="" method="post">
                            Start Conversion
                            <input type="checkbox" name="setting" value="start"></input>
                            <br />
                            Convert to Speech
                            <input type="checkbox" name="setting" value="convert"></input>
                            <br />
                            Reset
                            <input type="checkbox" name="setting" value="reset"></input>
                            <br />
                            Stop Conversion
                            <input type="checkbox" name="setting" value="stop"></input>
                            <br />
                            <input type="submit" value="Submit"></input>
                        </form>
                    </p>
                    <xsl:if test="gestures/convert = 'true'">
                    <p style="text-align: center; font-size: 12px;">
                        Conversion Status: In Progress<br />
                    </p>
                    </xsl:if>
                    <xsl:if test="gestures/convert = 'false'">
                    <p style="text-align: center; font-size: 12px;">
                        Conversion Status: Collecting Gesture Data<br />
                    </p>
                    </xsl:if>
                    <xsl:if test="gestures/status = 'disconnected'">
                    <p style="text-align: center; font-size: 12px; color: red">
                        Sensor Status: Disconnected<br />
                    </p>
                    </xsl:if>
                    <xsl:if test="gestures/status = 'connected'">
                    <p style="text-align: center; font-size: 12px; color: green">
                        Sensor Status: Connected<br />
                    </p>
                    </xsl:if>
                    <p style="text-align: center; font-size: 12px;">                 
                        Version: <xsl:value-of select="gestures/version" /><br />
                    </p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
