Instance: ParametersHNZDomainParticipateOptIn
InstanceOf: Parameters
Usage: #example
Description: "Opt in to SDHRMedications using $hnz-domain-participate. Global and facility choices and other domains remain unchanged; global opt-off still dominates access."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[+].name = "domainParticipation"
* parameter[=].part[0].name = "domain"
* parameter[=].part[=].valueCode = #SDHRMedications
* parameter[=].part[+].name = "hnzParticipationIndicator"
* parameter[=].part[=].valueBoolean = true