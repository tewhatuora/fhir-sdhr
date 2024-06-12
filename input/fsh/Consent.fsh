Profile: PrimaryCareConsent
Parent: Consent
Description: "Consent resource submitted to allow a patient to opt in to sharing their information, originating from a practice management system"

* status ^short = "The state of the Consent. This must be active to release data from the server"

* patient.type = "Patient"
* patient.identifier.use = #official
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value 1..1

* patient.identifier.value ^short = "The NHI number of the patient"

* policy 1..*

* provision.type = #permit
* provision.period.start 1..1 
* provision.period.start ^short = "The date and time the Consent is considered to be in effect"
* provision.period.end 1..1
* provision.period.end ^short = "The date and time the Consent is considered to be expired"

* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
