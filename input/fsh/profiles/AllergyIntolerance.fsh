Profile: SDHRAllergyIntolerance
Parent: AllergyIntolerance
Description: "AllergyIntolerance FHIR resource for Shared Digital Health Record"
* ^version = "0.1.3"
* implicitRules 0..0
* language 0..0
* modifierExtension 0..0

* meta 1..1
* meta.profile 1..1
* meta insert MetaSource
* meta insert MetaTag

* extension contains
  hnz-sdhr-client-last-updated-extension named ClientLastUpdated 0..1

* insert LocalIdentifierDocs

* insert ProfilePatient(patient)

* obeys code-or-note-required

* contained 0..0
//* clinicalStatus from sdhr-allergyintolerance-clinical-status-valueset (required)
//* verificationStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-verification (required)

//* code from http://hl7.org/fhir/ValueSet/allergyintolerance-code (preferred)
* code from sdhr-allergyintolerance-code-valueset (preferred)
* code ^short = "Preferred - a SNOMED CT code or a NZMT code. When the intolerance is referring to a medication please use the NZMT codeset. When referring to another supstance, food etc. please use SNOMED."
* insert UserSelected
* recorder.identifier only Identifier
* recorder ^short = "Preferred - an HPI Practitioner URL with format https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/11AAAA"
* asserter ^short = "Preferred - an HPI Practitioner URL with format https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/11AAAA"
//* category from sdhr-allergyintolerance-category-valueset (required)
* reaction.manifestation from sdhr-allergyintolerance-manifestation-valueset (required)
* reaction.severity from sdhr-allergyintolerance-severity-valueset (required)
