
Profile: SDHRObservation
Parent: Observation
Description: "This profile constrains the Observation resource to represent Tobacco use assessment."
* ^version = "0.1.0"
* ^status = #active

* meta.profile 1..1

* meta.source 1..1
* meta insert MetaSource

* insert LocalIdentifierDocs

* insert ProfilePatient(subject)

* insert ProfilePractitioner(performer)

* code 1..1 
* code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* code ^short = "Observation code. Note that when the observation is an individual observation (singular) LOINC should be used. If, however, the Observation is a grouping (e.g. vital-signs) the code can be from SNOMED CT e.g. `122869004`. See https://fhir-ig.digital.health.nz/sdhr/Observation-ObservationVitalSignsExample.html for example"
* insert UserSelected

// * code 1..1
// * code ^slicing.discriminator.type = #pattern
// * code ^slicing.discriminator.path = "coding.system"
// * code ^slicing.rules = #open
// * code contains IndividualObservation 1..1 and ObservationCollection 1..1
// * insert UserSelected

// * code[IndividualObservation].coding from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
// * code[IndividualObservation] ^short = "Code for individual observations."
// * code[IndividualObservation] ^definition = "This code is used for individual observations, such as a single tobacco use assessment."

// * code[ObservationCollection].coding[0].system = "http://snomed.info/sct" (exactly)
// * code[ObservationCollection].coding[0].code = "122869004" (exactly)
// * code[ObservationCollection].coding[0].display = "Measurement procedure (procedure)" (exactly)
// * code[ObservationCollection] ^short = "Code for observation collections."
// * code[ObservationCollection] ^definition = "This code is used for collections of observations, such as vital signs."

* component 0..*
* component.code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* component.value[x] 0..1
* component insert UserSelected