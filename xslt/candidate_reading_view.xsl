<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:variable name="demDebates" as="document-node()*"
        select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*"
        select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Stuff about immigration</title>
            </head>
            <body>
                <!-- find sentences with <immigration> descendants that contain the string 'immigrant' and group by speaker-->
                <xsl:for-each-group select="$allDebates//speech[child::*]" group-by="@speaker">
                    <!-- sort by speaker -->
                    <xsl:sort select="current-grouping-key()"/>
                    <!-- keep only speeches by candidates, not those by moderators -->
                    <h2>
                        <xsl:value-of select="@speaker"/>
                    </h2>
                    <!-- create a list of speeches of interest by the candidate you're looking at -->
                    <xsl:apply-templates select="current-group()"/>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>
        <p href="{$readingTextURL}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="trope">
        <span class="trope">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="immigration">
        <span class="immigration">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="immigrant">
        <span class="immigrant">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword">
        <span class="keyword">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="anecdote">
        <span class="anecdote">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="platform">
        <span class="platform">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!--
        speech -> p
    -->
    <!-- trope, immigrant, immigration, keyword, anecdote, platform -->
</xsl:stylesheet>
