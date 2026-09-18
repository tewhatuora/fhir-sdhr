Instance: ParametersParticipationStatusRequest
InstanceOf: Parameters
Usage: #example
Description: "Example Parameters resource to POST to the Participation Status operation."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZQW5496)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
