Profile: SDHRMedicationRequest
Parent: http://hl7.org.nz/fhir/StructureDefinition/NzepsMedicationRequest
Description: "DRAFT PROFILE: MedicationRequest resource for Shared Digital Health Record. This profile constrains MedicationRequest to the SDHR subset of MDR medication request content."

* ^status = #draft

* implicitRules 0..0
* language 0..0
* text 0..0
* contained 0..0
* modifierExtension 0..0

* meta.versionId 0..1
* meta.lastUpdated 0..1
* meta.security 0..*
* meta.source 0..0
* meta.profile 0..0
* meta.tag 0..0

* identifier 1..1
* identifier ^short = "NZePS Item ID"
* identifier ^definition = "NZ ePrescribing System (NZePS) Item ID. This is the Medication Request MDR ID."
* identifier ^comment = "This identifier is the MDR ID for the medication request record."
* basedOn 0..0
* groupIdentifier 0..0
* status 1..1
* statusReason 0..0
* intent 1..1
* priority 0..0
* doNotPerform 0..0
* reported[x] 0..0
* encounter 0..0
* supportingInformation 0..*
* supportingInformation ^definition = "Supporting information referencing a location via HPI facility identifier."
* performer 0..0
* performerType 0..0
* recorder 0..0
* reasonCode 0..*
* reasonReference 0..*
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* courseOfTherapyType 0..0
* insurance 0..0
* note 0..0
* dosageInstruction 0..*
* dosageInstruction.id 0..0
* dosageInstruction.extension 0..0
* dosageInstruction.modifierExtension 0..0
* dosageInstruction.sequence 0..1
* dosageInstruction.text 0..0
* dosageInstruction.additionalInstruction 0..0
* dosageInstruction.patientInstruction 0..1
* dosageInstruction.timing 0..1
* dosageInstruction.asNeeded[x] 0..0
* dosageInstruction.site 0..0
* dosageInstruction.route 0..1
* dosageInstruction.route.text 0..0
* dosageInstruction.route.coding 0..*
* dosageInstruction.method 0..0
* dosageInstruction.doseAndRate 0..*
* dosageInstruction.maxDosePerPeriod 0..0
* dosageInstruction.maxDosePerAdministration 0..0
* dosageInstruction.maxDosePerLifetime 0..0
* dispenseRequest 0..1
* dispenseRequest.id 0..0
* dispenseRequest.extension 0..0
* dispenseRequest.modifierExtension 0..0
* dispenseRequest.initialFill 0..1
* dispenseRequest.dispenseInterval 0..1
* dispenseRequest.expectedSupplyDuration 0..1
* dispenseRequest.performer 0..1
* dispenseRequest.validityPeriod 0..1
* dispenseRequest.numberOfRepeatsAllowed 0..1
* dispenseRequest.quantity 0..1
* dispenseRequest.quantity.value 0..1
* dispenseRequest.quantity.unit 0..1
* substitution 0..0
* priorPrescription 0..0
* detectedIssue 0..0
* eventHistory 0..0

* category 0..*
* subject 1..1
* subject.display 0..0
* medication[x] only CodeableConcept
* medication[x] 1..1
* medicationCodeableConcept ^binding = http://nzmt.org.nz/vs (preferred)
* authoredOn 0..1
* requester 0..1
