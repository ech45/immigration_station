declare variable $dem_debates as document-node()+ := collection("../xml/Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../xml/Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;

declare variable $dem_tropes as element(trope)+ := $dem_debates//trope;
declare variable $rep_tropes as element(trope)+ := $rep_debates//trope;
declare variable $all_tropes as element(trope)+ := $all_debates//trope;

declare variable $dem_tropes_count as xs:integer := count($dem_tropes);
declare variable $rep_tropes_count as xs:integer := count($rep_tropes);
declare variable $all_tropes_count as xs:integer := count($all_tropes);

declare variable $dem_value_tropes as element(trope)* := $dem_tropes[@type eq 'value'];
declare variable $rep_value_tropes as element(trope)* := $rep_tropes[@type eq 'value'];

declare variable $dem_value_tropes_count as xs:integer := count($dem_value_tropes);
declare variable $rep_value_tropes_count as xs:integer := count($rep_value_tropes);

declare variable $dem_econ_tropes as element(trope)* := $dem_tropes[@type eq 'econ'];
declare variable $rep_econ_tropes as element(trope)* := $rep_tropes[@type eq 'econ'];

declare variable $dem_secure_tropes as element(trope)* := $dem_tropes[@type eq 'secure'];
declare variable $rep_secure_tropes as element(trope)* := $rep_tropes[@type eq 'secure'];

declare variable $dem_econ_tropes_count as xs:integer := count($dem_econ_tropes);
declare variable $rep_econ_tropes_count as xs:integer := count($rep_econ_tropes);

declare variable $dem_secure_tropes_count as xs:integer := count($dem_secure_tropes);
declare variable $rep_secure_tropes_count as xs:integer := count($rep_secure_tropes);

declare variable $all_value_tropes as element(trope)* := $all_tropes[@type eq 'value'];
declare variable $all_econ_tropes as element(trope)* := $all_tropes[@type eq 'econ'];
declare variable $all_secure_tropes as element(trope)* := $all_tropes[@type eq 'secure'];

declare variable $all_value_tropes_count as xs:integer := count($all_value_tropes);
declare variable $all_econ_tropes_count as xs:integer := count($all_econ_tropes);
declare variable $all_secure_tropes_count as xs:integer := count($all_secure_tropes);

declare variable $dem_value_proportion as xs:decimal := $dem_value_tropes_count div $all_value_tropes_count;
declare variable $dem_econ_proportion as xs:decimal := $dem_econ_tropes_count div $all_econ_tropes_count;
declare variable $dem_secure_proportion as xs:decimal := $dem_secure_tropes_count div $all_secure_tropes_count;

declare variable $rep_value_proportion as xs:decimal := $rep_value_tropes_count div $all_value_tropes_count;
declare variable $rep_econ_proportion as xs:decimal := $rep_econ_tropes_count div $all_econ_tropes_count;
declare variable $rep_secure_proportion as xs:decimal := $rep_secure_tropes_count div $all_secure_tropes_count;

declare variable $all_types as xs:string+ := distinct-values($all_tropes/@type/string());

declare variable $yscale := 200;
<svg
    xmlns="http://www.w3.org/2000/svg"
    height="100%"
    width="100%">
    <g
        transform="translate(20,300)">
        {
            for $type at $pos in $all_types
            let $xPos as xs:integer := 200 * $pos
            return (:Each line is 100% of the trope type:)
                (<line
                    x1="{$xPos}"
                    y1="-{$yscale}"
                    x2="{$xPos}"
                    y2="0"
                    stroke="black"
                    stroke-width="2"/>,
                <text
                    x="{$xPos}"
                    y="20"
                    text-anchor="middle">{$type}</text>)
        }<text x="15" y="-100">Percent</text>
        <text x="400" y="60" text-anchor="middle">Trope Type</text>
        <!-- dem lines-->
        <line
            x1="200"
            y1="-{$yscale * $dem_value_proportion}"
            x2="400"
            y2="-{$yscale * $dem_econ_proportion}"
            stroke="blue"
            stroke-width="2"/>
        <line
            x1="200"
            y1="-{$yscale * $rep_value_proportion}"
            x2="400"
            y2="-{$yscale * $rep_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
        <line
            x1="400"
            y1="-{$yscale * $dem_econ_proportion
                }"
            x2="600"
            y2="-{$yscale * $dem_secure_proportion}"
            stroke="blue"
            stroke-width="2"/>
        <line
            x1="400"
            y1="-{$yscale * $rep_econ_proportion
                }"
            x2="600"
            y2="-{$yscale * $rep_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
        <text
            x="165"
            y="-{$yscale * $dem_value_proportion + 5}">{format-number(100 * $dem_value_proportion, '#0.0')}</text>
        <text
            x="365"
            y="-{$yscale * $dem_econ_proportion + 5}">{format-number(100 * $dem_econ_proportion, '#0.0')}</text>
        <text
            x="165"
            y="-{$yscale * $rep_value_proportion + 5}">{format-number(100 * $rep_value_proportion, '#0.0')}</text>
        <text
            x="365"
            y="-{$yscale * $rep_econ_proportion + 8}">{format-number(100 * $rep_econ_proportion, '#0.0')}</text>
        <text
            x="565"
            y="-{$yscale * $rep_secure_proportion + 8}">{format-number(100 * $rep_secure_proportion, '#0.0')}</text>
        <text
            x="365"
            y="-{$yscale * $rep_econ_proportion + 8}">{format-number(100 * $rep_econ_proportion, '#0.0')}</text>
        <text
            x="565"
            y="-{$yscale * $dem_secure_proportion + 15}">{format-number(100 * $dem_secure_proportion, '#0.0')}</text></g>

</svg>

