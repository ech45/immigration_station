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
                <br/>
                <p id="linkExp"><strong>In immigration sections, click the candidates' names to view the aggregated list
                    of all immigration-related utterances of theirs in the Republican candidates
                    webpage.</strong></p>
                <a href="repdebates.xhtml">Go to All Republican Debates</a>
                <br/>
                <hr/>
                <div class="container">
                    <div class="debate">
                        <xsl:apply-templates select="//body"/>
                    </div>
                    <div class="debateMenu">
                        <h4>Debate Options</h4><hr/><p>Select which portions of the debate to
                            view:</p><input type="radio" id="allText" name="textView" value="other"
                                checked="checked"/><label for="allText">View all text</label><br/>
                        <input type="radio" id="immText" name="textView" value="imm"/><label
                            for="immText">View only immigration sections</label>
                        <hr/>
                        <p>Select keywords to highlight:</p>
                        <input type="checkbox" id="immigrantCheck" name="keyword" value="immigrant"
                        /><label for="Immigration">Immigration</label><br/>
                        <input type="checkbox" id="immigrationCheck" name="keyword"
                            value="immigrant"/><label for="immigrantCheck">Immigrant</label><br/>
                        <input type="checkbox" id="amnestyCheck" name="keyword" value="amnesty"
                        /><label for="amnestyCheck">Amnesty</label><br/>
                        <input type="checkbox" id="asylumCheck" name="keyword" value="asylum"
                        /><label for="asylumCheck">Asylum</label><br/>
                        <input type="checkbox" id="borderCheck" name="keyword" value="border"
                        /><label for="borderCheck">Border</label><br/>
                        <input type="checkbox" id="everifyCheck" name="keyword" value="e-verify"
                        /><label for="everifyCheck">E-verify</label><br/>
                        <input type="checkbox" id="pathCheck" name="keyword"
                            value="path_to_citizenship"/><label for="pathCheck">Path to
                                citizenship</label><br/>
                        <input type="checkbox" id="sanctuaryCheck" name="keyword"
                            value="sanctuary_city"/><label for="sanctuaryCheck">Sanctuary
                                city</label><br/>
                        <input type="checkbox" id="visaCheck" name="keyword" value="visa_overstay"
                        /><label for="visaCheck">Visa overstay</label><br/>
                        <input type="checkbox" id="wallCheck" name="keyword" value="wall"/><label
                            for="wallCheck">Wall</label><br/>
                        <p/>
                        <hr/> Select tropes to Highlight: <br/>
                        <input type="checkbox" id="jobCheck" name="trope" value="econ"/><label
                            for="jobCheck">Jobs/Economy</label>
                        <br/>
                        <input type="checkbox" id="natCheck" name="trope" value="secure"/><label
                            for="natCheck">National Security/Crime</label>
                        <br/>
                        <input type="checkbox" id="valueCheck" name="trope" value="values"/><label
                            for="valueCheck">American Values</label></div>
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
        <xsl:choose>
            <xsl:when
                test="@speaker = ('BUSH', 'CARSON', 'CHRISTIE', 'CRUZ', 'FIORINA', 'HUCKABEE', 'KASICH', 'RUBIO', 'TRUMP', 'PENCE', 'WALKER', 'PAUL') and .[child::*]">
                <p id="{concat('speech' , $speechPositionWithinDebate)}">
                    <a
                        href="{concat('republicans.xhtml#',$readingTextURL, @speaker, $speechPositionWithinDebate)}"
                        >[<xsl:apply-templates select="@speaker"/>]</a>
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p>[<xsl:apply-templates select="@speaker"/>]<xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
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
    <xsl:template match="meta">
        <h2>
            <xsl:apply-templates select="loc"/>
            <br/>
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
