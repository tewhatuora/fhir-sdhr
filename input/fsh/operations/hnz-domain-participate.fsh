Instance: SDHRHNZDomainParticipateOperation
InstanceOf: OperationDefinition
Description: """
Records a patient's participation choices for individual SDHR domains through authorised Health NZ channels.
POST a FHIR `Parameters` resource to `https://api.sdhr.digital.health.nz/s2s/$hnz-domain-participate`.
The required SMART on FHIR scope is `https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRHNZDomainParticipateOperation`.

The request MUST contain exactly one `patient` NHI reference and one or more `domainParticipation` groups.
Each group MUST contain exactly one `domain` valueCode (`SDHRMedications` or `SDHRImmunisations`) and exactly one `hnzParticipationIndicator` valueBoolean.
Domains MUST be unique within the request. No other top-level parameters or group parts are supported.
In particular, top-level `hnzParticipationIndicator`, `hnzOptOutReasonCode`, `facilityId`, and `pmsIdentifier` are not supported.

The operation synchronously and idempotently updates only the supplied domain consent choices. Omitted domains are unchanged.
It does not change global or facility participation, archive or restore resources, or trigger a historic load.
A global opt-off continues to deny access, even when a domain participation indicator is true.
This operation MUST NOT be included in a batch Bundle.
The response is an `OperationOutcome`, not a `Parameters` resource.

Example requests:
- [Domain opt-in](./Parameters-ParametersHNZDomainParticipateOptIn.html)
- [Domain opt-out](./Parameters-ParametersHNZDomainParticipateOptOut.html)
- [Multiple domain choices](./Parameters-ParametersHNZDomainParticipateMultiple.html)
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRHNZDomainParticipateOperation"
* name = "HNZDomainParticipate"
* status = #active
* kind = #operation
* code = #hnz-domain-participate
* affectsState = true
* system = true
* type = false
* instance = false

* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "Exactly one NHI Patient reference: https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ11AA. Linked-group requests are not supported."

* parameter[+].name = #domainParticipation
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "Repeat once per domain to update. Domains must be unique. Each group contains only domain and hnzParticipationIndicator parts."
* parameter[=].part[0].name = #domain
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #code
* parameter[=].part[=].binding.strength = #required
* parameter[=].part[=].binding.valueSet = Canonical(SDHRDomainValueSet)
* parameter[=].part[=].documentation = "The SDHR domain: SDHRMedications or SDHRImmunisations. A domain must not appear in more than one group."
* parameter[=].part[+].name = #hnzParticipationIndicator
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #boolean
* parameter[=].part[=].documentation = "True permits participation in this domain; false denies it. A true value does not override a global opt-off."

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "An OperationOutcome returned directly in the response body after synchronous processing, indicating success or failure. See the successful participation and invalid patient reference OperationOutcome examples."