Instance: SDHRHNZParticipateOperation
InstanceOf: OperationDefinition
Description: """
This operation allows a patient to choose to participate in the Shared Digital Health Record service via HNZ assisted channels.
This operation should only be used by HNZ channels.

Scenarios where this operation might be used include:
- A patient has opted in to the Shared Digital Health Record service by contacting Health NZ via appropriate digital or assisted channels.
- A patient chooses not to participate in the Shared Digital Health Record service and informs Health NZ of this choice via appropriate digital or assisted channels.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-ParametersHNZParticipateOptOut.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for participation](./Parameters-ParametersHNZParticipateOptIn.html) : This example shows how to indicate that a patient wishes to participate in the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$hnz-participate`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a Health NZ channel system on behalf of the patient, and the patient must be identified by their NHI.
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
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA"

* parameter[+].name = #hnzParticipationIndicator
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = """Indicates global participation in the Shared Digital Health Record service (true/false)
If false, the patient does not wish to participate in the service and their resources will not be shared.
"""

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
    """