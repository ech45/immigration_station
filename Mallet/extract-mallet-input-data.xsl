<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates select="//speech"/>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="filename" as="xs:string"
            select="concat('mallet-input/',translate(@who, '''', ''), position(),'.txt')"/>
        <xsl:result-document href="{$filename}">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
