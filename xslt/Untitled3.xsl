<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <link rel="stylesheet" type="text/css" href="../css/republicans.css"/>
            <title>Republicans</title>
        </head>
        <body>
            <div class="margin">Quote Thingy</div>
            <div class="menu">
                
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Home</button>
                    <div id="home" class="dropdown-content">
                        
                        <a href="../../index.xhtml"><strong>Home</strong></a>
                    </div>
                </div>    
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Methodology</button>
                    <div id="Methodology" class="dropdown-content">
                        
                        <a href="methodology.xhtml"><strong>Methods</strong></a>
                    </div>
                </div>
                
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Candidates</button>
                    <div id="candidates" class="dropdown-content">
                        
                        <a href="democrats.xhtml"><strong>Democrats</strong></a>
                        <a href="republicans.xhtml"><strong>Republicans</strong></a>
                    </div>
                </div>
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Debates</button>
                    <div id="debates" class="dropdown-content">
                        
                        <a href="demdebates.xhtml"><strong>Democratic Debates</strong></a>
                        <a href="repdebates.xhtml"><strong>Republican Debates</strong></a>
                        <a href="gendebates.xhtml"><strong>General Election Debates</strong></a>
                    </div>
                </div>
                
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Analysis</button>
                    <div id="analysis" class="dropdown-content">
                        
                        <a href="analysis.xhtml"><strong>Analysis</strong></a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="debate">
                  <xsl:apply-templates select=""></xsl:apply-templates>  
                    
                </div>
                <div class="debateMenu">     <ul class="candidate">
                    <li><img src="../images/bush.jpg" width="225" height="250"/><br/> </li>
                    <li><img src="../images/carson.jpg" width="225" height="250"/> </li>
                    <li><img src="../images/christie.jpg" width="225" height="250"/></li>
                    <li><img src="../images/cruz.jpg" width="225" height="250"/></li>
                    <li><img src="../images/fiorina.jpg" width="225" height="250"/></li>
                    <li><img src="../images/huckabee.jpg" width="225" height="250"/></li>
                    <li><img src="../images/kasich.jpg" width="225" height="250"/></li>
                    <li><img src="../images/paul.jpg" width="225" height="250"/></li>
                    <li><img src="../images/rubio.jpg" width="225" height="250"/></li>
                    <li><img src="../images/trump.jpg" alt="Trump" width="225" height="250"/></li>
                    <li><img src="../images/walker.jpg" width="225" height="250"/></li>
                    
                </ul>
                </div>
            </div>
        </body>
    </html>
</xsl:stylesheet>