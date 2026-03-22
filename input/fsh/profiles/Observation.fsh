
Profile: SDHRObservation
Parent: Observation
Description: "A Shared Digital Health Record Observation."
* ^version = "0.1.0"
* ^status = #active

* meta 1..1
* meta.profile 1..1
* meta insert MetaSource
* meta insert MetaTag

* insert LocalIdentifierDocs

* extension contains
  hnz-sdhr-client-last-updated-extension named ClientLastUpdated 1..1

* modifierExtension 0..0
* contained 0..0

* insert ProfilePatient(subject)
* subject ^short = "National Health Identifier for the health consumer"
* subject ^definition = "National Health Identifier for the health consumer"

//* insert ProfilePractitioner(performer)

* performer ^short = "Preferred - an HPI Practitioner URL with format https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/11AAAA"


* code 1..1 
* code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* code ^short = "Observation code. Note that when the observation is an individual observation (singular) LOINC should be used. If, however, the Observation is a grouping (e.g. vital-signs) the code can be from SNOMED CT e.g. `122869004`. See https://fhir-ig.digital.health.nz/sdhr/Observation-ObservationVitalSignsExample.html for example"
* insert UserSelected
* effective[x] 1..1
* effective[x] ^short = "Date and time/time-period the measurement was obtained"
* effective[x] ^definition = "Date and time/time-period the measurement was obtained"
* bodySite ^short = "Code for the body site affected by the problem (if applicable)"
* bodySite ^definition = "Code for the body site affected by the problem (if applicable)"
* component 0..*
* component.code from http://hl7.org/fhir/ValueSet/observation-codes (preferred)
* component.value[x] 0..1
* component insert UserSelected
