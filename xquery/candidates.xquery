declare variable $dem_debates as document-node()+ := collection("../xml/Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../xml/Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;

declare variable $sanders as element(trope)+ := $dem_debates//speech[@speaker='SANDERS']//trope;
declare variable $clinton as element(trope)+ := $dem_debates//speech[@speaker='CLINTON']//trope;
declare variable $christie as element(trope)+ := $rep_debates//speech[@speaker='CHRISTIE']//trope;
declare variable $cruz as element(trope)+ := $rep_debates//speech[@speaker='CRUZ']//trope;
declare variable $bush as element(trope)+ := $rep_debates//speech[@speaker='BUSH']//trope;
declare variable $carson as element(trope)+ := $rep_debates//speech[@speaker='CARSON']//trope;
declare variable $huckabee as element(trope)+ := $rep_debates//speech[@speaker='CARSON']//trope;
declare variable $kasich as element(trope)+ := $rep_debates//speech[@speaker='KASICH']//trope;
declare variable $paul as element(trope)+ := $rep_debates//speech[@speaker='PAUL']//trope;
declare variable $rubio as element(trope)+ := $rep_debates//speech[@speaker='RUBIO']//trope;
declare variable $trump as element(trope)+ := $rep_debates//speech[@speaker='TRUMP']//trope;
declare variable $omalley as element(trope)+ := $dem_debates//speech[@speaker='O&apos;MALLEY']//trope;

declare variable $all_tropes as element(trope)+ := $all_debates//trope;
declare variable $all_tropes_count as xs:integer := count($all_tropes);

declare variable $all_value_tropes as element(trope)* := $all_tropes[@type eq 'value'];
declare variable $all_econ_tropes as element(trope)* := $all_tropes[@type eq 'econ'];
declare variable $all_secure_tropes as element(trope)* := $all_tropes[@type eq 'secure'];

declare variable $all_value_tropes_count as xs:integer := count($all_value_tropes);
declare variable $all_econ_tropes_count as xs:integer := count($all_econ_tropes);
declare variable $all_secure_tropes_count as xs:integer := count($all_secure_tropes);

declare variable $omalley_value_tropes_count as xs:integer := count($omalley[@type eq 'value']);
declare variable $omalley_econ_tropes_count as xs:integer := count($omalley[@type eq 'econ']);
declare variable $omalley_secure_tropes_count as xs:integer := count($omalley[@type eq 'secure']);
declare variable $omalley_value_proportion as xs:decimal := $omalley_value_tropes_count div $all_value_tropes_count;
declare variable $omalley_econ_proportion as xs:decimal := $omalley_econ_tropes_count div $all_econ_tropes_count;
declare variable $omalley_secure_proportion as xs:decimal := $omalley_secure_tropes_count div $all_secure_tropes_count;

declare variable $sanders_value_tropes_count as xs:integer := count($sanders[@type eq 'value']);
declare variable $sanders_econ_tropes_count as xs:integer := count($sanders[@type eq 'econ']);
declare variable $sanders_secure_tropes_count as xs:integer := count($sanders[@type eq 'secure']);
declare variable $sanders_value_proportion as xs:decimal := $sanders_value_tropes_count div $all_value_tropes_count;
declare variable $sanders_econ_proportion as xs:decimal := $sanders_econ_tropes_count div $all_econ_tropes_count;
declare variable $sanders_secure_proportion as xs:decimal := $sanders_secure_tropes_count div $all_secure_tropes_count;

declare variable $clinton_value_tropes_count as xs:integer := count($clinton[@type eq 'value']);
declare variable $clinton_econ_tropes_count as xs:integer := count($clinton[@type eq 'econ']);
declare variable $clinton_secure_tropes_count as xs:integer := count($clinton[@type eq 'secure']);
declare variable $clinton_value_proportion as xs:decimal := $clinton_value_tropes_count div $all_value_tropes_count;
declare variable $clinton_econ_proportion as xs:decimal := $clinton_econ_tropes_count div $all_econ_tropes_count;
declare variable $clinton_secure_proportion as xs:decimal := $clinton_secure_tropes_count div $all_secure_tropes_count;

declare variable $christie_value_tropes_count as xs:integer := count($christie[@type eq 'value']);
declare variable $christie_econ_tropes_count as xs:integer := count($christie[@type eq 'econ']);
declare variable $christie_secure_tropes_count as xs:integer := count($christie[@type eq 'secure']);
declare variable $christie_value_proportion as xs:decimal := $christie_value_tropes_count div $all_value_tropes_count;
declare variable $christie_econ_proportion as xs:decimal := $christie_econ_tropes_count div $all_econ_tropes_count;
declare variable $christie_secure_proportion as xs:decimal := $christie_secure_tropes_count div $all_secure_tropes_count;

declare variable $carson_value_tropes_count as xs:integer := count($carson[@type eq 'value']);
declare variable $carson_econ_tropes_count as xs:integer := count($carson[@type eq 'econ']);
declare variable $carson_secure_tropes_count as xs:integer := count($carson[@type eq 'secure']);
declare variable $carson_value_proportion as xs:decimal := $carson_value_tropes_count div $all_value_tropes_count;
declare variable $carson_econ_proportion as xs:decimal := $carson_econ_tropes_count div $all_econ_tropes_count;
declare variable $carson_secure_proportion as xs:decimal := $carson_secure_tropes_count div $all_secure_tropes_count;

declare variable $cruz_value_tropes_count as xs:integer := count($cruz[@type eq 'value']);
declare variable $cruz_econ_tropes_count as xs:integer := count($cruz[@type eq 'econ']);
declare variable $cruz_secure_tropes_count as xs:integer := count($cruz[@type eq 'secure']);
declare variable $cruz_value_proportion as xs:decimal := $cruz_value_tropes_count div $all_value_tropes_count;
declare variable $cruz_econ_proportion as xs:decimal := $cruz_econ_tropes_count div $all_econ_tropes_count;
declare variable $cruz_secure_proportion as xs:decimal := $cruz_secure_tropes_count div $all_secure_tropes_count;

declare variable $bush_value_tropes_count as xs:integer := count($bush[@type eq 'value']);
declare variable $bush_econ_tropes_count as xs:integer := count($bush[@type eq 'econ']);
declare variable $bush_secure_tropes_count as xs:integer := count($bush[@type eq 'secure']);
declare variable $bush_value_proportion as xs:decimal := $bush_value_tropes_count div $all_value_tropes_count;
declare variable $bush_econ_proportion as xs:decimal := $bush_econ_tropes_count div $all_econ_tropes_count;
declare variable $bush_secure_proportion as xs:decimal := $bush_secure_tropes_count div $all_secure_tropes_count;

declare variable $kasich_value_tropes_count as xs:integer := count($kasich[@type eq 'value']);
declare variable $kasich_econ_tropes_count as xs:integer := count($kasich[@type eq 'econ']);
declare variable $kasich_secure_tropes_count as xs:integer := count($kasich[@type eq 'secure']);
declare variable $kasich_value_proportion as xs:decimal := $kasich_value_tropes_count div $all_value_tropes_count;
declare variable $kasich_econ_proportion as xs:decimal := $kasich_econ_tropes_count div $all_econ_tropes_count;
declare variable $kasich_secure_proportion as xs:decimal := $kasich_secure_tropes_count div $all_secure_tropes_count;

declare variable $huckabee_value_tropes_count as xs:integer := count($huckabee[@type eq 'value']);
declare variable $huckabee_econ_tropes_count as xs:integer := count($huckabee[@type eq 'econ']);
declare variable $huckabee_secure_tropes_count as xs:integer := count($huckabee[@type eq 'secure']);
declare variable $huckabee_value_proportion as xs:decimal := $huckabee_value_tropes_count div $all_value_tropes_count;
declare variable $huckabee_econ_proportion as xs:decimal := $huckabee_econ_tropes_count div $all_econ_tropes_count;
declare variable $huckabee_secure_proportion as xs:decimal := $huckabee_secure_tropes_count div $all_secure_tropes_count;

declare variable $paul_value_tropes_count as xs:integer := count($paul[@type eq 'value']);
declare variable $paul_econ_tropes_count as xs:integer := count($paul[@type eq 'econ']);
declare variable $paul_secure_tropes_count as xs:integer := count($paul[@type eq 'secure']);
declare variable $paul_value_proportion as xs:decimal := $paul_value_tropes_count div $all_value_tropes_count;
declare variable $paul_econ_proportion as xs:decimal := $paul_econ_tropes_count div $all_econ_tropes_count;
declare variable $paul_secure_proportion as xs:decimal := $paul_secure_tropes_count div $all_secure_tropes_count;

declare variable $rubio_value_tropes_count as xs:integer := count($rubio[@type eq 'value']);
declare variable $rubio_econ_tropes_count as xs:integer := count($rubio[@type eq 'econ']);
declare variable $rubio_secure_tropes_count as xs:integer := count($rubio[@type eq 'secure']);
declare variable $rubio_value_proportion as xs:decimal := $rubio_value_tropes_count div $all_value_tropes_count;
declare variable $rubio_econ_proportion as xs:decimal := $rubio_econ_tropes_count div $all_econ_tropes_count;
declare variable $rubio_secure_proportion as xs:decimal := $rubio_secure_tropes_count div $all_secure_tropes_count;

declare variable $trump_value_tropes_count as xs:integer := count($trump[@type eq 'value']);
declare variable $trump_econ_tropes_count as xs:integer := count($trump[@type eq 'econ']);
declare variable $trump_secure_tropes_count as xs:integer := count($trump[@type eq 'secure']);
declare variable $trump_value_proportion as xs:decimal := $trump_value_tropes_count div $all_value_tropes_count;
declare variable $trump_econ_proportion as xs:decimal := $trump_econ_tropes_count div $all_econ_tropes_count;
declare variable $trump_secure_proportion as xs:decimal := $trump_secure_tropes_count div $all_secure_tropes_count;

declare variable $all_types as xs:string+ := distinct-values($all_tropes/@type/string());

declare variable $yscale := 400;

declare variable $dem_tropes as element(trope)+ := $dem_debates//trope;
declare variable $dem_value_tropes as element(trope)* := $dem_tropes[@type eq 'value'];
declare variable $dem_value_tropes_count as xs:integer := count($dem_value_tropes);

<svg
    xmlns="http://www.w3.org/2000/svg"
    height="100%"
    width="100%">
    <g
        transform="translate(40,500)">
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
          <line
            x1="200"
            y1="-{$yscale * $sanders_value_proportion}"
            x2="400"
            y2="-{$yscale * $sanders_econ_proportion}"
            stroke="blue"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $sanders_econ_proportion}"
            x2="600"
            y2="-{$yscale * $sanders_secure_proportion}"
            stroke="blue"
            stroke-width="2"/>
             <line
            x1="200"
            y1="-{$yscale * $clinton_value_proportion}"
            x2="400"
            y2="-{$yscale * $clinton_econ_proportion}"
            stroke="blue"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $clinton_econ_proportion}"
            x2="600"
            y2="-{$yscale * $clinton_secure_proportion}"
            stroke="blue"
            stroke-width="2"/>
             <line
            x1="200"
            y1="-{$yscale * $christie_value_proportion}"
            x2="400"
            y2="-{$yscale * $christie_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $christie_econ_proportion}"
            x2="600"
            y2="-{$yscale * $christie_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
             <line
            x1="200"
            y1="-{$yscale * $carson_value_proportion}"
            x2="400"
            y2="-{$yscale * $carson_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $carson_econ_proportion}"
            x2="600"
            y2="-{$yscale * $carson_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="200"
            y1="-{$yscale * $cruz_value_proportion}"
            x2="400"
            y2="-{$yscale * $cruz_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $cruz_econ_proportion}"
            x2="600"
            y2="-{$yscale * $cruz_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
             <line
            x1="200"
            y1="-{$yscale * $bush_value_proportion}"
            x2="400"
            y2="-{$yscale * $bush_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $bush_econ_proportion}"
            x2="600"
            y2="-{$yscale * $bush_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="200"
            y1="-{$yscale * $kasich_value_proportion}"
            x2="400"
            y2="-{$yscale * $kasich_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $kasich_econ_proportion}"
            x2="600"
            y2="-{$yscale * $kasich_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
             <line
            x1="200"
            y1="-{$yscale * $huckabee_value_proportion}"
            x2="400"
            y2="-{$yscale * $huckabee_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $huckabee_econ_proportion}"
            x2="600"
            y2="-{$yscale * $huckabee_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
                <line
            x1="200"
            y1="-{$yscale * $paul_value_proportion}"
            x2="400"
            y2="-{$yscale * $paul_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $paul_econ_proportion}"
            x2="600"
            y2="-{$yscale * $paul_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
                 <line
            x1="200"
            y1="-{$yscale * $rubio_value_proportion}"
            x2="400"
            y2="-{$yscale * $rubio_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $rubio_econ_proportion}"
            x2="600"
            y2="-{$yscale * $rubio_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
                  <line
            x1="200"
            y1="-{$yscale * $trump_value_proportion}"
            x2="400"
            y2="-{$yscale * $trump_econ_proportion}"
            stroke="red"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $trump_econ_proportion}"
            x2="600"
            y2="-{$yscale * $trump_secure_proportion}"
            stroke="red"
            stroke-width="2"/>
                     <line
            x1="200"
            y1="-{$yscale * $omalley_value_proportion}"
            x2="400"
            y2="-{$yscale * $omalley_econ_proportion}"
            stroke="blue"
            stroke-width="2"/>
            <line
            x1="400"
            y1="-{$yscale * $omalley_econ_proportion}"
            x2="600"
            y2="-{$yscale * $omalley_secure_proportion}"
            stroke="blue"
            stroke-width="2"/>
              <text
            x="165"
            y="-{$yscale * 1}">100</text>
            <text
            x="165"
            y="-{$yscale * 0}">0</text>
             <text
            x="165"
            y="-{$yscale * .25}">25</text>
               <text
            x="165"
            y="-{$yscale * .50}">50</text>
               <text
            x="165"
            y="-{$yscale * .75}">75</text>
        </g>

</svg>



