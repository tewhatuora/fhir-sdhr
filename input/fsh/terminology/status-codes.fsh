ValueSet: SDHRAllergyIntoleranceClinicalStatusValueSet
Id: sdhr-allergyintolerance-clinical-status-valueset
Title: "ValueSet for AllergyIntolerance Status"
* include codes from valueset http://hl7.org/fhir/ValueSet/allergyintolerance-clinical
* include codes from system SDHROtherStatus
* include http://snomed.info/sct#443601000210103 "Active phase"
* include http://snomed.info/sct#443611000210101 "Inactive phase"
* include http://snomed.info/sct#443821000210107 "Resolved phase"

ValueSet: SDHRVerificationStatusValueSet
Id: sdhr-verification-status-valueset
Title: "ValueSet for AllergyIntolerance Verification Status"
* include codes from valueset http://hl7.org/fhir/ValueSet/allergyintolerance-verification
* include codes from system SDHROtherStatus
* include http://snomed.info/sct#466541000210104 "Unconfirmed"
* include http://snomed.info/sct#410605003 "Confirmed present"
* include http://snomed.info/sct#723511001 "Refuted"


CodeSystem: SDHROtherStatus
Id: sdhr-other-status-codes
Title: "SDHR Codes for Status where the status is not known"
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
* #other "Other" "This code is used when the status is not known or cannot be determined"


ValueSet: SDHREncounterClassValueSet
Id: sdhr-encounter-class-valueset
Title: "ValueSet for EncounterStatus"
//* include codes from system http://terminology.hl7.org/CodeSystem/v3-ActCode where concept is-a #_ActEncounterCode
* include codes from valueset http://terminology.hl7.org/ValueSet/v3-ActEncounterCode
* include codes from system SDHROtherStatus
