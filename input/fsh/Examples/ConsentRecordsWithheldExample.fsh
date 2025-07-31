Instance: ConsentExampleRecordsWithheld
InstanceOf: SDHRConsent
Usage: #example
Description: "Consent example to allow a patient to opt in to sharing their information, while withholding some records from the service"

* status = #active
* category = $sct#887031000000108 "Consent for information sharing"

* identifier[+].use = #secondary
* identifier[=].value = "93f28be6-4787-40f1-ae39-64233eb2cf7c"

* patient  insert Patient(ZKC7284, Sage Westbrook)

* policy[+].uri = "https://www.privacy.org.nz/privacy-act-2020"
* policy[=].authority = "https://www.privacy.org.nz"

// HNZ participation
* provision.type = #permit
* provision.period.start = "2023-10-04"
* provision.action.coding.code = #access "Access. Retrieval without permitting collection, use or disclosure."

// some, but not all,  records withheld
* provision.provision[+].type = #deny
* provision.provision[=].actor[+].role = #PROV
* provision.provision[=].actor[=].reference = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/A1111-A)
* provision.provision[=].data[+].reference = Reference(Condition/local-pms-id)
* provision.provision[=].data[=].meaning = #instance
* provision.provision[=].data[+].reference = Reference(Condition/another-local-pms-id)
* provision.provision[=].data[=].meaning = #instance
* provision.provision.extension[+].url = "http://fhir-ig.digital.health.nz/sdhr/StructureDefinition/facility-participation-extension"
* provision.provision.extension[=].valueCodeableConcept = #sdhr-facility-opt-in "Facility opt in"
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
