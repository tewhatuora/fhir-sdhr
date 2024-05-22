Profile: PrimaryCareObservationVapingStatus
Parent: https://standards.digital.health.nz/fhir/StructureDefinition/nzps-observation-vaping-status
Description: "This profile constrains the Observation resource to represent Vaping use"
* ^version = "0.1.0"
* ^status = #active

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