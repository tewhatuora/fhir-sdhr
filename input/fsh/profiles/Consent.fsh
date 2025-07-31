Profile: SDHRConsent
Parent: Consent
Description: "Consent resource created to reflect a patient has agreed to share their information with authorised health workers, originating from a practice management system
            For more detail on how this resource is used, see the [consent based access control page](./consent-based-access.html)."

* status ^short = "The state of the Consent. This must be active to release data from the server"

* category 1..1
* category ^short = "The category of the consent, which is a code that indicates the type of consent"
* category ^definition = "The category of the consent, which is a code that indicates the type of consent"
* category ^fixedCodeableConcept.coding[0].system = "http://snomed.info/sct"
* category ^fixedCodeableConcept.coding[0].code = #887031000000108

* insert ProfilePatient(patient)

* policy 1..*

* provision 1..1
* provision ^short = "The provision of the consent, which may be a permit or deny"
* provision.type 1..1
* provision.type ^short = "The type of consent, either permit or deny"
* provision.period.start 1..1
* provision.period.start ^short = "The date and time the Consent is considered to be in effect"
* provision.period.end 0..1
* provision.period.end ^short = "The date and time the Consent is considered to be expired"
* provision.action 1..*
* provision.action ^short = "The action that is being permitted or denied"
// Add the extension at provision.provision
* provision.provision.extension contains FacilityParticipationExtension named FacilityParticipationExtension 0..1
* provision.provision.extension[FacilityParticipationExtension] ^short = "Indicates the patient has opted out of participation entirely at the facility"

* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
//* category = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
