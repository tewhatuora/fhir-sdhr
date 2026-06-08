Instance: ParametersParticipationStatusEnrollmentResponse
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content returned by the Participation Status operation when participation enrollment details are found for a patient."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZXK9000)
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = false
* parameter[+].name = "hasActiveRecords"
* parameter[=].valueBoolean = false
* parameter[+].name = "hasArchivedRecords"
* parameter[=].valueBoolean = false
* parameter[+].name = "hasAnyRecords"
* parameter[=].valueBoolean = false
* parameter[+].name = "enrollmentInformationFound"
* parameter[=].valueBoolean = true
* parameter[+].name = "enrollmentOrgId"
* parameter[=].valueString = "ORG123"
* parameter[+].name = "enrollmentFacilityId"
* parameter[=].valueString = "FAC456"
* parameter[+].name = "enrollmentNHI"
* parameter[=].valueString = "ZXK9000"