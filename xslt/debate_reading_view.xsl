<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Debate Reading View</title>
            </head>
            <body>
                <xsl:apply-templates select="//meta"/>
                <hr/>
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="body">
        <xsl:apply-templates select="section"/>
    </xsl:template>
    <xsl:template match="section">
       
        
        <br/>
        <span id="key">
            <xsl:apply-templates select="speech"/>
        </span>
        <br/>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL" as="xs:string"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>
        
        <xsl:variable name="speechPositionWithinDebate" as="xs:integer"
            select="count(preceding::speech)"/>
        <br/>
        <span id="{concat($readingTextURL, 'speech' , $speechPositionWithinDebate)}"> [<xsl:apply-templates select="@speaker"/>] 
      <xsl:apply-templates/>
        </span>
        <br/>
            </xsl:template>
    <xsl:template match="trope">
       <span class="trope{@type}"> <strong><xsl:apply-templates/></strong></span>
    </xsl:template>
    <xsl:template match="immigrant|immigration">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="meta">
        <h2>
            <xsl:apply-templates select="loc"/>
            <br/>
            <xsl:apply-templates select="date"/>
        </h2>
        <h2>
           Candidates
        </h2>
        <br/>
        <ul>
            <xsl:apply-templates select="participants/candidate"/>
        </ul>
        <ul>
            <h2>
               Moderator
            </h2>
            <xsl:apply-templates select="participants/moderator"/>
        </ul>
    </xsl:template>
    <xsl:template match="candidate">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="moderator">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
</xsl:stylesheet>
