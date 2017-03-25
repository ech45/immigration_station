

<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
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
        <br/><span class="{@key}"><xsl:apply-templates select="speech"/></span> <br/>
    </xsl:template>
    <xsl:template match="speech">
       <br/> <text>[<xsl:apply-templates select="@speaker"/>] </text>  <xsl:apply-templates/> <br/>
    </xsl:template>
    <xsl:template match="meta">
       <h2> <text>Candidates</text></h2> <br/><ul><xsl:apply-templates select="participants/candidate"/></ul>
        <ul>
            <h2><text>Moderator</text></h2><xsl:apply-templates select="participants/moderator"/></ul>
    </xsl:template>
    <xsl:template match="candidate">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="moderator">
        <li><xsl:apply-templates/></li>
    </xsl:template>
</xsl:stylesheet>
