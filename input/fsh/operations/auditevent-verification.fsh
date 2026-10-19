Instance: SDHRVerificationSamplesOperation
InstanceOf: OperationDefinition
Description: """
DRAFT OPERATION: This operation returns `AuditEvent` resources that have been sampled for verification and are still outstanding for the data viewer application.

The operation is invoked on the `AuditEvent` type using `GET /AuditEvent/$verification-samples`.

Sampling runs independently of this retrieval operation.

A successful response is always a searchset `Bundle` containing slim `SDHRAuditEvent` samples. Each sample carries its local logical ID for verification submissions, the original agent array, the available request correlation ID and NHI details, plus the required FHIR AuditEvent envelope. Agents are retained unchanged, including their roles, requestor flags, identities and other supplied fields. The application agent has the `dataprocessor` role and identifies the Keycloak client UUID in `who.identifier` or, for source events using that representation, `who.display`. The separate healthworker agent carries the clinician’s HPI person identifier; an organisation agent may also be present. Client ownership is determined from the application agent, not from the requestor flag. Use the clinician identity, patient NHI and recorded time to assess whether the clinician had a valid reason to access that patient. NHI and correlation ID are returned as string-valued `entity.detail` entries with types `nhi` and `correlationId`; `entity.what` is omitted. FHIR R4 requires `source.observer`, so it contains only the neutral display "SDHR verification samples". Internal source-system identity, verification tags and unrelated audit content are omitted.

Samples:
- are pending verification
- belong to the authenticated `client_id`
- have not already been marked as verified by the data viewer application

The operation supports optional paging parameters:
- `_count` to limit the maximum number of samples returned in a single response
- `_getpagesoffset` to skip a number of matching samples before returning results

Only these paging parameters are forwarded to the sample search. The server fixes the client and pending-verification filters. Follow the returned paging links, which point back to this operation; links may be relative in the development environment. An empty searchset Bundle means no pending samples are currently available.

The required operation scope is `https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSamplesOperation`. Generic AuditEvent read, search and write routes are unavailable.
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
* parameter[=].documentation = "A searchset Bundle of slim AuditEvent resources conforming to SDHRAuditEvent for the authenticated client, including an empty Bundle when no samples are pending. Bundle paging links return to this operation."

Instance: SDHRVerificationSubmissionsOperation
InstanceOf: OperationDefinition
Description: """
DRAFT OPERATION: This operation allows the data viewer application to submit one or more verification decisions for previously issued `AuditEvent` samples.

The operation is invoked on the `AuditEvent` type using `POST /AuditEvent/$verification-submissions` with a `Parameters` resource in the request body.

Each repeating `verification` parameter identifies an `AuditEvent` sample and the verification result being submitted for that sample. A request may contain 1 to 100 `verification` parameters; requests above this limit are rejected before any decisions are processed.

The required operation scope is `https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSubmissionsOperation`. References may be relative (`AuditEvent/{id}`) or absolute HTTP(S) URLs ending in `/AuditEvent/{id}`; the logical ID identifies a local sample. Versioned references, query strings and fragments are not accepted.

Each item is processed independently, in request order. Accepted result codes are `validated` and `validation-failed`; both mark a pending sample as verified and remove it from subsequent sample responses. The response contains one `verificationSubmissionResult` per submitted verification, with the submitted reference and one status:
- `processed`: the decision was saved
- `invalid`: the reference or result is missing or invalid
- `not-found`: no local sample is available to the authenticated client
- `already-processed`: the sample decision was already processed; the saved decision is unchanged
- `error`: persistence failed for this item

A failure for one item does not stop the remaining items. An invalid Parameters envelope, no verification items, or more than 100 verification items causes a request-level error.
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
* parameter[=].part[=].documentation = "Relative AuditEvent/{id} reference or absolute HTTP(S) URL ending in /AuditEvent/{id}. The ID identifies a local sample; versioned references, query strings and fragments are not supported."
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
