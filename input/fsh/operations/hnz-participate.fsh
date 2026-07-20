Instance: SDHRHNZParticipateOperation
InstanceOf: OperationDefinition
Description: """
This operation allows a patient to choose to participate in the Shared Digital Health Record service via HNZ assisted channels.
This operation should only be used by HNZ channels.

Scenarios where this operation might be used include:
- A patient has opted in to the Shared Digital Health Record service by contacting Health NZ via appropriate digital or assisted channels.
- A linked group of patients has opted in to the Shared Digital Health Record service by contacting Health NZ via appropriate digital or assisted channels.
- A patient chooses not to participate in the Shared Digital Health Record service and informs Health NZ of this choice via appropriate digital or assisted channels.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-ParametersHNZParticipateOptOut.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for participation](./Parameters-ParametersHNZParticipateOptIn.html) : This example shows how to indicate that a patient wishes to participate in the Shared Digital Health Record service.
- [Parameters resource for linked group participation](./Parameters-ParametersHNZParticipateLinkedGroupOptIn.html) : This example shows how to indicate that all patients in a linked NHI group wish to participate in the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$hnz-participate`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a Health NZ channel system on behalf of the patient, and the patient must be identified by their NHI. For a global opt-in request, one or more `patient` parameters may be supplied. Multiple `patient` parameters are only supported when all supplied NHIs are already linked in the same NHI group and the request supplies the complete linked group. Multiple `patient` parameters are not supported for global opt-out requests.
For a global opt-in request where the patient is enrolled with a provider, the request may include the enrolled provider `facilityId` and must include `pmsIdentifier`. When `facilityId` is provided, the service verifies that the patient's existing Consent explicitly permits participation at that facility before updating global participation or scheduling a historic load. The operation does not create or change facility-level participation. If facility participation is unknown or denied, the operation fails and no load is scheduled. If `facilityId` is not provided, `pmsIdentifier` must not be provided and the operation updates consent without triggering a historic load.
When historic-load work is successfully scheduled, the returned OperationOutcome includes an additional `sdhr-historic-load-scheduled` informational issue. This confirms scheduling only; it does not indicate that the load has completed successfully.
The operation will return an OperationOutcome resource indicating the result of the operation.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRHNZParticipateOperation"
* name = "HNZParticipate"
* status = #active
* kind = #operation
* code = #hnz-participate
* system = true
* type = false
* instance = false

* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].type = #Reference
* parameter[=].documentation = "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA. For global opt-in, repeat this parameter to opt in the complete linked NHI group. For global opt-out, exactly one patient parameter is supported."

* parameter[+].name = #hnzParticipationIndicator
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = """Indicates global participation in the Shared Digital Health Record service (true/false)
If false, the patient does not wish to participate in the service and their resources will not be shared.
"""

* parameter[+].name = #facilityId
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "Optional for global opt-in. Reference must be an HPI Location URL for the enrolled provider, with format https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B. If provided, pmsIdentifier is required and the patient's existing Consent must explicitly permit participation at this facility. This operation does not create or alter facility-level participation. Not supported for global opt-out."

* parameter[+].name = #pmsIdentifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "Required when facilityId is provided, otherwise omitted. Must identify the PMS historic load method. Supported values are Medtech, Indici, and MyPractice. Not supported for global opt-out."

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = """The result of the operation.
    This parameter will contain an OperationOutcome resource indicating the success or failure of the operation.
    If the operation is successful, the OperationOutcome will contain a success message.
    If the operation fails, the OperationOutcome will contain an error message indicating the reason for the failure.
    The OperationOutcome resource will be returned in the response body of the operation request.
    See the following examples for possible OperationOutcome responses:
    - [OperationOutcome for invalid patient reference](./OperationOutcome-OperationOutcomeParticipateInvalidPatient.html)
    - [OperationOutcome for successful participation](./OperationOutcome-OperationOutcomeParticipateSuccess.html)
    - [OperationOutcome for successful participation with a historic load scheduled](./OperationOutcome-OperationOutcomeParticipateLoadScheduled.html)
    """
