Profile: SDHREncounter
Parent: Encounter
Description: "Encounter resource to record an instance of an interaction between patient and healthcare provider"

* statusHistory 0..0
* classHistory 0..0
//* type 0..0
* episodeOfCare 0..0
* basedOn 0..0
* appointment 0..0
* length 0..0
//* reasonCode 0..0
* reasonReference 0..0 
//* diagnosis 0..0
* account 0..0
* hospitalization 0..0
//* location 0..0
* serviceProvider 0..0
* partOf

* extension 0..0
* modifierExtension 0..0
* contained 0..0

* subject 1..1
* subject only Reference(Patient)
//* subject.reference 1..1 
* subject.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. E.g. https://api.hip.digital.health.nz/fhir/Patient/ZZZ0008"
* subject.type = "Patient"

* participant.individual only Reference(Practitioner)
* participant.individual ^short = "Must be an absolute URL reference to the practitioner on the HPI system E.g. https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ"


* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Health Record Key - unique persistent identifier for this clinical FHIR resource"

* identifier contains HealthRecordKey 0..1 MS

* identifier[HealthRecordKey].system = "https://standards.digital.health.nz/ns/health-record-key-id" (exactly)
* identifier[HealthRecordKey].use = #offical (exactly)
* identifier[HealthRecordKey].use ^short = "fixed to official"
* identifier[HealthRecordKey] ^short = "Health Record Key - unique persistent identifier for this clinical FHIR resource"
* identifier[HealthRecordKey] ^definition = "This identifier should be created for each resource at the time of sending to the central repository and persisted by source systems against their view of the information. This allows a unique identifier for updates and tracking of the resource independent of the resource id and between systems"