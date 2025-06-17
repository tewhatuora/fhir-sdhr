Instance: SDHRParticipateOperation
InstanceOf: OperationDefinition
Description: """
This operation allows a patient to choose to participate in the Shared Digital Health Record service.
It can be used to indicate whether the patient wishes to participate, whether any resources are withheld, and the reason for participation.

Examples where this operation might be used include:
- A patient who chooses note to participate in the Shared Digital Health Record service and informs their healthcare provider of this choice.
- A patient who has some confidential records, held at their healthcare provider, that are withheld from the service.
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
* parameter[=].documentation = "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA "

* parameter[+].name = #participation-indicator
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #boolean
* parameter[=].documentation = """Indicates participation in the Shared Digital Health Record service (true/false)
If false, the patient does not wish to participate in the service and their resources will not be shared.
OR
The patient has some confidential records that are withheld from the service.
The `reason-code` parameter must be used to indicate the reason for withholding records or not participating."""

// * parameter[+].name = #withheld-resource-indicator
// * parameter[=].use = #in
// * parameter[=].min = 0
// * parameter[=].max = "1"
// * parameter[=].type = #boolean
// * parameter[=].documentation = "Indicates that one or more resources associated with the patient have been witheld (true/false)"

* parameter[+].name = #reason-code
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Coding
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(SDHRParticipationReasonValueSet)
* parameter[=].documentation = "The reason code for participation"

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "The result of the operation"