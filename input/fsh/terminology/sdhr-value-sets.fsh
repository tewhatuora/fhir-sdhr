ValueSet: SDHREncounterClassValueSet
Id: sdhr-encounter-class-valueset
Title: "ValueSet for Encounter Class"
Description: "A ValueSet containing all codes from the Encounter Class system."
* include codes from valueset http://terminology.hl7.org/ValueSet/v3-ActEncounterCode
* include codes from system SDHROther


ValueSet: SDHRAllergyIntoleranceManifestationValueSet
Id: sdhr-allergyintolerance-manifestation-valueset
Title: "ValueSet for AllergyIntolerance Manifestation"
Description: "A ValueSet containing all codes from the AllergyIntolerance Manifestation system."
* include codes from system http://snomed.info/sct where concept is-a #281647001
// * include codes from valueset http://snomed.info/sct?fhir_vs=ecl/%5E%20351000210106%20
// * include codes from system http://snomed.info/sct/21000210109 where refset = #351000210106


ValueSet: SDHRAllergyIntoleranceSeverityValueSet
Id: sdhr-allergyintolerance-severity-valueset
Title: "ValueSet for AllergyIntolerance Severity"
Description: "A ValueSet containing all codes from the AllergyIntolerance Severity system."
* include codes from valueset http://hl7.org/fhir/ValueSet/reaction-event-severity
* include $sct#255604002 "Mild (qualifier value)"
* include $sct#1255665007 "Moderate (qualifier value)"
* include $sct#24484000 "Severe (severity modifier) (qualifier value)"

ValueSet: SDHRAllergyIntoleranceCodeValueSet
Id: sdhr-allergyintolerance-code-valueset
Title: "ValueSet for AllergyIntolerance Code"
Description: "A ValueSet containing all codes from the AllergyIntolerance Code system."
* include codes from valueset http://hl7.org/fhir/ValueSet/allergyintolerance-code
* include codes from system https://standards.digital.health.nz/ns/nzmt-type-code


// ValueSet: SDHRReferenceSetValueSet
// Id: sdhr-reference-set-valueset
// Title: "ValueSet for SNOMED Reference Set 351000210106"
// Description: "A ValueSet containing all codes from the SNOMED CT reference set 351000210106."
// * include codes from system http://snomed.info/sct where refset = #351000210106

ValueSet: SDHRResourceTagsValueSet
Id: sdhr-resource-tags-valueset
Title: "ValueSet for SDHR Resource Tags"
Description: "A ValueSet containing all codes from the SDHR Resource Tags system."
* include nz-sdhr-codesystem#highlighted

ValueSet: SDHRParticipationReasonValueSet
Id: sdhr-participation-reason-valueset
Title: "ValueSet for SDHR Participation Reason"
Description: "A ValueSet containing all codes from the SDHR Participation Reason system."
* include codes from system sdhr-participation-reason