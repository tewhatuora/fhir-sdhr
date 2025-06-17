ValueSet: SDHREncounterClassValueSet
Id: sdhr-encounter-class-valueset
Title: "ValueSet for EncounterStatus"
* include codes from valueset http://terminology.hl7.org/ValueSet/v3-ActEncounterCode
* include codes from system SDHROther


ValueSet: SDHRAllergyIntoleranceManifestationValueSet
Id: sdhr-allergyintolerance-manifestation-valueset
Title: "ValueSet for AllergyIntolerance Manifestation"
* include codes from system http://snomed.info/sct/21000210109 where refset = #351000210106

ValueSet: SDHRAllergyIntoleranceSeverityValueSet
Id: sdhr-allergyintolerance-severity-valueset
Title: "ValueSet for AllergyIntolerance Severity"
* include codes from valueset http://hl7.org/fhir/ValueSet/reaction-event-severity
* include $sct#255604002 "Mild (qualifier value)"
* include $sct#1255665007 "Moderate (qualifier value)"
* include $sct#24484000 "Severe (severity modifier) (qualifier value)"


// ValueSet: SDHRReferenceSetValueSet
// Id: sdhr-reference-set-valueset
// Title: "ValueSet for SNOMED Reference Set 351000210106"
// Description: "A ValueSet containing all codes from the SNOMED CT reference set 351000210106."
// * include codes from system http://snomed.info/sct where refset = #351000210106

ValueSet: SDHRResourceTagsValueSet
Id: sdhr-resource-tags-valueset
Title: "ValueSet for SDHR Resource Tags"
* include nz-sdhr-codesystem#highlighted

ValueSet: SDHRParticipationReasonValueSet
Id: sdhr-participation-reason-valueset
Title: "ValueSet for SDHR Participation Reason"
* include codes from system sdhr-participation-reason