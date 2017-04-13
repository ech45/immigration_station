<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy=compat"/>
    <!-- stopword list from http://www.ranks.nl/stopwords -->
    <xsl:variable name="demDebates" as="document-node()*"
        select="collection('../xml/Democratic_Debates/?select=*.xml')"/>
    <xsl:variable name="repDebates" as="document-node()*"
        select="collection('../xml/Republican_Debates/?select=*.xml')"/>
    <xsl:variable name="genDebates" as="document-node()*" select="collection('../xml/General_Debates/?select*.xml')"/>
  <!--  <xsl:variable name="genDebates" as="document-node()*" select="collection('../xml/General_Debates/?select=*.xml')"/> -->
    <xsl:variable name="allDebates" as="document-node()*" select="$demDebates | $repDebates |$genDebates"/>
    <xsl:variable name="stopwords" as="xs:string+"
        select="
            ('a',
            'about',
            'above',
            'after',
            'again',
            'against',
            'all',
            'am',
            'an',
            'and',
            'any',
            'are',
            'arent',
            'as',
            'at',
            'be',
            'because',
            'been',
            'before',
            'being',
            'below',
            'between',
            'both',
            'but',
            'by',
            'cant',
            'cannot',
            'could',
            'couldnt',
            'did',
            'didnt',
            'do',
            'does',
            'doesnt',
            'doing',
            'dont',
            'down',
            'during',
            'each',
            'few',
            'for',
            'from',
            'further',
            'had',
            'hadnt',
            'has',
            'hasnt',
            'have',
            'havent',
            'having',
            'he',
            'hed',
            'hell',
            'hes',
            'her',
            'here',
            'heres',
            'hers',
            'herself',
            'him',
            'himself',
            'his',
            'how',
            'hows',
            'i',
            'id',
            'ill',
            'im',
            'ive',
            'if',
            'in',
            'into',
            'is',
            'isnt',
            'it',
            'its',
            'its',
            'itself',
            'lets',
            'me',
            'more',
            'most',
            'mustnt',
            'my',
            'myself',
            'no',
            'nor',
            'not',
            'of',
            'off',
            'on',
            'once',
            'only',
            'or',
            'other',
            'ought',
            'our',
            'ours',
            'ourselves',
            'out',
            'over',
            'own',
            'same',
            'shant',
            'she',
            'shed',
            'shell',
            'shes',
            'should',
            'shouldnt',
            'so',
            'some',
            'such',
            'than',
            'that',
            'thats',
            'the',
            'their',
            'theirs',
            'them',
            'themselves',
            'then',
            'there',
            'theres',
            'these',
            'they',
            'theyd',
            'theyll',
            'theyre',
            'theyve',
            'this',
            'those',
            'through',
            'to',
            'too',
            'under',
            'until',
            'up',
            'very',
            'was',
            'wasnt',
            'we',
            'wed',
            'well',
            'were',
            'weve',
            'were',
            'werent',
            'what',
            'whats',
            'when',
            'whens',
            'where',
            'wheres',
            'which',
            'while',
            'who',
            'whos',
            'whom',
            'why',
            'whys',
            'with',
            'wont',
            'would',
            'wouldnt',
            'you',
            'youd',
            'youll',
            'youre',
            'youve',
            'your',
            'yours',
            'yourself',
            'yourselves')"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Stuff about immigration</title>
                <!-- The CSS should be in a separate document; it's in the <head> here for convenience -->
                <style type="text/css">
                    table,
                    tr,
                    th,
                    td{
                        border-collapse: collapse;
                        border: 1px solid black;
                    }
                    th,
                    td{
                        padding: 2px;
                    }
                    td:nth-child(2){
                        text-align: right;
                    }</style>
            </head>
            <body>
                <!-- find sentences with <immigration> descendants that contain the string 'immigrant' and group by speaker-->
                <xsl:for-each-group
                    select="$allDebates//speech[contains(., 'immigra')]"
                    group-by="@speaker">
                    <!-- sort by speaker -->
                    <xsl:sort select="@speaker"/>
                    <!-- keep only speeches by candidates, not those by modersators -->
                    <xsl:if test="@speaker = //meta/participants/candidate/@who">
                        <h2>
                            <xsl:value-of select="@speaker"/>
                        </h2>
                       
                        <xsl:variable name="word-string" as="element(speech)+"
                            select="current-group()"/>
                        <!-- $words is a sequence of all words from speeches by the candidate of interest -->
                        <xsl:variable name="words" as="xs:string+"
                            select="tokenize(lower-case(normalize-space(replace(string-join($word-string, ' '), '\p{P}', ''))), '\s+')"/>
                        <table>
                            <tr>
                                <th>Word</th>
                                <th>Count</th>
                            </tr>
                            <!-- for each distinct word by the candidate, count how many times it occurs -->
                         <xsl:for-each select="distinct-values($words)">
                               
                                <!-- sort in descending order by word frequencies; in case of ties, subsort in alphabetical order-->
                                <xsl:sort select="count($words[. eq current()])" order="descending"/>
                                <xsl:sort/>
                                <!-- only report for words that aren't in the stopword list -->
                                
                             <xsl:if test="not(current() = $stopwords) and count($words[. eq current()]) gt 3">
                                   
                                    <tr>
                                        <td>
                                            <xsl:value-of select="current()"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="count($words[. eq current()])"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </xsl:if>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
