Instance: DraftSDHRImmunizationExample
InstanceOf: SDHRImmunization
Usage: #example
Description: "DRAFT EXAMPLE ONLY: an SDHR immunization example adapted from AIR IG Immunization imm-example-2."
* id = "draft-imm-example-2"
* meta.versionId = "2"
* meta.lastUpdated = "2023-08-31T02:18:32.217+00:00"

* extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-administered-product"
* extension[0].valueCodeableConcept.coding[0].system = "http://nzmt.org.nz"
* extension[0].valueCodeableConcept.coding[0].code = #44016911000116108
* extension[0].valueCodeableConcept.coding[0].display = "M-M-R-II"

* extension[1].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* extension[1].extension[0].url = "years"
* extension[1].extension[0].valueInteger = 1
* extension[1].extension[1].url = "months"
* extension[1].extension[1].valueInteger = 2
* extension[1].extension[2].url = "days"
* extension[1].extension[2].valueInteger = 22
* extension[1].extension[3].url = "daysSinceBirth"
* extension[1].extension[3].valueInteger = 445
* extension[1].extension[4].url = "precision"
* extension[1].extension[4].valueString = "Day"

* status = #completed
* statusReason.coding[0].system = "http://snomed.info/sct"
* statusReason.coding[0].code = #127785005
* vaccineCode.coding[0].system = "http://hl7.org/fhir/sid/cvx"
* vaccineCode.coding[0].code = #03
* vaccineCode.coding[0].display = "MMR"
* vaccineCode.text = "MMR"
* patient insert Patient(ZAA0792, AIR Test Patient)
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* location.reference = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E"
* location.display = "AIR Example Location"
* lotNumber = "1234567890"
* expirationDate = "2024-08-31"
* site.coding[0].system = "http://snomed.info/sct"
* site.coding[0].code = #368209003
* site.coding[0].display = "Right upper arm"
* route.coding[0].system = "http://snomed.info/sct"
* route.coding[0].code = #54471007
* route.coding[0].display = "Buccal route"
* performer[0].function.coding[0].system = "https://standards.digital.health.nz/ns/air-terms-code"
* performer[0].function.coding[0].code = #VC
* performer[0].function.coding[0].display = "Vaccinator"
* performer[0].actor insert Practitioner(90ZZLP, AIR Vaccinator)
* reasonCode[0].coding[0].system = "http://snomed.info/sct"
* reasonCode[0].coding[0].code = #161651000210107
* reasonCode[0].coding[0].display = "Publicly funded vaccination given for 65 years of age or older"
* protocolApplied[0].targetDisease[0].coding[0].system = "http://snomed.info/sct"
* protocolApplied[0].targetDisease[0].coding[0].code = #14189004
* protocolApplied[0].doseNumberPositiveInt = 1