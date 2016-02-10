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
                <xsl:for-each select="gestures/gesture">
                    <xsl:for-each select="hand">
                        <div>
                            <xsl:if test="@side = 'left'">
                                <p style="text-align: center; font-size: 20px; font-weight: bold;">Left Hand</p>
                            </xsl:if>
                            <xsl:if test="@side = 'right'">
                                <p style="text-align: center; font-size: 20px; font-weight: bold;">Right Hand</p>
                            </xsl:if>
                        </div>
                        <div style="width: 99%;">
                          <div style="float: left; width: 33%;">
                            <p style="text-align: center; font-size: 18px; font-weight: bold;">Fingers</p>
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 90%;">
                                <tr style="background-color: blue; color: white; width: 50px; text-align: left; font-size: 16px;">
                                    <th>Location</th>
                                    <th>Flex Sensor</th>
                                    <th>Tip Contact Sensor</th>
                                    <th>Mid Contact Sensor</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Thumb</td>
                                    <td><xsl:value-of select="thumb/flex" /></td>
                                    <td><xsl:value-of select="thumb/contact-tip" /></td>
                                    <td></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Index</td>
                                    <td><xsl:value-of select="index/flex" /></td>
                                    <td><xsl:value-of select="index/contact-tip" /></td>
                                    <td><xsl:value-of select="index/contact-mid" /></td>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Middle</td>
                                    <td><xsl:value-of select="middle/flex" /></td>
                                    <td><xsl:value-of select="middle/contact-tip" /></td>
                                    <td><xsl:value-of select="middle/contact-mid" /></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Ring</td>
                                    <td><xsl:value-of select="ring/flex" /></td>
                                    <td><xsl:value-of select="ring/contact-tip" /></td>
                                    <td><xsl:value-of select="ring/contact-mid" /></td>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Pinky</td>
                                    <td><xsl:value-of select="pinky/flex" /></td>
                                    <td><xsl:value-of select="pinky/contact-tip" /></td>
                                    <td><xsl:value-of select="pinky/contact-mid" /></td>
                                </tr>
                            </table>
                          </div>
                          <div style="float: left; width: 33%;">
                            <p style="text-align: center; font-size: 18px; font-weight: bold;">Folds</p>
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 90%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Location</th>
                                    <th>Contact Sensor</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Thumb-Index</td>
                                    <td><xsl:value-of select="thumb-index/contact-tip" /></td>
                                    <td></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Index-Middle</td>
                                    <td><xsl:value-of select="index-middle/contact-tip" /></td>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Middle-Ring</td>
                                    <td><xsl:value-of select="middle-ring/contact-tip" /></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Ring-Pinky</td>
                                    <td><xsl:value-of select="ring-pinky/contact-tip" /></td>
                                </tr>
                            </table>
                          </div>
                          <xsl:for-each select="lsm303">
                           <div style="float: left; width: 33%;">
                            <xsl:if test="@side = 'top'">
                                <p style="text-align: center; font-size: 18px; font-weight: bold;">Top LSM303</p>
                            </xsl:if>
                            <xsl:if test="@side = 'bottom'">
                                <p style="text-align: center; font-size: 18px; font-weight: bold;">Bottom LSM303</p>
                            </xsl:if>
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 90%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Axis</th>
                                    <th>Accelerometer</th>
                                    <th>Magnetometer</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>X</td>
                                    <td><xsl:value-of select="accel-x" /></td>
                                    <td><xsl:value-of select="mag-x" /></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Y</td> 
                                    <td><xsl:value-of select="accel-y" /></td>
                                    <td><xsl:value-of select="mag-y" /></td>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Z</td>
                                    <td><xsl:value-of select="accel-z" /></td>
                                    <td><xsl:value-of select="mag-z" /></td>
                                </tr>
                            </table>
                           </div>
                          </xsl:for-each>
                          <xsl:for-each select="lsm9dof">
                           <div style="float: left; width: 33%;">
                            <xsl:if test="@side = 'top'">
                                <p style="text-align: center; font-size: 18px; font-weight: bold;">Top LSM9DOF</p>
                            </xsl:if>
                            <xsl:if test="@side = 'bottom'">
                                <p style="text-align: center; font-size: 18px; font-weight: bold;">Bottom LSM9DOF</p>
                            </xsl:if>
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 90%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Axis</th>
                                    <th>Accelerometer</th>
                                    <th>Magnetometer</th>
                                    <th>Gyrometer</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>X</td>
                                    <td><xsl:value-of select="accel-x" /></td>
                                    <td><xsl:value-of select="mag-x" /></td>
                                    <td><xsl:value-of select="gyro-x" /></td>
                                </tr>
                                <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Y</td> 
                                    <td><xsl:value-of select="accel-y" /></td>
                                    <td><xsl:value-of select="mag-y" /></td>
                                    <td><xsl:value-of select="gyro-y" /></td>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Z</td>
                                    <td><xsl:value-of select="accel-z" /></td>
                                    <td><xsl:value-of select="mag-z" /></td>
                                    <td><xsl:value-of select="gyro-z" /></td>
                                </tr>
                            </table>
                           </div>
                          </xsl:for-each>
                          <br style="clear: left;" />
                        </div>
                    </xsl:for-each>
                </xsl:for-each>
                <div>
                    <p style="text-align: center; font-size: 14px; font-weight: bold;">
                        Converted Text:  <xsl:value-of select="gestures/converted-text" /><br />
                        <form style="text-align: center;" action="" method="post">
                            Convert to Speech?
                            <input type="checkbox" name="setting" value="convert"></input>
                            <br />
                            <input type="submit" value="Submit"></input>
                            <input type="reset" value="Reset"></input>
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
