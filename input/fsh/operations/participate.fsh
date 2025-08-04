Instance: SDHRParticipateOperation
InstanceOf: OperationDefinition
Description: """
This operation allows a patient to choose to participate in the Shared Digital Health Record service.
This operation should be used by data providers in the Shared Digital Health Record ecosystem such as Patient Management Systems (PMS) or Electronic Health Record (EHR) systems.
It can be used to indicate whether the patient wishes to participate, whether any resources are withheld, and the reason for participation. The scope of this operation is the API consumer - e.g. an HPI Facility where patient data is held.

Scenarios where this operation might be used include:
- A patient has opted in to the Shared Digital Health Record service and appropriate data will be shared from the data holder to the service.
- A patient chooses not to participate in the Shared Digital Health Record service and informs their healthcare provider of this choice.
- A patient has one or more confidential records, held at their healthcare provider, that are withheld from the service.
- A patient has previously withheld records but has now released them to the Shared Digital Health Record service.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-ParametersDoNotParticipate.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for participation](./Parameters-ParametersParticipate.html) : This example shows how to indicate that a patient wishes to participate in the Shared Digital Health Record service, where previously opted out (opt-in).
- [Parameters resource for partial participation with withheld records](./Parameters-ParametersParticipateRecordWithheld.html) : This example shows how to indicate that a patient has some confidential records that are withheld from the Shared Digital Health Record service.
- [Parameters resource for releasing withheld records](./Parameters-ParametersParticipateRecordReleased.html) : This example shows how to indicate that a patient has previously withheld records but has now released them to the Shared Digital Health Record service.

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
* parameter[=].documentation = """Indicates global participation in the Shared Digital Health Record service (true/false)
If false, the patient does not wish to participate in the service and their resources will not be shared.
This parameter is mandatory when indicating global participation but is not required when indicating partial participation with withheld records (see `resourceType` and `localResourceId` parameters).
If an API consumer attempts to POST a record for a patient that has not opted in, the API will return an OperationOutcome with an error message indicating that the patient has not indicated their participation preferences.
"""

* parameter[+].name = #resourceType
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = """The resource type that is being withheld. Must be a valid FHIR resource type supported by the SDHR service, such as `Condition`, `Encounter` `Observation` etc. Note that `AllergyIntolerance` resources MUST NOT be withheld.
    This parameter is optional and should only be used to specify the type of resource that is withheld from the Shared Digital Health Record service.
    When this paramter is used the request MUST contain a `reasonCode` parameter and a `localResourceId` parameter."""

* parameter[+].name = #facilityId
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
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
    When this paramter is used the request MUST contain a `reasonCode` parameter and a `resourceType` parameter."""

* parameter[+].name = #reasonCode
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Coding
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(SDHRParticipationReasonValueSet)
* parameter[=].documentation = """The reason code for participation. This **MUST** be provided when the intent is to indicate a withheld record or when releasing a record.
Valid codes include:
- `sdhr-facility-opt-out`: Patient has opted out of participation entirely at the facility. This means that no records will be shared from that facility.
- `sdhr-facility-opt-in`: Patient has opted in to participation at the facility
- `sdhr-record-withheld`: Records withheld from the patient for privacy or confidentiality reasons.
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
- [OperationOutcome for invalid patient reference](./OperationOutcome-OperationOutcomeParticipateInvalidPatient.html)
- [OperationOutcome for missing reason code](./OperationOutcome-OperationOutcomeParticipateMissingReason.html)
- [OperationOutcome for successful participation](./OperationOutcome-OperationOutcomeParticipateSuccess.html)
Note that the following `OperationOutcome` would be returned when an API Consumer attempts to POST a record for a patient that has not provided their participation preferences:
- [OperationOutcome for participation preferences not known](./OperationOutcome-OperationOutcomeParticipatePreferencesNotKnown.html)
"""