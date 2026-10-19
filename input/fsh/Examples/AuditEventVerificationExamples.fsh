Instance: AuditEventVerificationSampleOne
InstanceOf: SDHRAuditEvent
Usage: #example
Description: "DRAFT EXAMPLE ONLY: sampled AuditEvent returned for verification."
* id = "b3f9de58-2da4-427c-a39c-07147eac3615"
* type.system = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* type.code = #rest
* recorded = "2026-07-03T09:15:00+12:00"
* agent[0].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[0].role[0].coding[0].code = #dataprocessor
* agent[0].requestor = false
* agent[0].who.identifier.system = "https://api.auth.digital.health.nz/realms/hnz-integration/clients"
* agent[0].who.identifier.value = "2b628d46-bdad-4f91-a3b0-c26e058c7d24"
* agent[1].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[1].role[0].coding[0].code = #PROV
* agent[1].requestor = true
* agent[1].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* agent[1].who.identifier.value = "99ZZFX"
* agent[2].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[2].role[0].coding[0].code = #PROV
* agent[2].requestor = false
* agent[2].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* agent[2].who.identifier.value = "GZZ999"
* entity[0].detail[0].type = "nhi"
* entity[=].detail[=].valueString = "ZZZ0004"
* entity[=].detail[+].type = "correlationId"
* entity[=].detail[=].valueString = "c500dae6-ac65-4e4f-a4c1-5aa222a6a807"
* source.observer.display = "SDHR verification samples"

Instance: AuditEventVerificationSampleTwo
InstanceOf: SDHRAuditEvent
Usage: #example
Description: "Sampled AuditEvent returned for verification."
* id = "6ebffb1a-61a1-4646-857e-51d4153b698d"
* type.system = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* type.code = #rest
* recorded = "2026-07-03T09:20:00+12:00"
* agent[0].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[0].role[0].coding[0].code = #dataprocessor
* agent[0].requestor = false
* agent[0].who.identifier.system = "https://api.auth.digital.health.nz/realms/hnz-integration/clients"
* agent[0].who.identifier.value = "2b628d46-bdad-4f91-a3b0-c26e058c7d24"
* agent[1].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[1].role[0].coding[0].code = #PROV
* agent[1].requestor = true
* agent[1].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* agent[1].who.identifier.value = "99ZZFX"
* agent[2].role[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[2].role[0].coding[0].code = #PROV
* agent[2].requestor = false
* agent[2].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* agent[2].who.identifier.value = "GZZ999"
* entity[0].detail[0].type = "nhi"
* entity[=].detail[=].valueString = "ZZZ0004"
* entity[=].detail[+].type = "correlationId"
* entity[=].detail[=].valueString = "c500dae6-ac65-4e4f-a4c1-5aa222a6a807"
* source.observer.display = "SDHR verification samples"

Instance: BundleVerificationSamplesResponseExample
InstanceOf: Bundle
Usage: #example
Description: "Bundle returned from the verification samples operation."
* type = #searchset
* timestamp = "2026-07-03T10:00:00+12:00"
* total = 2
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples"
* entry[0].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* entry[=].resource = AuditEventVerificationSampleOne
* entry[+].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* entry[=].resource = AuditEventVerificationSampleTwo

Instance: BundleVerificationSamplesPageOneResponseExample
InstanceOf: Bundle
Usage: #example
Description: "DRAFT EXAMPLE ONLY: first page Bundle returned from the verification samples operation using _count and _getpagesoffset."
* type = #searchset
* timestamp = "2026-07-03T10:00:00+12:00"
* total = 2
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_getpagesoffset=0"
* link[+].relation = "next"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_getpagesoffset=1"
* entry[0].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* entry[=].resource = AuditEventVerificationSampleOne

Instance: BundleVerificationSamplesPageTwoResponseExample
InstanceOf: Bundle
Usage: #example
Description: "Second page Bundle returned from the verification samples operation using _count and _getpagesoffset."
* type = #searchset
* timestamp = "2026-07-03T10:00:05+12:00"
* total = 2
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_getpagesoffset=1"
* entry[0].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* entry[=].resource = AuditEventVerificationSampleTwo

Instance: ParametersVerificationSubmissionRequestExample
InstanceOf: SDHRVerificationSubmissionParameters
Usage: #example
Description: "Parameters payload posted to the verification submissions operation."
* parameter[verification][0].name = "verification"
* parameter[verification][0].part[auditEvent].name = "auditEvent"
* parameter[verification][0].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* parameter[verification][0].part[result].name = "result"
* parameter[verification][0].part[result].valueCode = #validated
* parameter[verification][1].name = "verification"
* parameter[verification][1].part[auditEvent].name = "auditEvent"
* parameter[verification][1].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* parameter[verification][1].part[result].name = "result"
* parameter[verification][1].part[result].valueCode = #validation-failed

Instance: ParametersVerificationSubmissionResponseExample
InstanceOf: SDHRVerificationSubmissionResponseParameters
Usage: #example
Description: "Parameters response returned from the verification submissions operation."
* parameter[verificationSubmissionResult][0].name = "verificationSubmissionResult"
* parameter[verificationSubmissionResult][0].part[auditEvent].name = "auditEvent"
* parameter[verificationSubmissionResult][0].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* parameter[verificationSubmissionResult][0].part[status].name = "status"
* parameter[verificationSubmissionResult][0].part[status].valueCode = #processed
* parameter[verificationSubmissionResult][1].name = "verificationSubmissionResult"
* parameter[verificationSubmissionResult][1].part[auditEvent].name = "auditEvent"
* parameter[verificationSubmissionResult][1].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* parameter[verificationSubmissionResult][1].part[status].name = "status"
* parameter[verificationSubmissionResult][1].part[status].valueCode = #processed

Instance: BundleVerificationSamplesEmptyResponseExample
InstanceOf: Bundle
Usage: #example
Description: "Search Bundle returned for the authenticated client when no samples are pending verification."
* type = #searchset
* timestamp = "2026-07-03T10:05:00+12:00"
* total = 0
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples"

Instance: ParametersVerificationSubmissionRepeatedResponseExample
InstanceOf: SDHRVerificationSubmissionResponseParameters
Usage: #example
Description: "Response when the submission request example is repeated after both decisions have been processed. Each reference is echoed unchanged and each sample returns already-processed, including the sample whose result was validation-failed. The saved decisions are unchanged."
* parameter[verificationSubmissionResult][0].name = "verificationSubmissionResult"
* parameter[verificationSubmissionResult][0].part[auditEvent].name = "auditEvent"
* parameter[verificationSubmissionResult][0].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* parameter[verificationSubmissionResult][0].part[status].name = "status"
* parameter[verificationSubmissionResult][0].part[status].valueCode = #already-processed
* parameter[verificationSubmissionResult][1].name = "verificationSubmissionResult"
* parameter[verificationSubmissionResult][1].part[auditEvent].name = "auditEvent"
* parameter[verificationSubmissionResult][1].part[auditEvent].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* parameter[verificationSubmissionResult][1].part[status].name = "status"
* parameter[verificationSubmissionResult][1].part[status].valueCode = #already-processed
