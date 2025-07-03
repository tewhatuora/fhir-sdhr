Instance: SDHRParticipateOperation
InstanceOf: OperationDefinition
Description: """
This operation allows a patient to choose to participate in the Shared Digital Health Record service.
It can be used to indicate whether the patient wishes to participate, whether any resources are withheld, and the reason for participation.

Examples where this operation might be used include:
- A patient who chooses not to participate in the Shared Digital Health Record service and informs their healthcare provider of this choice.
- A patient who has some confidential records, held at their healthcare provider, that are withheld from the service.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-DoNotParticipateParameters.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for partial participation with withheld records](./Parameters-RecordWithheldParticipateParameters.html) : This example shows how to indicate that a patient has some confidential records that are withheld from the Shared Digital Health Record service.
- [Parameters resource for releasing withheld records](./Parameters-RecordReleasedParticipateParameters.html) : This example shows how to indicate that a patient has previously withheld records but has now released them to the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$participate`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a healthcare provider on behalf of the patient, and the patient must be identified by their NHI.
The operation will return an OperationOutcome resource indicating the result of the operation.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRParticipateOperation"
* name = "Participate"
* status = #active
* kind = #operation
* code = #participate
* system = true
* type = false
* instance = false

* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA"

* parameter[+].name = #participationIndicator
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = """Indicates participation in the Shared Digital Health Record service (true/false)
If false, the patient does not wish to participate in the service and their resources will not be shared.
OR
The patient has some confidential records that are withheld from the service.
The `reasonCode` parameter must be used to indicate the reason for withholding records or not participating."""

* parameter[+].name = #resourceType
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = """The resource type that is being withheld. Must be a valid FHIR resource type supported by the SDHR service, such as `AllergyIntolerance`, `Condition`, etc.
    This parameter is optional and should only be used to specify the type of resource that is withheld from the Shared Digital Health Record service.
    This parameter MUST be used when the `reasonCode` is `sdhr-record-withheld` to indicate which resources are withheld."""

* parameter[+].name = #facilityId
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = """The HPI Facility ID of the healthcare provider that is withholding the resource.
    This parameter is mandatory and must be provided to indicate the healthcare provider that is withholding the resource from the Shared Digital Health Record service.
    The HPI Facility ID must be a valid HPI Facility ID in the format `https://api.hip.digital.health.nz/fhir/hpi/v1/Location/{hpi-facility-id}`."""

* parameter[+].name = #localResourceId
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = """The local resource ID that is withheld from the Shared Digital Health Record service.
    This parameter is optional and should only be used to specify the local ID of the resource that is withheld.
    This parameter MUST be used when the `reasonCode` is `sdhr-record-withheld` to indicate which specific resource is withheld."""

* parameter[+].name = #reasonCode
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Coding
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(SDHRParticipationReasonValueSet)
* parameter[=].documentation = """The reason code for participation. This **MUST** be provided when the `participation-indicator` is false.
It indicates the reason for withholding records or not participating in the Shared Digital Health Record service.
Valid codes include:
- `sdhr-record-withheld`: Records withheld from the patient for privacy or confidentiality reasons.
- `sdhr-participation`: Patient participation preference for the Shared Digital Health Record service. In conjunction with `participationIndicator` set to false, this indicates that the patient does not wish to participate in the service. If the `participationIndicator` is true, this code indicates that the patient is participating in the service.
- `sdhr-record-released`: Record that was previously withheld has been released (is no longer confidential or restricted) to the service by the patient."""

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
- [OperationOutcome for invalid patient reference](./OperationOutcome-ParticipateInvalidPatientOutcome.html)
- [OperationOutcome for missing reason code](./OperationOutcome-ParticipateMissingReasonOutcome.html)
- [OperationOutcome for successful participation](./OperationOutcome-ParticipateSuccessOutcome.html)"""