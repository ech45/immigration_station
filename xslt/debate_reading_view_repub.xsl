<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../css/repub_debate_text.css"/>
                <script type="text/javascript" src="../javascript/debate_reading_view.js">/**/</script>
                <title>
                    <xsl:apply-templates select="//date"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="//meta"/>
                <div class="button">
                    <button>Click to toggle participants' names</button>
                </div>
                <a href="demdebates.xhtml">Return to All Republican Debates</a>
                <hr/>
                <div class="container">
                    <div class="debate">
                        <xsl:apply-templates select="//body"/>
                    </div>
                    <div class="debateMenu">
                        <h4>Debate Options</h4><hr /><p>Select which portions of the debate to view:</p><input
                            type="radio" name="textView" value="other" checked="checked"/>View all text<br />
                        <input type="radio" name="textView" value="imm" />View only
                        immigration sections
                        <hr />
                        <p>Choose keywords  to highlight:</p>
                        <input type="checkbox" name="keyword" value="all" />Select all<br />
                        <input type="checkbox" name="keyword" value="amnesty"/>Amnesty<br/>
                        <input type="checkbox" name="keyword" value="asylum"/>Asylum<br/>
                        <input type="checkbox" name="keyword" value="border"/>Border<br/>
                        <input type="checkbox" name="keyword" value="e-verify"/>E-verify<br/>
                        <input type="checkbox" name="keyword" value="pathToCitizenship"/>Path to citizenship<br/>
                        <input type="checkbox" name="keyword" value="sanctuaryCity"/>Sanctuary city<br/>
                        <input type="checkbox" name="keyword" value="visaOverstay"/>Visa overstay<br/>
                        <p/>
                        <hr/>
                        Choose tropes to Highlight: <br/> 
                        <input type="checkbox" name="keyword" value="tropeecon" />Select all <br />
                        <input type="checkbox" name="keyword" value="tropeecon"/>Jobs/Economy <br/>
                        <input type="checkbox" name="keyword" value="tropesecure"/>National Security/Crime <br/>
                        <input type="checkbox" name="keyword" value="tropevalues"/>American Values</div>
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
            <hr style="margin-bottom: 50px; margin-top: 50px;"/>
        </div>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="readingTextURL" as="xs:string"
            select="replace(tokenize(base-uri(.), '/')[last()], 'xml', 'xhtml')"/>
        
        <xsl:variable name="speechPositionWithinDebate" as="xs:integer"
            select="count(preceding::speech)"/>
        <p id="{concat('speech' , $speechPositionWithinDebate)}">
            [<xsl:apply-templates select="@speaker"/>] <xsl:apply-templates/>
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
            <xsl:apply-templates select="loc"/><br/>
            <xsl:apply-templates select="date"/>
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
