declare variable $dem_debates as document-node()+ := collection("../xml/Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../xml/Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;
declare variable $all_tropes as element(trope)+ := $all_debates//trope;
declare variable $all_types as xs:string+ := distinct-values($all_tropes/@type/string());
declare variable $all_candidates as xs:string+ := distinct-values($all_debates//candidate/@who/string());
for $candidate in $all_candidates
let $candidate_trops := $all_tropes[ancestor::speech[@speaker eq $candidate]]
return concat($candidate, ' has ', count($candidate_trops), ' tropes&#x0a;')