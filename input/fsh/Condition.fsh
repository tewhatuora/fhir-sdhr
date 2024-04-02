Profile: PrimaryCareCondition
Parent: Condition
Description: "Condition resource to record problems and conditions affecting a person"

* onset[x] only dateTime

* severity 0..0
* bodySite 0..0
* encounter 0..0
* abatement[x] 0..0
* recordedDate 0..0
* severity 0..0
* encounter 0..0
* recorder 0..0
* stage 0..0
* evidence 0..0

* extension 0..0
* modifierExtension 0..0
* contained 0..0

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Health Record Key - unique persistent identifier for this clinical FHIR resource"

* identifier contains HealthRecordKey 0..1 MS

* identifier[HealthRecordKey].system = "https://standards.digital.health.nz/ns/health-record-key-id" (exactly)
//* identifier[HealthRecordKey].use = #offical (exactly)
//* identifier[HealthRecordKey].use ^short = "fixed to official"
* identifier[HealthRecordKey] ^short = "Health Record Key - unique persistent identifier for this clinical FHIR resource"
* identifier[HealthRecordKey] ^definition = "This identifier should be created for each resource at the time of sending to the central repository and persisted by source systems against their view of the information. This allows a unique identifier for  "