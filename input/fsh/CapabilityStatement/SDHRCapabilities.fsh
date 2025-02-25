Instance: SDHRCapabliityStatement
InstanceOf: HnzToolingCapabilityStatement
Usage: #definition
* version = "0.3.0"
* name = "SDHRCapabliityStatement"
* title = "NZ Shared Digital Health Record API"
* contact[+].name = "Health New Zealand Te Whatu Ora"
* contact[=].telecom.value = "https://www.tewhatuora.govt.nz"
* contact[=].telecom.system = #url
* description = "NZ Shared Digital Health Record API"
* status = #draft
* experimental = true
* date = "2024-04-15T01:15:23.3688326Z"
* publisher = "Health NZ"
* kind = #capability
* implementation.description = "Health NZ | Te Whatu Ora NZ Shared Digital Health Record API"
* implementation.url = "https://fhir.api.digital.health.nz/R4"
* software.name = "NZ Shared Digital Health Record API"
* software.version = "1.0.0.0"
* fhirVersion = #4.0.1
* format = #application/fhir+json
* rest.mode = #server

* rest.security.cors = true
* rest.security.service = #SMART-on-FHIR
* rest.security.description = "OAuth 2.0 - Client Credential flow.)"
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/token"
* rest.security.extension.extension[+].url = "authorize"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/authorize"
* rest.security.extension[+].url = "http://fhir-registry.smarthealthit.org/StructureDefinition/capabilities"
* rest.security.extension[=].valueCode = #client-confidential-symmetric

* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].url = Canonical(HnzCustomHeadersExtension)
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[key].valueString = "Correlation-Id"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Correlation-Id.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = false
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].extension[key].valueString = "x-api-key"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Api-Key.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = true
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].extension[key].valueString = "Request-Context"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Request-Context.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = true
* extension[HnzApiSpecBuilderExtension].extension[licenseURL].valueUri = "https://www.tewhatuora.govt.nz/assets/Our-health-system/Digital-health/Digital-Service-Hub/API-Access-and-Use-Agreement.docx"
* extension[HnzApiSpecBuilderExtension].extension[licenseName].valueString = "Health New Zealand Digital Services Hub API Access and Use Agreement"
* extension[HnzApiSpecBuilderExtension].extension[externalDocs].valueUri = "https://fhir-ig.digital.health.nz/shared-care"

* rest.interaction.code = #search-system
* rest.interaction insert APIStandardsDocumentation 

// allergyIntolerance
* rest.resource[0].type = #AllergyIntolerance
* rest.resource[=].profile = Canonical(SDHRAllergyIntolerance)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

// condition
* rest.resource[+].type = #Condition
* rest.resource[=].profile = Canonical(SDHRCondition)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type


// consent
// * rest.resource[+].type = #Consent
// * rest.resource[=].profile = Canonical(SDHRConsent)
// * rest.resource[=].interaction[0].code = #read
// * rest.resource[=].interaction[+].code = #create 
// * rest.resource[=].interaction[+].code = #update
// * rest.resource[=].interaction[+].code = #search-type

// encounter
* rest.resource[+].type = #Encounter
* rest.resource[=].profile = Canonical(SDHREncounter)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

// observations
* rest.resource[+].type = #Observation
* rest.resource[=].profile = Canonical(SDHRObservation)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type