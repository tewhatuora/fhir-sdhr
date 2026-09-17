Instance: ParametersParticipationStatusNotParticipatingResponse
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content returned by the Participation Status operation when the patient is not participating in the Shared Digital Health Record service."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZXK9000)
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = false
