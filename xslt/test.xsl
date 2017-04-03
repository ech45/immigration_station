<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:variable name="demDebates" as="document-node()*" select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*" select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Test</title>
            </head>
            <body>
              <xsl:for-each-group select="$allDebates//immigrant" group-by="@term">
                  <xsl:sort select="count(current-group())" order="descending"/>
                  <p>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> contains </xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text> items</xsl:text>
                  </p>
              </xsl:for-each-group>  
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<!-- determine which documents were given incorrect term values -->
