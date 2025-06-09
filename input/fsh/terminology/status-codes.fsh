// ValueSet: SDHRAllergyIntoleranceClinicalStatusValueSet
// Id: sdhr-allergyintolerance-clinical-status-valueset
// Title: "ValueSet for AllergyIntolerance Status"
// * include codes from valueset http://hl7.org/fhir/ValueSet/allergyintolerance-clinical
// //* include codes from system SDHROther
// //* include codes from valueset https://nzhts.digital.health.nz/fhir/ValueSet/canshare-diagnosis-clinical-status
// * include $sct#443601000210103 "Active phase"
// * include $sct#443611000210101 "Inactive phase"
// * include $sct#443821000210107 "Resolved phase"

// ValueSet: SDHRVerificationStatusValueSet
// Id: sdhr-verification-status-valueset
// Title: "ValueSet for AllergyIntolerance Verification Status"
// * include codes from valueset http://hl7.org/fhir/ValueSet/allergyintolerance-verification
// //* include codes from system SDHROther
// * include $sct#466541000210104 "Unconfirmed"
// * include $sct#410605003 "Confirmed present"
// * include $sct#723511001 "Refuted"


CodeSystem: SDHROther
Id: sdhr-other-codes
Title: "SDHR Codes where the appropriate code is not known or can not be determined."
* ^meta.versionId = "1"
* ^status = #draft
* ^experimental = false
* ^publisher = "HISO"
* ^contact.name = "HISO"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "Standards@health.govt.nz"
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete
* #other "Other" "This code is used when the appropriate code is not known or can not be determined."


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