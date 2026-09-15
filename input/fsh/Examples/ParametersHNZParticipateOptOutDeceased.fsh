Instance: ParametersHNZParticipateOptOutDeceased
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the HNZ Participate (`$hnz-participate`) operation where global opt-out is recorded because the patient is deceased."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = false
* parameter[+].name = "hnzOptOutReasonCode"
* parameter[=].valueCodeableConcept.coding[0].system = "https://fhir-ig.digital.health.nz/sdhr/CodeSystem/hnz-global-opt-out-reason"
* parameter[=].valueCodeableConcept.coding[0].code = #patient-deceased
* parameter[=].valueCodeableConcept.coding[0].display = "Patient deceased"
