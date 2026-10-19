Instance: ParametersHNZDomainParticipateOptOut
InstanceOf: Parameters
Usage: #example
Description: "Opt out of SDHRImmunisations using $hnz-domain-participate. Only domain consent changes; resources are not archived or restored."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[+].name = "domainParticipation"
* parameter[=].part[0].name = "domain"
* parameter[=].part[=].valueCode = #SDHRImmunisations
* parameter[=].part[+].name = "hnzParticipationIndicator"
* parameter[=].part[=].valueBoolean = false