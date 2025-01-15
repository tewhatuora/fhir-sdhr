Profile: PrimaryCareCondition
Parent: NzCondition
Description: "Condition resource to record problems and conditions affecting a person"

* onset[x] only dateTime

* severity 0..0
* bodySite 0..0
* encounter 0..0
* abatement[x] 0..0
//* recordedDate 0..0
* severity 0..0
* encounter 0..0
//* recorder 0..0
* stage 0..0
//* evidence 0..1

* modifierExtension 0..0
* contained 0..0

* subject 1..1
* subject only Reference(Patient)
//* subject.reference 1..1 
* subject.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. E.g. https://api.hip.digital.health.nz/fhir/Patient/ZZZ0008"
* subject.type = "Patient"

* asserter 1..1
* asserter only Reference(Practitioner)
//* asserter.reference 1..1
* asserter.reference ^short = "Must be an absolute URL reference to the practitioner on the HPI system E.g. https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ"


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