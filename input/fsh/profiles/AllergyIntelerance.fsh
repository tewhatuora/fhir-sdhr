Profile: SDHRAllergyIntolerance
Parent: AllergyIntolerance
Description: "AllergyIntolerance FHIR resource for Shared Digital Health Record"
* ^version = "0.1.3"
* implicitRules 0..0
* language 0..0
//* meta.profile only Canonical(https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/SDHRAllergyIntolerance)
* modifierExtension 0..0
* contained 0..0
* clinicalStatus from http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical (required)
* verificationStatus from http://terminology.hl7.org/CodeSystem/allergyintolerance-verification (required)
* code 1..1
* code.coding.userSelected 0..1
* code.coding.userSelected ^short = "Indicates that the value has been selected by a system user"
* code.coding.userSelected ^definition = "This field is used to maintain the code as selected by the source systems end user. For example, where a patient management system uses local codes or a non-common code set to record a substance or allergen this field indicates that the value is as selected by the system user. Some level of clinical interpretation may be required."
* patient.identifier only Identifier
* recorder.identifier only Identifier