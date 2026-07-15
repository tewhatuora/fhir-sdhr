Profile: SDHRMedicationRequest
Parent: http://hl7.org/fhir/StructureDefinition/MedicationRequest
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

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-long-term-medication named LongTermMedication 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-instructions-modified named InstructionsModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-medication-modified named MedicationModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-status-type named ItemStatus 0..1

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
* dispenseRequest 0..1
* dispenseRequest.id 0..0
* dispenseRequest.extension 0..0
* dispenseRequest.modifierExtension 0..0
* dispenseRequest.initialFill 0..0
* dispenseRequest.dispenseInterval 0..0
* dispenseRequest.expectedSupplyDuration 0..0
* dispenseRequest.performer 0..0
* dispenseRequest.validityPeriod 0..1
* dispenseRequest.numberOfRepeatsAllowed 0..1
* dispenseRequest.quantity 0..1
* substitution 0..0
* priorPrescription 0..0
* detectedIssue 0..0
* eventHistory 0..0

* category 0..*
* subject 1..1
* medication[x] only CodeableConcept
* medication[x] 1..1
* authoredOn 0..1
* requester 0..1
