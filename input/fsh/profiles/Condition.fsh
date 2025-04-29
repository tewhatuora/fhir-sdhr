Profile: SDHRCondition
Parent: NzCondition
Description: "Condition resource to record problems and conditions affecting a person"

* meta.profile 1..1

* meta.source 1..1
* meta insert MetaSource

* insert LocalIdentifierDocs

* onset[x] only dateTime

* severity 0..0
* encounter 0..0

* modifierExtension 0..0
* contained 0..0

* insert ProfilePatient(subject)

* insert ProfilePractitioner(asserter)

* code 1..1 
* code from http://hl7.org/fhir/ValueSet/condition-code (preferred)
* insert UserSelected
