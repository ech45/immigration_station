<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../css/dem_debate_text.css"/>
                <title>
                    <xsl:apply-templates select="//date"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="//meta"/>
                <a href="demdebates.xhtml">Return to All Democratic Debates</a>
                <hr/>
                <div class="container">
                    <div class="debate">
                        <xsl:apply-templates select="//body"/>
                    </div>
                    <div class="debateMenu"><h4>Debate Options</h4>Lorem ipsum dolor sit amet,
                        consectetur adipiscing elit. Morbi quis nulla augue. Vestibulum eget
                        condimentum odio. Proin pharetra vel est eget hendrerit. Duis nec rhoncus
                        libero. Donec auctor erat sem, vitae elementum odio accumsan vel. Vivamus
                        sapien lorem, ornare ac massa at, maximus maximus nisl. In malesuada nisi
                        arcu, vitae placerat turpis lobortis quis. Aliquam finibus eget purus nec
                        suscipit. Vestibulum maximus nulla quam, gravida tempus magna convallis
                        eget. In sagittis lacinia purus luctus elementum. Praesent vel elementum
                        tellus. Proin a est consectetur, rutrum diam id, dapibus quam.</div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="body">
        <xsl:apply-templates select="section"/>
    </xsl:template>
    <xsl:template match="section">



        <div class="{@key}">
            <xsl:apply-templates select="speech"/>
        </div>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL" as="xs:string"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>

        <xsl:variable name="speechPositionWithinDebate" as="xs:integer"
            select="count(preceding::speech)"/>
        <p id="{concat($readingTextURL, 'speech' , $speechPositionWithinDebate)}">
                [<xsl:apply-templates select="@speaker"/>] <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="trope">
        <div class="trope{@type}">
            <strong>
                <xsl:apply-templates/>
            </strong>
        </div>
    </xsl:template>
    <xsl:template match="keyword">
        <span class="keyword{@term}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="immigrant">
        <immigrant>
            <xsl:apply-templates/>
        </immigrant>
    </xsl:template>
    <xsl:template match="immigration">
        <immigration><xsl:apply-templates/></immigration>
    </xsl:template>
    <xsl:template match="meta">
        <h2>
            <p><xsl:apply-templates select="loc"/></p>
            <p><xsl:apply-templates select="date"/></p>
        </h2>
        <ul>
            <h3> Candidates </h3>

            <xsl:apply-templates select="participants/candidate"/>
        </ul>
        <ul>
            <h3> Moderators </h3>
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
