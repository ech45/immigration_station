<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:sequence
            select="concat(string-join(('id', 'filename', 'speaker', for $i in 0 to 39 return string($i)), '&#x09;'), '&#x0a;')"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="record">
        <xsl:variable name="fields" as="xs:string+">
            <xsl:value-of select="substring(@xml:id, 2)"/>
            <xsl:value-of select="filename"/>
            <xsl:value-of
                select="tokenize(substring-before(filename, '.txt'), '_')[position() = last() - 1]"/>
            <xsl:for-each select="topic">
                <xsl:sort select="number(@n)"/>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:sequence select="concat(string-join($fields, '&#x09;'), '&#x0a;')"/>
    </xsl:template>
</xsl:stylesheet>
