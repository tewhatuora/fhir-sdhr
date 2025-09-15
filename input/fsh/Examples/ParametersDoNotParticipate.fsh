Instance: ParametersDoNotParticipate
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the Participate operation where a patient does not wish to participate in the Shared Digital Health Record service."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "facilityId"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A)
* parameter[+].name = "participationIndicator"
* parameter[=].valueBoolean = false