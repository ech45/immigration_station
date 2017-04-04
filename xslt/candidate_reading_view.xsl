<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:variable name="demDebates" as="document-node()*" select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*" select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Stuff about immigration</title>
              
            </head>
            <body>
                <!-- find sentences with <immigration> descendants that contain the string 'immigrant' and group by speaker-->
                <xsl:for-each-group
                    select="$allDebates//speech[child::*]"
                    group-by="@speaker">
                    <!-- sort by speaker -->
                    <xsl:sort select="current-grouping-key()"/>
                    <!-- keep only speeches by candidates, not those by moderators -->
                    
                        <h2>
                            <xsl:value-of select="@speaker"/>
                        </h2>
                        <!-- create a list of speeches of interest by the candidate you're looking at -->
                        
                            <xsl:for-each select="current-group()">
                               <p>
                                    -<xsl:value-of select="current()"/>
                               </p>
                            </xsl:for-each>
                        
                        
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
