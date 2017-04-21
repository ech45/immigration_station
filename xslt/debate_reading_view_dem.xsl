<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../css/dem_debate_text.css"/>
                <script type="text/javascript" src="debate_reading_view.js">/**/</script>
                <title>
                    <xsl:apply-templates select="//date"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="//meta"/>
                <div class="button">
                    <button>Click to toggle participants' names</button>
                </div>
                <a href="demdebates.xhtml">Return to All Democratic Debates</a>
                <hr/>
                <div class="container">
                    <div class="debate">
                        <xsl:apply-templates select="//body"/>
                    </div>
                    <div class="debateMenu"><h4>Debate Menu</h4>Toggle these buttons to view
                        specific portions of the debate or to elicit key terms or tropes: </div>
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
        <span class="trope{@type}">
            <strong>
                <xsl:apply-templates/>
            </strong>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'border']">
        <span class="keyword_border">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'amnesty']">
        <span class="keyword_amnesty">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'sanctuary city']">
        <span class="keyword_sanctuary_city">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'path to citizenship']">
        <span class="keyword_path_to_citizenship">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="immigrant">
        <span class="immigrant">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="immigration">
        <span class="immigration">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="meta">
        <h2>
            <p>
                <xsl:apply-templates select="loc"/>
            </p>
            <p>
                <xsl:apply-templates select="date"/>
            </p>
        </h2>
        <div class="containerMeta">
            <div class="candidates">
                <h3> Candidates </h3>
                <ul>
                    <xsl:apply-templates select="participants/candidate"/>
                </ul>
            </div>
            <div class="moderators">
                <h3> Moderators </h3>
                <ul>
                    <xsl:apply-templates select="participants/moderator"/>
                </ul>
            </div>
        </div>
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
