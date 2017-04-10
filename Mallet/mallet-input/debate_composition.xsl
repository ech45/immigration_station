<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="documents">
        <documents>
            <xsl:apply-templates/>
        </documents>
    </xsl:template>
    <xsl:template match="record">
        <record>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="concat('d', field[1])"/>
            </xsl:attribute>
            <filename>
                <xsl:value-of select="substring-after(field[2], 'mallet-input/')"/>
            </filename>
            <xsl:for-each select="field[position() mod 2 = 1][position() ne 1]">
                <topic>
                    <xsl:attribute name="n">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:value-of select="following-sibling::field[1]"/>
                </topic>
            </xsl:for-each>
        </record>
    </xsl:template>
</xsl:stylesheet>
