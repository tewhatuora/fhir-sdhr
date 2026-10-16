Profile: SDHRAuditEvent
Parent: AuditEvent
Description: "Slim AuditEvent returned by the SDHR verification samples operation. Contains the local verification reference, original agents, NHI and correlation ID with the minimal required FHIR AuditEvent envelope. Internal source identity and verification state are not exposed."
* ^status = #draft
* id 1..1
* meta 0..0
* implicitRules 0..0
* language 0..0
* text 0..0
* extension 0..0
* modifierExtension 0..0
* contained 0..0
* type.system 1..1
* type.code 1..1
* type.display 0..0
* type.version 0..0
* type.userSelected 0..0
* subtype 0..0
* action 0..0
* period 0..0
* outcome 0..0
* outcomeDesc 0..0
* purposeOfEvent 0..0
* recorded ^short = "Time of the sampled access event."
* agent 1..*
* agent ^short = "Original agents retained unchanged from the sampled access event."
* source.site 0..0
* source.type 0..0
* source.observer.display = "SDHR verification samples"
* source.observer.reference 0..0
* source.observer.identifier 0..0
* source.observer.type 0..0
* entity.type 0..0
* entity.role 0..0
* entity.lifecycle 0..0
* entity.securityLabel 0..0
* entity.name 0..0
* entity.description 0..0
* entity.query 0..0
* entity.what 0..0
* entity.detail.value[x] only string
* entity.detail ^short = "NHI or correlation ID of the sampled request."
* entity.detail obeys sdhr-verification-detail-type

Invariant: sdhr-verification-detail-type
Description: "Sample details contain only the NHI or request correlation ID."
Severity: #error
Expression: "type = 'nhi' or type = 'correlationId'"
