<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <!-- stopword list from http://www.ranks.nl/stopwords -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Stuff about immigration</title>
              
            </head>
            <body>
                <!-- find sentences with <immigration> descendants that contain the string 'immigrant' and group by speaker-->
                <xsl:for-each-group
                    select="//speech[ancestor::section[@key='imm']]"
                    group-by="@speaker">
                    <!-- sort by speaker -->
                    <xsl:sort select="current-grouping-key()"/>
                    <!-- keep only speeches by candidates, not those by moderators -->
                    
                        <h2>
                            <xsl:value-of select="@speaker"/>
                        </h2>
                        <!-- create a list of speeches of interest by the candidate you're looking at -->
                        <ul>
                            <xsl:for-each select="current-group()">
                                <li>
                                    <xsl:value-of select="current()"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                        
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
