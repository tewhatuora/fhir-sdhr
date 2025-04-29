Profile: SDHREncounter
Parent: Encounter
Description: "Encounter resource to record an instance of an interaction between patient and healthcare provider"

* meta.profile 1..1

* meta.source 1..1
* meta insert MetaSource

* insert LocalIdentifierDocs

// Excluded Elements
* implicitRules 0..0
* language 0..0
* appointment 0..0
* length 0..0
* account 0..0
* hospitalization 0..0
* serviceProvider 0..0
* partOf

// * extension 0..0
* modifierExtension 0..0
* contained 0..0

* insert ProfilePatient(subject)

* participant 1..*
* participant.id 0..0
* participant.extension 0..0
* participant.modifierExtension 0..0

* insert ProfilePractitioner(participant.individual)
* participant.individual.extension 0..0
* participant.individual.identifier 0..0
