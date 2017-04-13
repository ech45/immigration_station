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
                <div class="debateMenu"><h4>Debate Options</h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis
                    nulla augue. Vestibulum eget condimentum odio. Proin pharetra vel est eget hendrerit. Duis nec
                    rhoncus libero. Donec auctor erat sem, vitae elementum odio accumsan vel. Vivamus sapien lorem,
                    ornare ac massa at, maximus maximus nisl. In malesuada nisi arcu, vitae placerat turpis lobortis
                    quis. Aliquam finibus eget purus nec suscipit. Vestibulum maximus nulla quam, gravida tempus
                    magna convallis eget. In sagittis lacinia purus luctus elementum. Praesent vel elementum tellus.
                    Proin a est consectetur, rutrum diam id, dapibus quam.</div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="body">
        <xsl:apply-templates select="section"/>
    </xsl:template>
    <xsl:template match="section">
       
        
        
        <div class="{@key}">
            <p><xsl:apply-templates select="speech"/></p>
        </div>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL" as="xs:string"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>
        
        <xsl:variable name="speechPositionWithinDebate" as="xs:integer"
            select="count(preceding::speech)"/>
        <p id="{concat($readingTextURL, 'speech' , $speechPositionWithinDebate)}"> [<xsl:apply-templates select="@speaker"/>] 
      <xsl:apply-templates/>
        </p>
            </xsl:template>
    <xsl:template match="trope">
       <div class="trope{@type}"> <strong><xsl:apply-templates/></strong></div>
    </xsl:template>
    <xsl:template match="keyword">
        <span class="keyword{@term}"><xsl:apply-templates/></span>
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
        <h3>
           Candidates
        </h3>
        <br/>
        <ul>
            <xsl:apply-templates select="participants/candidate"/>
        </ul>
        <ul>
            <h3>
               Moderator
            </h3>
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
