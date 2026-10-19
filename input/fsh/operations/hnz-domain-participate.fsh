Instance: SDHRHNZDomainParticipateOperation
InstanceOf: OperationDefinition
Description: """
Records independent domain participation choices for one patient through authorised Health NZ channels.
POST a FHIR `Parameters` resource to `https://api.sdhr.digital.health.nz/s2s/$hnz-domain-participate` with exactly one `patient` parameter and exactly one `domains` parameter. The `domains` parameter contains one or more named boolean parts: `SDHRMedications` and/or `SDHRImmunisations`. Each domain may occur only once. A single-domain update uses the same structure with one part.

`true` records an explicit permit and `false` records a deny. Omitted domains retain their existing choices; a domain without a recorded choice defaults to In. MedicationRequest and MedicationDispense share the Medications choice. Immunisations are controlled independently.

Only the requested patient's Consent is updated. Consents for linked NHIs remain unchanged. For access, a deny on any linked NHI denies that domain for the entire linked group. Opting one patient back in cannot override another linked patient's deny. A global opt-out continues to take precedence over domain permits.

This operation does not change global or facility participation, archive or restore resources, trigger a historic load, or update participation in an upstream national system. Global participation remains managed through `$hnz-participate`. Global participation indicators, facility parameters, repeated patients, the singular `domain` parameter and repeated `domainParticipation` groups are not accepted by this operation.

The operation is idempotent and returns an OperationOutcome. See [one-domain update](./Parameters-ParametersHNZDomainOptOff.html) and [multiple-domain update](./Parameters-ParametersHNZDomainChoices.html).
"""
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRHNZDomainParticipateOperation"
* name = "HNZDomainParticipate"
* status = #active
* kind = #operation
* code = #hnz-domain-participate
* system = true
* type = false
* instance = false

* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Reference
* parameter[=].documentation = "NHI Patient reference in the form https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA. Updates this patient's Consent only."

* parameter[+].name = #domains
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "One or both named boolean parts must be supplied. Omitted domains are unchanged. Duplicate domain names are invalid."
* parameter[=].part[0].name = #SDHRMedications
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 0
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #boolean
* parameter[=].part[=].documentation = "True permits and false denies MedicationRequest and MedicationDispense access, subject to linked-group and global denials."
* parameter[=].part[+].name = #SDHRImmunisations
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 0
* parameter[=].part[=].max = "1"
* parameter[=].part[=].type = #boolean
* parameter[=].part[=].documentation = "True permits and false denies Immunization access, subject to linked-group and global denials."

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "OperationOutcome indicating success or the reason the request was rejected."
