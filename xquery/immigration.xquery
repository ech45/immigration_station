declare variable $dem_debates as document-node()+ := collection("../xml/Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../xml/Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;

declare variable $all_immigrant as element(immigrant)+ := $all_debates//immigrant;
declare variable $distinct_all_immigrant as xs:anyAtomicType+ := distinct-values($all_debates//immigrant/@term);
declare variable $rep_immigrant as element(immigrant)+ := $rep_debates//immigrant;
declare variable $dem_immigrant as element(immigrant)+ := $dem_debates//immigrant;

declare variable $dem_immigrant_term as element(immigrant)+ := $dem_immigrant[@term eq 'immigrant'];
declare variable $dem_immigrants_term as element(immigrant)+ := $dem_immigrant[@term eq 'immigrants'];
declare variable $dem_mexican_immigrants as element(immigrant)+ := $dem_immigrant[@term eq 'Mexican immigrants'];
declare variable $dem_american_immigrants as element(immigrant)+ := $dem_immigrant[@term eq 'new American immigrants'];
declare variable $dem_muslim_immigrants as element(immigrant)+ := $dem_immigrant[@term eq 'muslim immigrant'];
declare variable $dem_american_immigrant as element(immigrant)+ := $dem_immigrant[@term eq 'american immigrant'];


declare variable $dem_undocumented as element(immigrant)+ := $dem_immigrant[@term eq 'undocumented immigrant'];
declare variable $dem_undocumented_child as element(immigrant)+ := $dem_immigrant[@term eq 'undocumented child'];
declare variable $dem_undocumented_worker as element(immigrant)+ := $dem_immigrant[@term eq 'undocumented worker'];
declare variable $dem_these_undocumented as element(immigrant)+ := $dem_immigrant[@term eq 'these who were undocumented'];
declare variable $dem_undocumented_people as element(immigrant)+ := $dem_immigrant[@term eq 'undocumented people'];
declare variable $dem_undocumented_tomato as element(immigrant)+ := $dem_immigrant[@term eq 'undocumented tomato picker'];

declare variable $dem_illegal as element(immigrant)+ := $dem_immigrant[@term eq 'illegal immigrant'];
declare variable $dem_illegal_alien as element(immigrant)+ := $dem_immigrant[@term eq 'illegal alien'];
declare variable $dem_illegals as element(immigrant)+ := $dem_immigrant[@term eq 'illegals'];
declare variable $dem_aliens as element(immigrant)+ := $dem_immigrant[@term eq 'aliens'];

declare variable $dem_refugee as element(immigrant)+ := $dem_immigrant[@term eq 'refugee'];
declare variable $dem_syrian_refuee as element(immigrant)+ := $dem_immigrant[@term eq 'syrian refugee'];
declare variable $dem_Syrian_refuee as element(immigrant)+ := $dem_immigrant[@term eq 'Syrian_refugee'];
declare variable $dem_iraqi_refugee as element(immigrant)+ := $dem_immigrant[@term eq 'iraqi refugee'];
declare variable $dem_middle_eastern_refugee as element(immigrant)+ := $dem_immigrant[@term eq 'Middle Eastern refugee'];

declare variable $dem_guest_worker as element(immigrant)+ := $dem_immigrant[@term eq 'guest worker'];
declare variable $dem_guest_orker as element(immigrant)+ := $dem_immigrant[@term eq 'guest orker'];
declare variable $dem_people as element(immigrant)+ := $dem_immigrant[@term eq 'people'];
declare variable $dem_our_neighbors as element(immigrant)+ := $dem_immigrant[@term eq 'our_neighbors'];
declare variable $dem_student as element(immigrant)+ := $dem_immigrant[@term eq 'student'];
declare variable $dem_those_workers as element(immigrant)+ := $dem_immigrant[@term eq 'those workers'];


declare variable $rep_immigrant_term as element(immigrant)+ := $rep_immigrant[@term eq 'immigrant'];
declare variable $rep_immigrants_term as element(immigrant)+ := $rep_immigrant[@term eq 'immigrants'];
declare variable $rep_mexican_immigrants as element(immigrant)+ := $rep_immigrant[@term eq 'Mexican immigrants'];
declare variable $rep_american_immigrants as element(immigrant)+ := $rep_immigrant[@term eq 'new American immigrants'];
declare variable $rep_muslim_immigrants as element(immigrant)+ := $rep_immigrant[@term eq 'muslim immigrant'];
declare variable $rep_american_immigrant as element(immigrant)+ := $rep_immigrant[@term eq 'american immigrant'];

declare variable $rep_undocumented as element(immigrant)+ := $rep_immigrant[@term eq 'undocumented immigrant'];
declare variable $rep_undocumented_child as element(immigrant)+ := $rep_immigrant[@term eq 'undocumented child'];
declare variable $rep_undocumented_worker as element(immigrant)+ := $rep_immigrant[@term eq 'undocumented worker'];
declare variable $rep_these_undocumented as element(immigrant)+ := $rep_immigrant[@term eq 'these who were undocumented'];
declare variable $rep_undocumented_people as element(immigrant)+ := $rep_immigrant[@term eq 'undocumented people'];
declare variable $rep_undocumented_tomato as element(immigrant)+ := $rep_immigrant[@term eq 'undocumented tomato picker'];


declare variable $rep_illegal as element(immigrant)+ := $rep_immigrant[@term eq 'illegal immigrant'];
declare variable $rep_illegal_alien as element(immigrant)+ := $rep_immigrant[@term eq 'illegal alien'];
declare variable $rep_illegals as element(immigrant)+ := $rep_immigrant[@term eq 'illegals'];
declare variable $rep_aliens as element(immigrant)+ := $rep_immigrant[@term eq 'aliens'];

declare variable $rep_refugee as element(immigrant)+ := $rep_immigrant[@term eq 'refugee'];
declare variable $rep_syrian_refuee as element(immigrant)+ := $rep_immigrant[@term eq 'syrian refugee'];
declare variable $rep_Syrian_refuee as element(immigrant)+ := $rep_immigrant[@term eq 'Syrian_refugee'];
declare variable $rep_iraqi_refugee as element(immigrant)+ := $rep_immigrant[@term eq 'iraqi refugee'];
declare variable $rep_middle_eastern_refugee as element(immigrant)+ := $rep_immigrant[@term eq 'Middle Eastern refugee'];

declare variable $rep_guest_worker as element(immigrant)+ := $rep_immigrant[@term eq 'guest worker'];
declare variable $rep_guest_orker as element(immigrant)+ := $rep_immigrant[@term eq 'guest orker'];
declare variable $rep_people as element(immigrant)+ := $rep_immigrant[@term eq 'people'];
declare variable $rep_our_neighbors as element(immigrant)+ := $rep_immigrant[@term eq 'our_neighbors'];
declare variable $rep_student as element(immigrant)+ := $rep_immigrant[@term eq 'student'];
declare variable $rep_those_workers as element(immigrant)+ := $rep_immigrant[@term eq 'those workers'];


$all_immigrant

