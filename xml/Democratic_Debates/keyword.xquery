declare variable $dem_debates as document-node()+ := collection("../Democratic_Debates/?select=*.xml");
declare variable $rep_debates as document-node()+ := collection("../Republican_Debates/?select=*.xml");
declare variable $all_debates as document-node()+ := $dem_debates | $rep_debates;

declare variable $all_keywords as element(keyword)+ := $all_debates//keyword;
declare variable $all_rep_keywords as element(keyword)+ := $rep_debates//keyword;
declare variable $count_all_rep_keywords as xs:integer := count($all_rep_keywords);
declare variable $all_dem_keywords as element(keyword)+ := $dem_debates//keyword;
declare variable $count_all_dem_keywords as xs:integer := count($all_dem_keywords);

declare variable $rep_immigration as element(keyword)+ := $all_rep_keywords[@term eq 'immigration'];
declare variable $rep_immigration_reform as element(keyword)+ := $all_rep_keywords[@term eq 'immigration reform'];
declare variable $rep_immigration_bill as element(keyword)+ := $all_rep_keywords[@term eq 'immigration_bill'];
declare variable $rep_immigration_policy as element(keyword)+ := $all_rep_keywords[@term eq 'immigration policy'];
declare variable $rep_immigration_laws as element(keyword)+ := $all_rep_keywords[@term eq 'immigration laws'];
declare variable $rep_comprehensive_immigration_reform as element(keyword)+ := $all_rep_keywords[@term eq 'comprehensive immigration reform'];
declare variable $rep_immigration_visa as element(keyword)+ := $all_rep_keywords[@term eq 'immigration visa'];
declare variable $rep_immigration_system as element(keyword)+ := $all_rep_keywords[@term eq 'immigration system'];
declare variable $rep_immigration_reformf as element(keyword)+ := $all_rep_keywords[@term eq 'immigration reformf'];
declare variable $rep_immigration_proposal as element(keyword)+ := $all_rep_keywords[@term eq 'immigration proposal'];
declare variable $rep_immigration_bashing as element(keyword)+ := $all_rep_keywords[@term eq 'immigration-bashing'];
declare variable $rep_immigration_law as element(keyword)+ := $all_rep_keywords[@term eq 'immigration law'];
declare variable $rep_immigration_problem as element(keyword)+ := $all_rep_keywords[@term eq 'immigration problem'];

declare variable $rep_pathway_to_citizenship as element(keyword)+ := $all_rep_keywords[@term eq 'pathway to citizenship'];
declare variable $rep_path_to_citizenship as element(keyword)+ := $all_rep_keywords[@term eq 'path to citizenship'];
declare variable $rep_path_towards_citizenship as element(keyword)+ := $all_rep_keywords[@term eq 'path towards citizenship'];
declare variable $rep_path as element(keyword)+ := $all_rep_keywords[@term eq 'path'];
declare variable $rep_path_toward_citizenship as element(keyword)+ := $all_rep_keywords[@term eq 'path toward citizenship'];


declare variable $rep_border as element(keyword)+ := $all_rep_keywords[@term eq 'border'];
declare variable $rep_border_security as element(keyword)+ := $all_rep_keywords[@term eq 'border security'];
declare variable $rep_border_security2 as element(keyword)+ := $all_rep_keywords[@term eq 'border_security'];
declare variable $rep_border_agent as element(keyword)+ := $all_rep_keywords[@term eq 'border agent'];
declare variable $rep_border_patrol as element(keyword)+ := $all_rep_keywords[@term eq 'border patrol'];
declare variable $rep_border_control as element(keyword)+ := $all_rep_keywords[@term eq 'border control'];

declare variable $rep_wall as element(keyword)+ := $all_rep_keywords[@term eq 'wall'];

declare variable $rep_amnesty as element(keyword)+ := $all_rep_keywords[@term eq 'amnesty'];

declare variable $rep_comprehensive_reform as element(keyword)+ := $all_rep_keywords[@term eq 'comphrensive reform'];
declare variable $rep_birthright_citizenship as element(keyword)+ := $all_rep_keywords[@term eq 'birthright citizenship'];
declare variable $rep_earned_legal_status as element(keyword)+ := $all_rep_keywords[@term eq 'earned legal status'];
declare variable $rep_asylum as element(keyword)+ := $all_rep_keywords[@term eq 'asylum'];
declare variable $rep_e-verify as element(keyword)+ := $all_rep_keywords[@term eq 'e-verify'];
declare variable $rep_sanctuary_city as  element(keyword)+ := $all_rep_keywords[@term eq 'sanctuary city'];
declare variable $rep_visa_overstay as  element(keyword)+ := $all_rep_keywords[@term eq 'visa overstay'];

