Instance: SDHRCapabliityStatement
InstanceOf: HnzToolingCapabilityStatement
Usage: #definition
* version = "0.6.0"
* name = "SDHRCapabliityStatement"
* title = "NZ Shared Digital Health Record API"
* contact[+].name = "Health New Zealand Te Whatu Ora"
* contact[=].telecom.value = "https://www.tewhatuora.govt.nz"
* contact[=].telecom.system = #url
* description = "NZ Shared Digital Health Record API Capability Statement"
* status = #draft
* experimental = false
* date = "2024-04-15T01:15:23.3688326Z"
* publisher = "Health NZ"
* kind = #capability
* implementation.description = "Health NZ | Te Whatu Ora NZ Shared Digital Health Record API"
* implementation.url = "https://api.uat.sdhr.digital.health.nz/s2s"
* software.name = "NZ Shared Digital Health Record API"
* software.version = "1.0.0"
* fhirVersion = #4.0.1
* format = #application/fhir+json
* rest.mode = #server
//participate operation
* rest.operation[0].name = "participate"
* rest.operation[=].definition = Canonical(SDHRParticipateOperation)
* rest.operation[=].documentation = """
This operation allows a patient to choose to participate in the Shared Digital Health Record service.
It can be used to indicate whether the patient wishes to participate, whether any resources are withheld, and the reason for participation.

Examples where this operation might be used include:
- A patient who chooses not to participate in the Shared Digital Health Record service and informs their healthcare provider of this choice.
- A patient who has some confidential records, held at their healthcare provider, that are withheld from the service.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-ParametersDoNotParticipate.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for participation](./Parameters-ParametersParticipate.html) : This example shows how to indicate that a patient wishes to participate in the Shared Digital Health Record service, where previously opted out (opt-in).
- [Parameters resource for partial participation with withheld records](./Parameters-ParametersParticipateRecordWithheld.html) : This example shows how to indicate that a patient has some confidential records that are withheld from the Shared Digital Health Record service.
- [Parameters resource for releasing withheld records](./Parameters-ParametersParticipateRecordReleased.html) : This example shows how to indicate that a patient has previously withheld records but has now released them to the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$participate`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a healthcare provider on behalf of the patient, and the patient must be identified by their NHI.
The operation will return an OperationOutcome resource indicating the result of the operation.
"""
// HNZ participate operation
* rest.operation[0].name = "hnz-participate"
* rest.operation[=].definition = Canonical(SDHRHNZParticipateOperation)
* rest.operation[=].documentation = """
This operation allows a patient to choose to participate in the Shared Digital Health Record service.
It can be used to indicate whether the patient wishes to participate, whether any resources are withheld, and the reason for participation.

Examples where this operation might be used include:
- A patient who chooses not to participate in the Shared Digital Health Record service and informs their healthcare provider of this choice.
- A patient who has some confidential records, held at their healthcare provider, that are withheld from the service.

For example payloads that might be used with this operation see:
- [Parameters resource for total non-participation](./Parameters-ParametersDoNotParticipate.html) : This example shows how to indicate that a patient does not wish to participate in the Shared Digital Health Record service (has opted out).
- [Parameters resource for participation](./Parameters-ParametersParticipate.html) : This example shows how to indicate that a patient wishes to participate in the Shared Digital Health Record service, where previously opted out (opt-in).
- [Parameters resource for partial participation with withheld records](./Parameters-ParametersParticipateRecordWithheld.html) : This example shows how to indicate that a patient has some confidential records that are withheld from the Shared Digital Health Record service.
- [Parameters resource for releasing withheld records](./Parameters-ParametersParticipateRecordReleased.html) : This example shows how to indicate that a patient has previously withheld records but has now released them to the Shared Digital Health Record service.

To make a request to this operation the API Consumer must POST a `Parameters` payload to the operation URL (e.g. `POST https://api.sdhr.digital.health.nz/s2s/$participate`).

The operation is idempotent, meaning that multiple requests with the same parameters will have the same effect as a single request.
The operation is expected to be called by a healthcare provider on behalf of the patient, and the patient must be identified by their NHI.
The operation will return an OperationOutcome resource indicating the result of the operation.
"""


* rest.security.cors = true
* rest.security.service = #SMART-on-FHIR
* rest.security.description = "OAuth 2.0 - Client Credential flow."
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/token"
* rest.security.extension.extension[+].url = "authorize"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/authorize"
* rest.security.extension[+].url = "http://fhir-registry.smarthealthit.org/StructureDefinition/capabilities"
* rest.security.extension[=].valueCode = #client-confidential-symmetric

* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].url = Canonical(HnzCustomHeadersExtension)
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[key].valueString = "X-Correlation-Id"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Correlation-Id.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = false
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].extension[key].valueString = "Request-Context"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Request-Context.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = true
* extension[HnzApiSpecBuilderExtension].extension[licenseURL].valueUri = "https://www.tewhatuora.govt.nz/assets/Our-health-system/Digital-health/Digital-Service-Hub/API-Access-and-Use-Agreement.docx"
* extension[HnzApiSpecBuilderExtension].extension[licenseName].valueString = "Health New Zealand Digital Services Hub API Access and Use Agreement"
* extension[HnzApiSpecBuilderExtension].extension[externalDocs].valueUri = "https://fhir-ig.digital.health.nz/sdhr"

* rest insert APIStandardsDocumentation 
// system interactions
* rest.interaction.code = #search-system
* rest.interaction[+].code = #transaction
* rest.interaction[+].code = #batch

