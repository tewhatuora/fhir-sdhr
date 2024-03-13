Alias: $nz-loinc = https://standards.digital.health.nz/ns/loinc-nz-local-code

Profile: PrimaryCareObservationVapingStatus
Parent: Observation
Id: pc-observation-vapingstatus
//Title: "PC-Observation-Vaping-Status"
Description: "This profile constrains the Observation resource to represent Vaping use"
* ^version = "0.1.0"
* ^status = #active
//* ^url = $nzps-observation-vaping
// needs binding to SNOMED CT NZ Vaping status reference set

//* code 1..1 MS
//* code only $CodeableConcept-uv-ips


* code = $nz-loinc#XNZ5556 "Vaping Status"
//* subject 1.. MS
//* subject only Reference($nzps-patient)
//* subject.reference 1.. MS
//* effective[x] 1..1 MS
//* effective[x] only dateTime
//* effective[x].extension contains $data-absent-reason named data-absent-reason 0..1 MS
//* effective[x].extension[data-absent-reason] ^short = "effective[x] absence reason"
//* effective[x].extension[data-absent-reason] ^definition = "Provides a reason why the effectiveTime is missing."
//* valueCodeableConcept only $CodeableConcept-uv-ips
//* valueCodeableConcept from $nzps-current-vaping-status-vs (required)
//* component ..0
//* component ^mustSupport = false

* extension 0..0
* modifierExtension 0..0
* contained 0..0
