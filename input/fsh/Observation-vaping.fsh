Alias: $nz-loinc = https://standards.digital.health.nz/ns/loinc-nz-local-code
Alias: $nzps-current-vaping-status-vs = https://nzhts.digital.health.nz/fhir/ValueSet/vaping-status
Alias: $shareablevalueset = http://hl7.org/fhir/StructureDefinition/shareablevalueset


Profile: PrimaryCareObservationVapingStatus
Parent: Observation
Description: "This profile constrains the Observation resource to represent Vaping use"
* ^version = "0.1.0"
* ^status = #active

* code = $nz-loinc#XNZ5556 "Vaping Status"
* valueCodeableConcept from $nzps-current-vaping-status-vs (required)

* extension 0..0
* modifierExtension 0..0
* contained 0..0

Instance: nzps-vaping-current-status
InstanceOf: $shareablevalueset 
Usage: #definition

* url = $nzps-current-vaping-status-vs
* version = "1.0.0"
* status = #active
* title = "Vaping Status"
* name = "VapingStatusVS"
* experimental = false
* publisher = "HISO"
* description = "ValueSet for Vaping Status based on the New Zealand vaping status reference set."
* immutable = false
* compose.include.system  =  "http://snomed.info/sct"

* compose.include.concept[0].code = #785889008
* compose.include.concept[=].display = "Currently vaping with nicotine"
* compose.include.concept[+].code = #1137692008
* compose.include.concept[=].display = "Ex-vaping for more than 1 year"
* compose.include.concept[+].code = #722499006
* compose.include.concept[=].display = "Currently vaping"
* compose.include.concept[+].code = #1137691001
* compose.include.concept[=].display = "Trying to give up vaping"
* compose.include.concept[+].code = #786063001
* compose.include.concept[=].display = "Currently vaping without nicotine"
* compose.include.concept[+].code = #1137688001
* compose.include.concept[=].display = "Ex-vaping for less than 1 year"
* compose.include.concept[+].code = #1137690000
* compose.include.concept[=].display = "Never vaped"