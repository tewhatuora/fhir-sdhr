Profile: SDHRAuditEvent
Parent: AuditEvent
Description: "AuditEvent resource used for SDHR data access verification workflows."
* ^status = #draft

* implicitRules 0..0
* language 0..0
* text 0..0
* contained 0..0
* modifierExtension 0..0

* meta.versionId 0..1
* meta.lastUpdated 0..1
* meta.security 0..*
* meta.source 0..0
* meta.profile 0..0
* meta.tag 0..0

* type 1..1
* subtype 0..*
* action 0..1
* recorded 1..1
* outcome 0..0
* outcomeDesc 0..0
* purposeOfEvent 0..0

* agent 1..*
* agent.type 0..0
* agent.role 0..0
* agent.who 0..1
* agent.requestor 1..1
* agent.location 0..0
* agent.policy 0..0
* agent.media 0..0
* agent.network 0..0
* agent.purposeOfUse 0..0

* source 1..1
* source.site 0..0
* source.observer 1..1

* entity 0..*
* entity.role 0..0
* entity.lifecycle 0..0
* entity.securityLabel 0..0
* entity.name 0..0
* entity.description 0..0
* entity.query 0..0
