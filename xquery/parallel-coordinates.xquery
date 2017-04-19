declare variable $dem_debates as document-node()+ := collection("../xml/Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../xml/Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;
declare variable $all_tropes as element(trope)+ := $all_debates//trope;
declare variable $all_types as xs:string+ := distinct-values($all_tropes/@type/string());
declare variable $dem_tropes as element(trope)+ := $dem_debates//trope;
declare variable $rep_tropes as element(trope)+ := $rep_debates//trope;

declare variable $yscale := 2; 
<svg
    xmlns="http://www.w3.org/2000/svg"
    height="100%"
    width="100%">
    <g transform="translate(20,300)">
        {
            for $trope at $pos in $all_types
            return                (:Each line is 100% of the trope type:)
                <line
                    x1="{200 * $pos}"
                    y1="{$yscale * 100}"
                    x2="{200 * $pos}"
                    y2="{-$yscale * 100}"
                    stroke="black"
                    stroke-width="2"/>
       }</g>
</svg>

(: <line 
                    x1="{$dem_debates[.//trope div $all_tropes]}"
                    y1="{$dem_debates[.//trope div $all_tropes]}"
                    x2="-{$dem_debates[.//trope div $all_tropes]}"
                    y2="-{$dem_debates[.//trope div $all_tropes]}"
                    stroke="blue"
                    stroke-width="2"/>
                    
:)
