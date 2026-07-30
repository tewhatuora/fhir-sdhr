Instance: SDHRParticipationStatusOperation
InstanceOf: OperationDefinition
Description: """
This operation allows Shared Electronic Health Record (SEHR) systems to retrieve a patient's Shared Digital Health Record participation status.

For example response payloads for this operation see:
- [Parameters resource for participation status response - not participating](./Parameters-ParametersParticipationStatusNotParticipatingResponse.html) : This example shows the `Parameters` resource returned when the patient is not participating in the Shared Digital Health Record service.
- [Parameters resource for participation status response - participating](./Parameters-ParametersParticipationStatusParticipatingResponse.html) : This example shows the `Parameters` resource returned when the patient is participating in the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$participation-status`).

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

* parameter[+].name = #hnzParticipationIndicator
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = "Indicates whether the patient is currently participating in the Shared Digital Health Record service."
