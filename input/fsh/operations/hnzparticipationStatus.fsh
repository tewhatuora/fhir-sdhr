Instance: SDHRHNZParticipationStatusOperation
InstanceOf: OperationDefinition
Description: """
This internal use operation retrieves a patient's Shared Digital Health Record participation status and returns whether the patient is participating in the service, whether enrolment information was found, and whether the patient has active, archived, or any records available in the service.

For an example response payload for this operation see:
- [Parameters resource for participation status response - not participating](./Parameters-ParametersParticipationStatusResponse.html) : No consent, enrolment, or records found for the patient.
- [Parameters resource for participation status response - enrolment found, not participating](./Parameters-ParametersParticipationStatusEnrolmentResponse.html) : Enrolment information is found but the patient is not currently participating.
- [Parameters resource for participation status response - actively participating](./Parameters-ParametersParticipationStatusActiveResponse.html) : Patient is actively participating with active records at a facility.
- [Parameters resource for participation status response - actively participating with enrolment](./Parameters-ParametersParticipationStatusEnrolmentActiveResponse.html) : Patient is actively participating with enrolment information and facility-level participation details.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$hnz-participation-status`).

The operation will return a `Parameters` resource containing the patient reference and participation status indicators.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRHNZParticipationStatusOperation"
* name = "HNZParticipationStatus"
* status = #active
* kind = #operation
* code = #hnz-participation-status
* system = true
* type = false
* instance = false

* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA"

* parameter[+].name = #patient
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "The patient reference resolved for the participation status lookup."

* parameter[+].name = #consentFound
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether a consent record was found for the patient in the Shared Digital Health Record service."

* parameter[+].name = #hnzParticipationIndicator
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether the patient is currently participating in the Shared Digital Health Record service."

* parameter[+].name = #hasActiveRecords
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether the patient has active records available in the service."

* parameter[+].name = #hasArchivedRecords
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether the patient has archived records in the service."

* parameter[+].name = #hasAnyRecords
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether the patient has any records, active or archived, in the service."

* parameter[+].name = #enrolmentInformationFound
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether enrolment information was found for the patient."

* parameter[+].name = #enrolmentOrgId
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "The enrolment organisation identifier, when enrolment information is available for the patient."

* parameter[+].name = #enrolmentFacilityId
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "The enrolment facility identifier, when enrolment information is available for the patient."

* parameter[+].name = #enrolmentNHI
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "The enrolment NHI value, when enrolment information is available for the patient."

* parameter[+].name = #enrolmentFacilityParticipation
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "The facility-level participation status for facilities associated with the patient's enrolment. Only present when enrolment information is found."
* parameter[=].part[0].name = #facilityId
* parameter[=].part[=].use = #out
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #Reference
* parameter[=].part[=].documentation = "The HPI Location reference for the enrolled facility."
* parameter[=].part[+].name = #participationIndicator
* parameter[=].part[=].use = #out
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #boolean
* parameter[=].part[=].documentation = "Whether the patient is participating at this enrolled facility."

* parameter[+].name = #facilityParticipation
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "The facility-level participation status for all facilities where the patient has an explicit participation record."
* parameter[=].part[0].name = #facilityId
* parameter[=].part[=].use = #out
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #Reference
* parameter[=].part[=].documentation = "The HPI Location reference for the facility."
* parameter[=].part[+].name = #participationIndicator
* parameter[=].part[=].use = #out
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #boolean
* parameter[=].part[=].documentation = "Whether the patient is participating at this facility."
