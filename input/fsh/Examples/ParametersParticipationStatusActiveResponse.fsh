Instance: ParametersParticipationStatusActiveResponse
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content returned by the Participation Status operation when a patient is actively participating in the Shared Digital Health Record service with active records at a specific facility."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZXK9000)
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "consentFound"
* parameter[=].valueBoolean = true
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = true
* parameter[+].name = "hasActiveRecords"
* parameter[=].valueBoolean = true
* parameter[+].name = "hasArchivedRecords"
* parameter[=].valueBoolean = false
* parameter[+].name = "hasAnyRecords"
* parameter[=].valueBoolean = true
* parameter[+].name = "enrolmentInformationFound"
* parameter[=].valueBoolean = false
* parameter[+].name = "facilityParticipation"
* parameter[=].part[0].name = "facilityId"
* parameter[=].part[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B)
* parameter[=].part[=].valueReference.type = "Location"
* parameter[=].part[+].name = "participationIndicator"
* parameter[=].part[=].valueBoolean = true