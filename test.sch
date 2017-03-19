<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:let name="econ_subtypes" value="'welfare', 'jobs', 'ambig','growth','skills'"/>
    <sch:let name="secure_subtypes" value="'crime', 'drugs', 'terrorism', 'ambig'"/>
    <sch:let name="value_subtypes"
        value="'sovereignty', 'empathy', 'culture', 'naturalization', 'ambig','america_first','american_dream'"/>
    <sch:pattern>
        <sch:rule context="@type[. eq 'econ']">
            <sch:assert test="../@subtype = $econ_subtypes">When @type = 'econ', @subtype must equal
                one of: <sch:value-of select="string-join($econ_subtypes, ', ')"/>.</sch:assert>
        </sch:rule>
        <sch:rule context="@type[. eq 'secure']">
            <sch:assert test="../@subtype = $secure_subtypes">When @type = 'secure', @subtype must
                equal one of: <sch:value-of select="string-join($secure_subtypes, ', ')"
                />.</sch:assert>
        </sch:rule>
        <sch:rule context="@type[. eq 'value']">
            <sch:assert test="../@subtype = $value_subtypes">When @type = 'value', @subtype must
                equal one of: <sch:value-of select="string-join($value_subtypes, ', ')"
                />.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
