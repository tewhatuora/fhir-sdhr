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
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
* rest.security.description = "OAuth 2.0 - Client Credential flow.)"

// allergyIntolerance
* rest.resource[0].type = #AllergyIntolerance
* rest.resource[=].profile = "https://standards.digital.health.nz/StructureDefinition/PrimaryCareAllergyIntolerance"
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction.code = #create 
* rest.resource[=].interaction.code = #update
* rest.resource[=].interaction.code = #search-type

// condition
* rest.resource[0].type = #Condition
* rest.resource[=].profile = "https://standards.digital.health.nz/StructureDefinition/PrimaryCareCondition"
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction.code = #create 
* rest.resource[=].interaction.code = #update
* rest.resource[=].interaction.code = #search-type


// consent
* rest.resource[0].type = #Consent
* rest.resource[=].profile = "https://standards.digital.health.nz/StructureDefinition/PrimaryCareConsent"
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction.code = #create 
* rest.resource[=].interaction.code = #update
* rest.resource[=].interaction.code = #search-type

// encounter
* rest.resource[0].type = #Encounter
* rest.resource[=].profile = "https://standards.digital.health.nz/StructureDefinition/PrimaryCareEncounter"
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction.code = #create 
* rest.resource[=].interaction.code = #update
* rest.resource[=].interaction.code = #search-type

// observations

