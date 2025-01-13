Instance: PrimaryCareAcquisitionCapabliityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* version = "4.0.1"
* name = "PrimaryCareAcquisitionCapabliityStatement"
* title = "Primary Care Data Acquisition API"
* description = "Primary Care Data Acquisition API"
* status = #draft
* experimental = true
* date = "2024-04-15T01:15:23.3688326Z"
* publisher = "Health NZ"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.tewhatuora.govt.nz"
* kind = #capability
* software.name = "Primary Care Data Acquisition API"
* software.version = "1.0.0.0"
* fhirVersion = #4.0.1
* format = #application/fhir+json
* rest.mode = #server

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

// allergyIntolerance
* rest.resource[0].type = #AllergyIntolerance
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareAllergyIntolerance"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

// condition
* rest.resource[+].type = #Condition
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareCondition"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type


// consent
* rest.resource[+].type = #Consent
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareConsent"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

// encounter
* rest.resource[+].type = #Encounter
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareEncounter"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

// observations
* rest.resource[+].type = #Observation
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareObservationVitalSigns"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

//* rest.resource[+].type = #Observation
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareObservationVapingStatus"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type

//* rest.resource[+].type = #Observation
* rest.resource[=].profile = "https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/PrimaryCareObservationSmokingStatus"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type