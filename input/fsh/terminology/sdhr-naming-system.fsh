Instance: SDHRIdNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "SDHR Id NamingSystem"
* description = "The SDHR Id NamingSystem identifies the SDHR resource id namespace published on standards.digital.health.nz. API Consumers should use it when they need a stable system value to reference the FHIR resource ids returned by the SDHR service, for example, when including it in a FHIR Resource outside of SDHR as a secondary identifier."
* status = #active
* kind = #identifier
* date = "2026-06-03"
* publisher = "Te Whatu Ora / Health New Zealand"
* responsible = "HISO"
* usage = "This NamingSystem identifies the SDHR resource id namespace published on standards.digital.health.nz. API Consumers should use it when they need a stable system value to reference the FHIR resource ids returned by the SDHR service, for example, when including it in a FHIR Resource outside of SDHR as a secondary identifier."
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://standards.digital.health.nz/ns/sdhr-id"
* uniqueId[=].preferred = true
