Instance: SDHRVerificationSamplesOperation
InstanceOf: OperationDefinition
Description: """
DRAFT OPERATION: This operation returns `AuditEvent` resources that have been sampled for verification and are still outstanding for the data viewer application.

The operation is invoked on the `AuditEvent` type using `GET /AuditEvent/$verification-samples`.

The response is a searchset `Bundle` containing slim `SDHRAuditEvent` samples. Each sample carries its local logical ID for verification submissions, the original agent array, the request correlation ID and NHI, plus the required FHIR AuditEvent envelope. Agents are retained unchanged, including their roles, requestor flags, identities and other supplied fields. The application agent has the `dataprocessor` role and identifies the Keycloak client UUID in `who.identifier` or, for source events using that representation, `who.display`. The separate healthworker agent carries the clinician’s HPI person identifier; an organisation agent may also be present. Client ownership is determined from the application agent, not from the requestor flag. Use the clinician identity, patient NHI and recorded time to assess whether the clinician had a valid reason to access that patient. NHI and correlation ID are returned as string-valued `entity.detail` entries with types `nhi` and `correlationId`; `entity.what` is omitted. FHIR R4 requires `source.observer`, so it contains only the neutral display "SDHR verification samples". Internal source-system identity, verification tags and unrelated audit content are omitted.

Samples:
- are pending verification
- are eligible for the authenticated caller
- have not already been marked as verified by the data viewer application

The operation supports optional paging parameters:
- `_count` to limit the maximum number of samples returned in a single response
- `_getpagesoffset` to skip a number of matching samples before returning results
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSamplesOperation"
* name = "VerificationSamples"
* status = #draft
* kind = #operation
* affectsState = false
* code = #verification-samples
* system = false
* type = true
* instance = false
* resource[0] = #AuditEvent

* parameter[0].name = #_count
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #integer
* parameter[=].documentation = "Optional page size. Limits the maximum number of sampled AuditEvent resources returned in the Bundle."

* parameter[+].name = #_getpagesoffset
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #integer
* parameter[=].documentation = "Optional zero-based starting offset. Skips the specified number of matching sampled AuditEvent resources before returning results."

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Bundle
* parameter[=].documentation = "Bundle of slim AuditEvent resources conforming to SDHRAuditEvent, requiring verification by the authenticated data viewer application. When paging is used, the Bundle may include paging links such as `self` and `next`."

Instance: SDHRVerificationSubmissionsOperation
InstanceOf: OperationDefinition
Description: """
DRAFT OPERATION: This operation allows the data viewer application to submit one or more verification decisions for previously issued `AuditEvent` samples.

The operation is invoked on the `AuditEvent` type using `POST /AuditEvent/$verification-submissions` with a `Parameters` resource in the request body.

Each repeating `verification` parameter identifies an `AuditEvent` sample and the verification result being submitted for that sample. A request may contain 1 to 100 `verification` parameters; requests above this limit are rejected before any decisions are processed.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSubmissionsOperation"
* name = "VerificationSubmissions"
* status = #draft
* kind = #operation
* affectsState = true
* code = #verification-submissions
* system = false
* type = true
* instance = false
* resource[0] = #AuditEvent

* inputProfile = Canonical(SDHRVerificationSubmissionParameters)
* outputProfile = Canonical(SDHRVerificationSubmissionResponseParameters)

* parameter[0].name = #verification
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "100"
* parameter[=].part[0].name = #auditEvent
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #Reference
* parameter[=].part[=].documentation = "Reference to the sampled AuditEvent being verified."
* parameter[=].part[+].name = #result
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #code
* parameter[=].part[=].binding.strength = #required
* parameter[=].part[=].binding.valueSet = Canonical(SDHRVerificationResultValueSet)
* parameter[=].part[=].documentation = "Verification result code for the sampled AuditEvent."

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Parameters
* parameter[=].documentation = "Parameters resource conforming to the SDHRVerificationSubmissionResponseParameters profile, summarising per-item processing results for the submitted verifications."
