Instance: AuditEventVerificationSampleOne
InstanceOf: SDHRAuditEvent
Usage: #example
Description: "DRAFT EXAMPLE ONLY: sampled AuditEvent returned for verification."
* id = "b3f9de58-2da4-427c-a39c-07147eac3615"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype[0] = http://hl7.org/fhir/restful-interaction#read "read"
* action = #R
* outcome = #0
* outcomeDesc = "Successful access sample returned for verification workflow."
* recorded = "2026-07-03T09:15:00+12:00"
* agent[0].requestor = true
* agent[=].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* agent[=].who.identifier.value = "1234"
* entity[0].what.identifier.system = "https://standards.digital.health.nz/ns/nhi"
* entity[=].what.identifier.value = "ZKC7284"
* entity[+].what = Reference(Condition/ConditionRespiratoryExample)
* entity[=].detail[+].type = "correlationId"
* entity[=].detail[=].valueString = "c500dae6-ac65-4e4f-a4c1-5aa222a6a807"
* source.observer.display = "HNZ API Gateway"

Instance: AuditEventVerificationSampleTwo
InstanceOf: SDHRAuditEvent
Usage: #example
Description: "DRAFT EXAMPLE ONLY: sampled AuditEvent returned for verification."
* id = "6ebffb1a-61a1-4646-857e-51d4153b698d"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype[0] = http://hl7.org/fhir/restful-interaction#search-type "search-type"
* action = #E
* outcome = #0
* outcomeDesc = "Successful search access sample returned for verification workflow."
* recorded = "2026-07-03T09:20:00+12:00"
* agent[0].requestor = true
* agent[=].who.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* agent[=].who.identifier.value = "1234"
* entity[+].what.identifier.system = "https://standards.digital.health.nz/ns/nhi"
* entity[=].what.identifier.value = "ZKC7284"
* entity[+].what = Reference(AllergyIntolerance/AllergyIntoleranceExample)
* entity[=].detail[+].type = "correlationId"
* entity[=].detail[=].valueString = "c500dae6-ac65-4e4f-a4c1-5aa222a6a807"
* source.observer.display = "HNZ API Gateway"

Instance: BundleVerificationSamplesResponseExample
InstanceOf: Bundle
Usage: #example
Description: "DRAFT EXAMPLE ONLY: Bundle returned from the verification samples operation."
* type = #collection
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
Description: "DRAFT EXAMPLE ONLY: first page Bundle returned from the verification samples operation using _count and _offset."
* type = #searchset
* timestamp = "2026-07-03T10:00:00+12:00"
* total = 2
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_offset=0"
* link[+].relation = "next"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_offset=1"
* entry[0].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* entry[=].resource = AuditEventVerificationSampleOne

Instance: BundleVerificationSamplesPageTwoResponseExample
InstanceOf: Bundle
Usage: #example
Description: "DRAFT EXAMPLE ONLY: second page Bundle returned from the verification samples operation using _count and _offset."
* type = #searchset
* timestamp = "2026-07-03T10:00:05+12:00"
* total = 2
* link[0].relation = "self"
* link[=].url = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/$verification-samples?_count=1&_offset=1"
* entry[0].fullUrl = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* entry[=].resource = AuditEventVerificationSampleTwo

Instance: ParametersVerificationSubmissionRequestExample
InstanceOf: SDHRVerificationSubmissionParameters
Usage: #example
Description: "DRAFT EXAMPLE ONLY: Parameters payload posted to the verification submissions operation."
* parameter[0].name = "verification"
* parameter[=].part[0].name = "auditEvent"
* parameter[=].part[=].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/b3f9de58-2da4-427c-a39c-07147eac3615"
* parameter[=].part[+].name = "result"
* parameter[=].part[=].valueCode = #verification-succeeded
* parameter[+].name = "verification"
* parameter[=].part[0].name = "auditEvent"
* parameter[=].part[=].valueReference.reference = "https://api.uat.sdhr.digital.health.nz/s2s/AuditEvent/6ebffb1a-61a1-4646-857e-51d4153b698d"
* parameter[=].part[+].name = "result"
* parameter[=].part[=].valueCode = #verification-failed	

Instance: ParametersVerificationSubmissionResponseExample
InstanceOf: SDHRVerificationSubmissionResponseParameters
Usage: #example
Description: "DRAFT EXAMPLE ONLY: Parameters response returned from the verification submissions operation."
* parameter[0].name = "verificationSubmissionResult"
* parameter[=].part[0].name = "auditEvent"
* parameter[=].part[=].valueReference = Reference(AuditEvent/AuditEventVerificationSampleOne)
* parameter[=].part[+].name = "status"
* parameter[=].part[=].valueCode = #processed
* parameter[+].name = "verificationSubmissionResult"
* parameter[=].part[0].name = "auditEvent"
* parameter[=].part[=].valueReference = Reference(AuditEvent/AuditEventVerificationSampleTwo)
* parameter[=].part[+].name = "status"
* parameter[=].part[=].valueCode = #processed