// allergyIntolerance
* rest.resource[0].type = #AllergyIntolerance
* rest.resource[=] insert LimitedInteractionsDocumentation
* rest.resource[=].profile = Canonical(SDHRAllergyIntolerance)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "MANDATORY\n  Who the sensitivity is for \n [Patient](http://hl7.org/fhir/R4/patient.html)"
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Must be one of \n* food\n* medication\n* environment\n* biologic \n [AllergyIntolerance Category ValueSet](http://hl7.org/fhir/ValueSet/allergy-intolerance-category)"
* rest.resource[=].searchParam[+].name = "clinical-status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Must be one of \n* active\n * inactive\n * resolved\n[AllergyIntolerance Clinical Status ValueSet](http://hl7.org/fhir/R4/valueset-allergyintolerance-clinical.html)"
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Code that identifies the allergy or intolerance \n [AllergyIntolerance Code ValueSet](http://hl7.org/fhir/ValueSet/allergyintolerance-code)"
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "A unique identifier assigned to this resource."
* rest.resource[=].searchParam[+].name = "recorder"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-recorder"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Who recorded the sensitivity \n [AllergyIntolerance.recorder](http://hl7.org/fhir/R4/allergyintolerance-definitions.html#AllergyIntolerance.recorder)"
* rest.resource[=].searchParam[+].name = "severity"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/severity"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "mild | moderate | severe (of event as a whole)."
* rest.resource[=].searchParam[+].name = "_lastUpdated"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "When the resource version last changed"


// condition
* rest.resource[+].type = #Condition
* rest.resource[=] insert LimitedInteractionsDocumentation
* rest.resource[=].profile = Canonical(SDHRCondition)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "**MANDATORY**\n  Who has the condition?"
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The category of the condition"
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The code for the condition"
* rest.resource[=].searchParam[+].name = "encounter"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-encounter"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Encounter associated with the condition"
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "A unique identifier assigned to this resource."
* rest.resource[=].searchParam[+].name = "onset-date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-onset-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Date the condition started"
* rest.resource[=].searchParam[+].name = "participant"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-participant"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Persons involved in the encounter other than the patient."
* rest.resource[=].searchParam[+].name = "severity"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-severity"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The severity of the condition"
* rest.resource[=].searchParam[+].name = "subject"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-subject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Who has the condition?"
* rest.resource[=].searchParam[+].name = "_lastUpdated"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "When the resource version last changed."
//* rest.resource[=].searchInclude[0] = "*"
* rest.resource[=].searchInclude[0] = "Condition:encounter"

//consent
// * rest.resource[+].type = #Consent
// * rest.resource[=] insert LimitedInteractionsDocumentation
// * rest.resource[=].profile = Canonical(SDHRConsent)
// * rest.resource[=].interaction[0].code = #read
// * rest.resource[=].interaction[+].code = #create 
// * rest.resource[=].interaction[+].code = #update
// * rest.resource[=].interaction[+].code = #search-type
// * rest.resource[=].interaction[+].code = #delete
// * rest.resource[=].searchParam[+].name = "patient"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
// * rest.resource[=].searchParam[=].type = #reference
// * rest.resource[=].searchParam[=].documentation = "Who does the consent relate to"

// encounter
* rest.resource[+].type = #Encounter
* rest.resource[=] insert LimitedInteractionsDocumentation
* rest.resource[=].profile = Canonical(SDHREncounter)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "**MANDATORY**\n  The patient or group present at the encounter"
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "A unique identifier assigned to this resource."
* rest.resource[=].searchParam[+].name = "location"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/location"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Location the encounter takes place."
* rest.resource[=].searchParam[+].name = "participant"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Encounter-participant"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Persons involved in the encounter other than the patient."
* rest.resource[=].searchParam[+].name = "participant-actor"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-participant-actor"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Persons involved in the encounter other than the patient."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Encounter-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +"
* rest.resource[=].searchParam[+].name = "subject"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Encounter-subject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The patient or group present at the encounter"
* rest.resource[=].searchParam[+].name = "_lastUpdated"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "When the resource version last changed."

// observations
* rest.resource[+].type = #Observation
* rest.resource[=] insert LimitedInteractionsDocumentation
* rest.resource[=].profile = Canonical(SDHRObservation)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #create 
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "**MANDATORY**\n  Who the observation is for \n [Patient](http://hl7.org/fhir/R4/patient.html)"
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The classification of the type of observation"
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Describes what was observed. Sometimes this is called the observation 'name'"
* rest.resource[=].searchParam[+].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Observation.effective \n Obtained date/time. If the obtained element is a period, a date that falls in the period"
* rest.resource[=].searchParam[+].name = "encounter"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The Encounter resource associated with the Observation."
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "A unique identifier assigned to this resource."
* rest.resource[=].searchParam[+].name = "performer"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-performer"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Who performed the observation"
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The status of the observation"
* rest.resource[=].searchParam[+].name = "subject"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The subject that the observation is about"
* rest.resource[=].searchParam[+].name = "value-concept"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-value-concept"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The value of the observation, if the value is a CodeableConcept"
* rest.resource[=].searchParam[+].name = "value-date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-value-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "The value of the observation, if the value is a date or period of time"
* rest.resource[=].searchParam[+].name = "value-quantity"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-value-quantity"
* rest.resource[=].searchParam[=].type = #quantity
* rest.resource[=].searchParam[=].documentation = "The value of the observation, if the value is a Quantity, or a SampledData (just search on the bounds of the values in sampled data)"
* rest.resource[=].searchParam[+].name = "value-string"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-value-string"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The value of the observation, if the value is a string, and also searches in CodeableConcept.text"
* rest.resource[=].searchParam[+].name = "_lastUpdated"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "When the resource version last changed."
