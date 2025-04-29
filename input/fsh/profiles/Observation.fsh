
Profile: SDHRObservation
Parent: Observation
Description: "A Shared Digital Health Record Observation."
* ^version = "0.1.0"
* ^status = #active

* meta.profile 1..1

* meta.source 1..1
* meta insert MetaSource

* insert LocalIdentifierDocs

* modifierExtension 0..0
* contained 0..0

* insert ProfilePatient(subject)

* insert ProfilePractitioner(performer)

* code 1..1 
* code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* code ^short = "Observation code. Note that when the observation is an individual observation (singular) LOINC should be used. If, however, the Observation is a grouping (e.g. vital-signs) the code can be from SNOMED CT e.g. `122869004`. See https://fhir-ig.digital.health.nz/sdhr/Observation-ObservationVitalSignsExample.html for example"
* insert UserSelected

* component 0..*
* component.code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* component.value[x] 0..1
* component insert UserSelected