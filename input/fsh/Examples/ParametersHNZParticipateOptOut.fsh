Instance: ParametersHNZParticipateOptOut
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the HNZ Participate (`$hnz-participate`) operation where a patient elects not to participate in the Shared Digital Health Record service by using an appropriate HNZ digital or assisted channel."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = false