declare variable $dem_immigration as element(keyword)+ := $all_dem_keywords[@term eq 'immigration'];
declare variable $dem_immigration_reform as element(keyword)+ := $all_dem_keywords[@term eq 'immigration reform'];
declare variable $dem_immigration_bill as element(keyword)+ := $all_dem_keywords[@term eq 'immigration_bill'];
declare variable $dem_immigration_policy as element(keyword)+ := $all_dem_keywords[@term eq 'immigration policy'];
declare variable $dem_immigration_laws as element(keyword)+ := $all_dem_keywords[@term eq 'immigration laws'];
declare variable $dem_comprehensive_immigration_reform as element(keyword)+ := $all_dem_keywords[@term eq 'comprehensive immigration reform'];
declare variable $dem_immigration_visa as element(keyword)+ := $all_dem_keywords[@term eq 'immigration visa'];
declare variable $dem_immigration_system as element(keyword)+ := $all_dem_keywords[@term eq 'immigration system'];
declare variable $dem_immigration_reformf as element(keyword)+ := $all_dem_keywords[@term eq 'immigration reformf'];
declare variable $dem_immigration_proposal as element(keyword)+ := $all_dem_keywords[@term eq 'immigration proposal'];
declare variable $dem_immigration_bashing as element(keyword)+ := $all_dem_keywords[@term eq 'immigration-bashing'];
declare variable $dem_immigration_law as element(keyword)+ := $all_dem_keywords[@term eq 'immigration law'];
declare variable $dem_immigration_problem as element(keyword)+ := $all_dem_keywords[@term eq 'immigration problem'];

declare variable $dem_pathway_to_citizenship as element(keyword)+ := $all_dem_keywords[@term eq 'pathway to citizenship'];
declare variable $dem_path_to_citizenship as element(keyword)+ := $all_dem_keywords[@term eq 'path to citizenship'];
declare variable $dem_path_towards_citizenship as element(keyword)+ := $all_dem_keywords[@term eq 'path towards citizenship'];
declare variable $dem_path as element(keyword)+ := $all_dem_keywords[@term eq 'path'];
declare variable $dem_path_toward_citizenship as element(keyword)+ := $all_dem_keywords[@term eq 'path toward citizenship'];

declare variable $dem_border as element(keyword)+ := $all_dem_keywords[@term eq 'border'];
declare variable $dem_border_security as element(keyword)+ := $all_dem_keywords[@term eq 'border security'];
declare variable $dem_border_security2 as element(keyword)+ := $all_dem_keywords[@term eq 'border_security'];
declare variable $dem_border_agent as element(keyword)+ := $all_dem_keywords[@term eq 'border agent'];
declare variable $dem_border_patrol as element(keyword)+ := $all_dem_keywords[@term eq 'border patrol'];
declare variable $dem_border_control as element(keyword)+ := $all_dem_keywords[@term eq 'border control'];

declare variable $dem_wall as element(keyword)+ := $all_dem_keywords[@term eq 'wall'];

declare variable $dem_amnesty as element(keyword)+ := $all_dem_keywords[@term eq 'amnesty'];

declare variable $dem_comprehensive_reform as element(keyword)+ := $all_dem_keywords[@term eq 'comphrensive reform'];
declare variable $dem_birthright_citizenship as element(keyword)+ := $all_dem_keywords[@term eq 'birthright citizenship'];
declare variable $dem_earned_legal_status as element(keyword)+ := $all_dem_keywords[@term eq 'earned legal status'];
declare variable $dem_asylum as element(keyword)+ := $all_dem_keywords[@term eq 'asylum'];
declare variable $dem_e-verify as element(keyword)+ := $all_dem_keywords[@term eq 'e-verify'];
declare variable $dem_sanctuary_city as  element(keyword)+ := $all_dem_keywords[@term eq 'sanctuary city'];
declare variable $dem_visa_overstay as  element(keyword)+ := $all_dem_keywords[@term eq 'visa overstay'];

sum(count($dem_asylum))






