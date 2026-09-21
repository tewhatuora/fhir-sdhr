Instance: ParametersHNZParticipateOptOutImportedExternalConsent
InstanceOf: Parameters
Usage: #example
Description: "Example parameters content to POST to the HNZ Participate (`$hnz-participate`) operation where global opt-out is imported from an external consent source."
* parameter[0].name = "patient"
* parameter[=].valueReference = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284)
* parameter[=].valueReference.display = "Susan Westbrook"
* parameter[=].valueReference.type = "Patient"
* parameter[+].name = "hnzParticipationIndicator"
* parameter[=].valueBoolean = false
* parameter[+].name = "hnzOptOutReasonCode"
* parameter[=].valueCode = #imported-external-consent
