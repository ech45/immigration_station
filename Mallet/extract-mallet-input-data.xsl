<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:variable name="demDebates" as="document-node()*"
        select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*"
        select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates"/>
    <xsl:template match="/">
        <xsl:apply-templates select="$allDebates//speech"/>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="XMLSource" as="xs:string"
            select="substring-before(tokenize(base-uri(.), '/')[last()], '.xml')"/>
        <xsl:variable name="filename" as="xs:string"
            select="concat('mallet-input/', $XMLSource, '_', translate(@speaker, '''', ''), '_', position(), '.txt')"/>
        <xsl:if test="not(@speaker)">
            <xsl:message select="$XMLSource"/>
        </xsl:if>
        <xsl:result-document href="{$filename}" method="text">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
