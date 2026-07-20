Instance: DraftSDHRMedicationRequestExample
InstanceOf: SDHRMedicationRequest
Usage: #example
Description: "DRAFT EXAMPLE ONLY: an SDHR medication request adapted from the MDR IG MedicationRequest examples."
* id = "draft-1TNQ015Y6K2HN1P8R1-1"
* meta.lastUpdated = "2021-10-20T03:34:13+00:00"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#U "unrestricted"
* extension[ItemStatus].valueCode = #Valid
* extension[LongTermMedication].valueBoolean = false
* extension[InstructionsModified].valueBoolean = false
* extension[MedicationModified].valueBoolean = false
* identifier[+].system = "https://standards.digital.health.nz/ns/nzeps-scid-item-id"
* identifier[=].value = "draft-1TNQ015Y6K2HN1P8R1-1"
* status = #completed
* intent = #order
* medicationCodeableConcept.coding.system = "http://nzmt.org.nz"
* medicationCodeableConcept.coding.code = #40968451000116109
* medicationCodeableConcept.coding.display = "Ganciclovir 0.15% Tube Eye gel"
* subject insert Patient(ZZZ0008, Mr Test Patient | Male | 2001-01-01)
* supportingInformation[0].type = "Location"
* supportingInformation[0].reference = "Location/4df12de7-1c11-4830-ab18-7d86fb25ae8c"
* supportingInformation[0].display = "Morrow Medical Centre"
* authoredOn = "2021-10-19T15:21:07+00:00"
* requester insert Practitioner(63576, Dr Sander Abel | Doctor | 63576)
* dosageInstruction[0].sequence = 1
* dosageInstruction[0].patientInstruction = "Take one dose as directed."
* dosageInstruction[0].timing.event[0] = "2021-10-20T08:00:00+00:00"
* dosageInstruction[0].route.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 1
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "tablet"
* dispenseRequest.numberOfRepeatsAllowed = 0
* dispenseRequest.validityPeriod.start = "2021-10-20T03:34:13+00:00"
* dispenseRequest.validityPeriod.end = "2021-11-20T03:34:13+00:00"
* dispenseRequest.quantity.value = 1
* dispenseRequest.quantity.unit = "g"

Instance: DraftSDHRMedicationDispenseExample
InstanceOf: SDHRMedicationDispense
Usage: #example
Description: "DRAFT EXAMPLE ONLY: an SDHR medication dispense aligned to the MDR medication examples and constrained to the SDHR dispense subset."
* id = "draft-1TNQ015Y6K2HN1P8R1-1-dispense"
* meta.lastUpdated = "2021-10-20T04:15:00+00:00"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#U "unrestricted"
* extension[nzeps-medication-copayment-paid].valueBoolean = false
* extension[SupplyNumber].valueString = "RX-100245"
* identifier[+].system = "https://standards.digital.health.nz/ns/nzeps-scid-item-id"
* identifier[=].value = "draft-1TNQ015Y6K2HN1P8R1-1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/medicationdispense-category#outpatient "Outpatient"
* medicationCodeableConcept.coding.system = "http://nzmt.org.nz"
* medicationCodeableConcept.coding.code = #40968451000116109
* medicationCodeableConcept.coding.display = "Ganciclovir 0.15% Tube Eye gel"
* subject insert Patient(ZZZ0008, Mr Test Patient | Male | 2001-01-01)
* performer[0].actor insert Practitioner(63576, Dr Sander Abel | Doctor | 63576)
* location.reference = "Location/4df12de7-1c11-4830-ab18-7d86fb25ae8c"
* location.display = "Morrow Medical Centre"
* authorizingPrescription[0].reference = "MedicationRequest/draft-1TNQ015Y6K2HN1P8R1-1"
* quantity.value = 1
* quantity.unit = "g"
* whenPrepared = "2021-10-20T03:45:00+00:00"
* whenHandedOver = "2021-10-20T04:00:00+00:00"
* dosageInstruction[0].sequence = 1
* dosageInstruction[0].patientInstruction = "Apply to the affected eye as directed."
* dosageInstruction[0].timing.event[0] = "2021-10-20T04:00:00+00:00"
* dosageInstruction[0].route.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 0.15
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "g"