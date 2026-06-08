Instance: SDHRHNZParticipationStatusOperation
InstanceOf: OperationDefinition
Description: """
This operation retrieves a patient's Shared Digital Health Record participation status.
This operation should be used by data providers in the Shared Digital Health Record ecosystem such as Patient Management Systems (PMS) or Electronic Health Record (EHR) systems.
It returns whether the patient is participating in the service, whether enrollment information was found, and whether the patient has active, archived, or any records available in the service. The scope of the status returned is the API consumer, for example an HPI Facility where patient data is held.

For an example response payload for this operation see:
- [Parameters resource for participation status response](./Parameters-ParametersParticipationStatusResponse.html) : This example shows the `Parameters` resource returned by the operation when participation status information is found for a patient.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$participation-status`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a healthcare provider on behalf of the patient, and the patient must be identified by their NHI.
The operation will return a `Parameters` resource containing the patient reference and participation status indicators.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRParticipationStatusOperation"
* name = "ParticipationStatus"
* status = #active
* kind = #operation
* code = #participation-status
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

* parameter[+].name = #enrollmentInformationFound
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether enrollment information was found for the patient."
