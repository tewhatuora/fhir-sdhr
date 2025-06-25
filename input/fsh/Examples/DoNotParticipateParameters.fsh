Instance: DoNotParticipateParameters
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the Participate operation where a patient does not wish to participate in the Shared Digital Health Record service."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "participationIndicator"
* parameter[=].valueBoolean = false
* parameter[+].name = "reasonCode"
* parameter[=].valueCodeableConcept = $sdhr-participation-reason#sdhr-do-not-participate "Do not participate"