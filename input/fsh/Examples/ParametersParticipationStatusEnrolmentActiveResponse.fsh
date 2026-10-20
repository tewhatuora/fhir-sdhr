Instance: ParametersParticipationStatusEnrolmentActiveResponse
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content returned by the Participation Status operation when a patient is actively participating with enrolment information, including facility-level participation details for both their enrolled facility and all other facilities where they have an explicit participation record."
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
* parameter[=].valueBoolean = true
* parameter[+].name = "hasAnyRecords"
* parameter[=].valueBoolean = true
* parameter[+].name = "enrolmentInformationFound"
* parameter[=].valueBoolean = true
* parameter[+].name = "enrolmentOrgId"
* parameter[=].valueString = "GOM00001-A"
* parameter[+].name = "enrolmentFacilityId"
* parameter[=].valueString = "FZZ999-B"
* parameter[+].name = "enrolmentNHI"
* parameter[=].valueString = "ZXK9000"
* parameter[+].name = "enrolmentFacilityParticipation"
* parameter[=].part[0].name = "facilityId"
* parameter[=].part[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B)
* parameter[=].part[=].valueReference.type = "Location"
* parameter[=].part[+].name = "participationIndicator"
* parameter[=].part[=].valueBoolean = true
* parameter[+].name = "facilityParticipation"
* parameter[=].part[0].name = "facilityId"
* parameter[=].part[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B)
* parameter[=].part[=].valueReference.type = "Location"
* parameter[=].part[+].name = "participationIndicator"
* parameter[=].part[=].valueBoolean = true
* parameter[+].name = "facilityParticipation"
* parameter[=].part[0].name = "facilityId"
* parameter[=].part[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ998-C)
* parameter[=].part[=].valueReference.type = "Location"
* parameter[=].part[+].name = "participationIndicator"
* parameter[=].part[=].valueBoolean = false