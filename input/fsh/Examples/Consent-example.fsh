// Instance: SDHRConsentExample
// InstanceOf: SDHRConsent
// Usage: #example
// Description: "Consent example submitted to allow a patient to opt in to sharing their information, originating from a practice management system"

// * status = #active

// * identifier[+].use = #secondary
// * identifier[=].value = "93f28be6-4787-40f1-ae39-64233eb2cf7c"

// * patient  insert PatientSubject(ZKC7284, Carrey Carrington)

// * policy[+].uri = "https://www.privacy.org.nz/privacy-act-2020"
// * policy[=].authority = "https://www.privacy.org.nz"

// * provision.type = #permit
// * provision.period.start = "2023-10-04"
// * provision.period.end = "2028-11-22"

// * provision.data[+].meaning = #instance
// * provision.data[=].reference = Reference(HypertensionConditionExample)
// * provision.data[+].meaning = #instance
// * provision.data[=].reference = Reference(EncounterExample1)

// * scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
// * category = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
