<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="words">
        <xsl:copy>
            <xsl:variable name="words" as="xs:string+" select="tokenize(normalize-space(.),'\s+')"/>
            <xsl:for-each select="$words">
                <word>
                    <xsl:sequence select="."/>
                </word>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
