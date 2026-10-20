Instance: ParametersHNZDomainOptOff
InstanceOf: Parameters
Usage: #example
Description: "A one-domain request to $hnz-domain-participate. Other domain choices remain unchanged."
* parameter[0].name = "patient"
* parameter[=].valueReference.reference = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284"
* parameter[+].name = "domains"
* parameter[=].part[0].name = "SDHRMedications"
* parameter[=].part[=].valueBoolean = false

Instance: ParametersHNZDomainChoices
InstanceOf: Parameters
Usage: #example
Description: "A request to $hnz-domain-participate that denies Medications and permits Immunisations on one patient's Consent."
* parameter[0].name = "patient"
* parameter[=].valueReference.reference = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284"
* parameter[+].name = "domains"
* parameter[=].part[0].name = "SDHRMedications"
* parameter[=].part[=].valueBoolean = false
* parameter[=].part[+].name = "SDHRImmunisations"
* parameter[=].part[=].valueBoolean = true

Instance: OperationOutcomeDomainDeny
InstanceOf: OperationOutcome
Usage: #example
Description: "HTTP 403 response for SDHR domain Opt-off or AIR Restricted Access."
* issue[0].severity = #error
* issue[=].code = #suppressed
* issue[=].details.coding = SDHROutcomeCodes#sdhr-domain-participation-denied "Domain participation denied"
* issue[=].details.text = "Patient has elected to not share data of this type, either with the National system for this data or with the Shared Digital Health Record."

Instance: ConsentDomainChoices
InstanceOf: SDHRConsent
Usage: #inline
Description: "Medications opted off and Immunisations explicitly opted back in."
* status = #active
* patient.reference = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284"
* patient.type = "Patient"
* policy.authority = "https://www.privacy.org.nz"
* policy.uri = "https://www.privacy.org.nz/privacy-act-2020"
* provision.type = #permit
* provision.period.start = "2026-09-21"
* provision.action.coding.code = #access
* provision.provision[domainParticipation][0].type = #deny
* provision.provision[domainParticipation][0].class = SDHRDomains#SDHRMedications
* provision.provision[domainParticipation][0].extension[lastUpdated].valueInstant = "2026-09-21T01:00:00Z"
* provision.provision[domainParticipation][1].type = #permit
* provision.provision[domainParticipation][1].class = SDHRDomains#SDHRImmunisations
* provision.provision[domainParticipation][1].extension[lastUpdated].valueInstant = "2026-09-21T01:01:00Z"
