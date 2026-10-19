Extension: DomainParticipationLastUpdated
Id: domain-participation-last-updated
Title: "Domain Participation Last Updated"
Description: "When this recorded domain choice last changed. Metadata only; not an effective date."
Context: Consent.provision.provision
* value[x] only instant
* valueInstant 1..1

Invariant: sdhr-unique-domain
Description: "Each domain may have only one recorded participation choice."
Severity: #error
Expression: "provision.where(class.where(system = 'https://fhir-ig.digital.health.nz/sdhr/CodeSystem/sdhr-domains').exists()).class.code.isDistinct()"
