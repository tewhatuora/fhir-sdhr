Instance: ParametersHNZDomainParticipateMultiple
InstanceOf: Parameters
Usage: #example
Description: "Opt in to SDHRMedications and opt out of SDHRImmunisations in one synchronous $hnz-domain-participate request for exactly one patient."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[+].name = "domainParticipation"
* parameter[=].part[0].name = "domain"
* parameter[=].part[=].valueCode = #SDHRMedications
* parameter[=].part[+].name = "hnzParticipationIndicator"
* parameter[=].part[=].valueBoolean = true
* parameter[+].name = "domainParticipation"
* parameter[=].part[0].name = "domain"
* parameter[=].part[=].valueCode = #SDHRImmunisations
* parameter[=].part[+].name = "hnzParticipationIndicator"
* parameter[=].part[=].valueBoolean = false