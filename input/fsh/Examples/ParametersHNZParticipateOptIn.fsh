Instance: ParametersHNZParticipateOptIn
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the HNZ Participate (`$hnz-participate`) operation where a patient elects to participate in the Shared Digital Health Record service by using an appropriate HNZ digital or assisted channel. A historic load is scheduled from the supplied facility only when the patient is already opted in at that facility; when it is scheduled the response includes the sdhr-historic-load-scheduled informational outcome."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "facilityId"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B)
* parameter[+].name = "pmsIdentifier"
* parameter[=].valueString = "Medtech"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = true
// * parameter[+].name = "reasonCode"
// * parameter[=].valueCodeableConcept = $sdhr-participation-reason#sdhr-hnz-opt-in "HNZ opt in"
