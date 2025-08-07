Instance: ConsentHNZDenyExample
InstanceOf: SDHRConsent
Usage: #example
Description: "Consent example submitted to allow a patient to opt out of sharing their information. This example shows a Consent resource created as the result of an HNZ opt out."

* status = #active
* category = $sct#887031000000108 "Consent for information sharing"

* identifier[+].use = #secondary
* identifier[=].value = "93f28be6-4787-40f1-ae39-64233eb2cf7c"

* patient  insert Patient(ZKC7284, Sage Westbrook)

* policy[+].uri = "https://www.privacy.org.nz/privacy-act-2020"
* policy[=].authority = "https://www.privacy.org.nz"

* provision.type = #deny
* provision.period.start = "2023-10-04"
* provision.action.coding.code = #access "Access. Retrieval without permitting collection, use or disclosure."



* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
