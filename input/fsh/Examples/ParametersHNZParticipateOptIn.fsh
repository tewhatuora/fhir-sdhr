Instance: ParametersHNZParticipateOptIn
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the HNZ Participate (`$hnz-participate`) operation where a patient elects to participate in the Shared Digital Health Record service by using an appropriate HNZ digital or assisted channel."
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
