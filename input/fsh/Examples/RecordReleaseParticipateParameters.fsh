Instance: RecordReleasedParticipateParameters
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the Participate operation where a patient has individual records that are withheld - e.g. records marked as `Confidential`."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "participationIndicator"
* parameter[=].valueBoolean = true
* parameter[+].name = "resourceType"
* parameter[=].valueString = "Condition"
* parameter[+].name = "localResourceId"
* parameter[=].valueString = "12345AAABBBccc"
* parameter[+].name = "reasonCode"
* parameter[=].valueCodeableConcept = $sdhr-participation-reason#sdhr-record-released "Record released"