<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <xsl:variable name="demDebates" as="document-node()*"
        select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*"
        select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="genDebates" as="document-node()*" select="collection('../xml/General_Debates/?select=*.xml')"/>
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates|$genDebates"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Candidates' utterances</title>
            </head>
            <body>
                <xsl:variable name="apos">'</xsl:variable>
                <xsl:variable name="OMALLEY" select="string-join(('O', 'MALLEY'), $apos)"/>
                <!-- find sentences with <immigration> descendants that contain the string 'immigrant' and group by speaker-->
                <xsl:for-each-group select="$allDebates//speech[child::*]" group-by="@speaker">
                    <!-- sort by speaker -->
                    <xsl:sort select="current-grouping-key()"/>
                    <!-- keep only speeches by candidates, not those by moderators -->
                 <xsl:if test="@speaker = ('SANDERS', 'CLINTON', $OMALLEY, 'WEBB', 'KAINE')"> 
                    <div class="candidate" id="{@speaker}"><h2>
                        <xsl:value-of select="@speaker"/>
                    </h2>
                    <!-- create a list of speeches of interest by the candidate you're looking at -->
                    <xsl:apply-templates select="current-group()"/></div>
                  </xsl:if> 
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL" as="xs:string"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>
        <xsl:variable name="speechPositionWithinDebate" as="xs:integer"
            select="count(preceding::speech)"/>
        <p id="{concat($readingTextURL, @speaker, count(preceding::speech))}">
            <a href="{concat($readingTextURL,'#speech',$speechPositionWithinDebate)}">[source] </a>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="trope">
        <span class="trope {@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="platform">
        <span class="platform {@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="anecdote">
        <span class="anecdote {@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'border']">
        <span class="keyword border">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'amnesty']">
        <span class="keyword amnesty">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'sanctuary city']">
        <span class="keyword sanctuary_city">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'path to citizenship']">
        <span class="keyword path_to_citizenship">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'wall']">
        <span class="keyword wall">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'asylum']">
        <span class="keyword asylum">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="keyword[@term = 'visa overstay']">
        <span class="keyword visa_overstay">
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
    <!--
        speech -> p
    -->
    <!-- trope, immigrant, immigration, keyword, anecdote, platform -->
</xsl:stylesheet>
