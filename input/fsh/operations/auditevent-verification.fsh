Instance: SDHRVerificationSamplesOperation
InstanceOf: OperationDefinition
Description: """
This operation returns `AuditEvent` resources that have been sampled for verification and are still outstanding for the data viewer application.

The operation is invoked on the `AuditEvent` type using `GET /AuditEvent/$verification-samples`.

The response is a `Bundle` containing sampled `AuditEvent` resources that:
- are pending verification
- are eligible for the authenticated caller
- have not already been marked as verified by the data viewer application

The operation does not require any input parameters.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSamplesOperation"
* name = "VerificationSamples"
* status = #draft
* kind = #operation
* code = #verification-samples
* system = false
* type = true
* instance = false
* resource[0] = #AuditEvent

* parameter[0].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Bundle
* parameter[=].documentation = "Bundle of sampled AuditEvent resources requiring verification by the authenticated data viewer application."

Instance: SDHRVerificationSubmissionsOperation
InstanceOf: OperationDefinition
Description: """
This operation allows the data viewer application to submit one or more verification decisions for previously issued `AuditEvent` samples.

The operation is invoked on the `AuditEvent` type using `POST /AuditEvent/$verification-submissions` with a `Parameters` resource in the request body.

Each repeating `verification` parameter identifies an `AuditEvent` sample and the verification result being submitted for that sample.
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRVerificationSubmissionsOperation"
* name = "VerificationSubmissions"
* status = #draft
* kind = #operation
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
* parameter[=].max = "*"
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
