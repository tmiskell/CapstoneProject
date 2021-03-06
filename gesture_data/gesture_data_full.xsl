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
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 95%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Location</th>
                                    <th>Flex</th>
                                    <th>Tip Contact</th>
                                    <th>Mid Contact</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Thumb</td>
                                    <td><xsl:value-of select="thumb/flex" /></td>
                                    <td><xsl:value-of select="thumb/contact-tip" /></td>
                                    <td>-</td>
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
                            <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 95%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Location</th>
                                    <th>Contact</th>
                                </tr>
                                <tr style="background-color: white; text-align: left; font-size: 14px;">
                                    <td>Thumb-Index</td>
                                    <td><xsl:value-of select="thumb-index/contact-tip" /></td>
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
                          <div style="float: left; width: 33%;">
                           <p style="text-align: center; font-size: 18px; font-weight: bold;">Lsm303</p>
                            <div>
                             <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 95%;">
                                <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Location </th>
                                    <th>Accel. (x, y, z)</th>
                                    <th>Mag. (x, y, z)</th>
                                </tr>
                                <xsl:for-each select="lsm303">
                                 <xsl:if test="@side = 'top'">
                                  <tr style="background-color: white; text-align: left; font-size: 14px;">
                                   <td>Top</td>
                                   <td>(<xsl:value-of select="accel-x" />, <xsl:value-of select="accel-y" />, <xsl:value-of select="accel-z" />)</td>
                                   <td>(<xsl:value-of select="mag-x" />, <xsl:value-of select="mag-y" />, <xsl:value-of select="mag-z" />)</td>
                                  </tr>
                                 </xsl:if>
                                <xsl:if test="@side = 'bottom'">
                                 <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                  <td>Bottom</td>
                                  <td>(<xsl:value-of select="accel-x" />, <xsl:value-of select="accel-y" />, <xsl:value-of select="accel-z" />)</td>
                                  <td>(<xsl:value-of select="mag-x" />, <xsl:value-of select="mag-y" />, <xsl:value-of select="mag-z" />)</td>
                                 </tr>
                                </xsl:if>
                               </xsl:for-each>
                             </table>
                            </div>
                           <p style="text-align: center; font-size: 18px; font-weight: bold;">Lsm9DOF</p>
                            <div>
                             <table style="border-collapse: collapse; border: 1px solid black; margin-left: auto; margin-right: auto; width: 95%;">
                               <tr style="background-color: blue; color: white; text-align: left; font-size: 16px;">
                                    <th>Loc.</th>
                                    <th>Accel. (x, y, z)</th>
                                    <th>Mag. (x, y, z)</th>
                                    <th>Gyro. (x, y, z)</th>
                                </tr>
                                <xsl:for-each select="lsm9dof">
                                 <xsl:if test="@side = 'top'">
                                  <tr style="background-color: white; text-align: left; font-size: 14px;">
                                   <td>Top</td>
                                   <td>(<xsl:value-of select="accel-x" />, <xsl:value-of select="accel-y" />, <xsl:value-of select="accel-z" />)</td>                
                                   <td>(<xsl:value-of select="mag-x" />, <xsl:value-of select="mag-y" />, <xsl:value-of select="mag-z" />)</td>                
                                   <td>(<xsl:value-of select="gyro-x" />, <xsl:value-of select="gyro-y" />, <xsl:value-of select="gyro-z" />)</td>                   
                                  </tr>
                                 </xsl:if>
                                  <xsl:if test="@side = 'bottom'">
                                   <tr style="background-color: gray; text-align: left; font-size: 14px;">
                                    <td>Bottom</td>
                                    <td>(<xsl:value-of select="accel-x" />, <xsl:value-of select="accel-y" />, <xsl:value-of select="accel-z" />)</td>                
                                    <td>(<xsl:value-of select="mag-x" />, <xsl:value-of select="mag-y" />, <xsl:value-of select="mag-z" />)</td>                
                                    <td>(<xsl:value-of select="gyro-x" />, <xsl:value-of select="gyro-y" />, <xsl:value-of select="gyro-z" />)</td>                   
				   </tr>
                                  </xsl:if>
                                </xsl:for-each>
                              </table>
			     </div>
                           </div>
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
