Profile: SDHRMedicationRequest
Parent: MedicationRequest
Description: "DRAFT PROFILE: MedicationRequest resource for Shared Digital Health Record. This profile constrains MedicationRequest to the SDHR subset of MDR medication request content."

* ^status = #draft

// SDHR wide policies for all resources
* implicitRules 0..0
* language 0..0
* text 0..0
* contained 0..0    

* meta.versionId 0..1
* meta.lastUpdated 0..1
* meta.security 0..1
* meta.source 0..0
* meta.profile 0..0
* meta.tag 0..0

// Duplications of key MDR elements to support SDHR use cases
* id ^short = "MDR record identifier (SCID + item sequence number)"
* id ^definition = "The MDR identifier for this MedicationRequest resource, composed of the NZePS prescription SCID and the item sequence number."

* identifier ^short = "NZePS prescription item ID (SCID + item sequence number)"
* identifier ^definition = "NZePS SCID + item sequence number. This identifier links the prescription item to dispense records and excludes GTIN barcode values."

* subject 1..1
* insert ProfilePatient(subject)
* subject ^short = "Patient for the medication request"
* subject ^definition = "The patient who is the subject of this medication request."
* subject.display 0..0

* status ^short = "Status of the medication request"
* status ^definition = "The FHIR MedicationRequest.status supplied by MDR, retained unchanged. SDHR uses this value for medication status filtering. The separate NZePS item-status extension may provide additional detail for active prescriptions and does not replace this status."

* extension contains
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-long-term-medication named LongTermMedication 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-instructions-modified named InstructionsModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-medication-modified named MedicationModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-item-status named ItemStatus 0..1
* extension[ItemStatus] ^short = "NZePS item status, including sub-status for active prescriptions"
* extension[ItemStatus] ^definition = "The NZePS item status supplied by MDR, returned separately from MedicationRequest.status. For active prescriptions it may indicate whether repeats remain. SEHRs may use it to display a repeats-remaining flag; SDHR status filtering uses MedicationRequest.status."

* category 0..*
* category ^short = "Medication request usage category"
* category ^definition = "Indicates the type of medication request, such as inpatient, outpatient, or community treatment."

* medicationCodeableConcept 1..1
* medicationCodeableConcept ^short = "Medication to be taken"
* medicationCodeableConcept ^definition = "The medication requested for the patient, expressed as a codeable concept." 
* medicationCodeableConcept.coding.system 0..1
* medicationCodeableConcept.coding.code 0..1
* medicationCodeableConcept.coding.display 0..1

* authoredOn 0..1
* authoredOn ^short = "When the request was authored"
* authoredOn ^definition = "The date and time when the prescription item was initially written or authored."

* requester 0..1
* requester ^short = "Who requested the medication request"
* requester ^definition = "The practitioner or organization that requested or authorized the medication request."
* requester.identifier 0..1

* reasonCode 0..*
* reasonCode ^short = "Reason for the medication request"
* reasonCode ^definition = "The coded reason or indication for ordering the medication."

* reasonReference 0..*
* reasonReference ^short = "Reference supporting the medication request reason"
* reasonReference ^definition = "A reference to a condition or observation that supports why the medication was ordered."

* supportingInformation 0..*
* supportingInformation ^short = "Location or facility information supporting the request"
* supportingInformation ^definition = "A reference to supporting information such as the prescribing facility location."

* dosageInstruction.patientInstruction 0..1
* dosageInstruction.patientInstruction ^short = "Patient instructions"
* dosageInstruction.patientInstruction ^definition = "Patient-facing instructions about how the medication should be taken."

* dispenseRequest.quantity 0..1
* dispenseRequest.quantity ^short = "Dispense quantity"
* dispenseRequest.quantity ^definition = "The quantity of medication to dispense for this request."

* dispenseRequest.numberOfRepeatsAllowed 0..1
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of repeats allowed"
* dispenseRequest.numberOfRepeatsAllowed ^definition = "The number of additional dispenses authorized after the initial dispense."

* dispenseRequest.validityPeriod.end 0..1
* dispenseRequest.validityPeriod.end ^short = "Prescription expiry date"
* dispenseRequest.validityPeriod.end ^definition = "The end of the period over which the prescription is authorized."

// Deviations from MDR profile
* recorder 0..0
* note 0..0

// Closed clinical subset (MED-220 / MED-230). Unlisted MDR fields are not surfaced.
* modifierExtension 0..0
* statusReason 0..0
* priority 0..0
* doNotPerform 0..0
* reported[x] 0..0
* encounter 0..0
* performer 0..0
* performerType 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* groupIdentifier 0..0
* courseOfTherapyType 0..0
* insurance 0..0
* substitution 0..0
* priorPrescription 0..0
* detectedIssue 0..0
* eventHistory 0..0

* meta.id 0..0
* meta.extension 0..0
* identifier.system 1..1
* identifier.system = "https://standards.digital.health.nz/ns/nzeps-scid-item-id"
* medication[x] only CodeableConcept
* medicationCodeableConcept.id 0..0
* medicationCodeableConcept.extension 0..0
* medicationCodeableConcept.coding.id 0..0
* medicationCodeableConcept.coding.extension 0..0
* medicationCodeableConcept.coding.version 0..0
* medicationCodeableConcept.coding.userSelected 0..0
* dosageInstruction.id 0..0
* dosageInstruction.extension 0..0
* dosageInstruction.modifierExtension 0..0
* dosageInstruction.sequence 0..0
* dosageInstruction.text 0..0
* dosageInstruction.additionalInstruction 0..0
* dosageInstruction.timing 0..0
* dosageInstruction.asNeeded[x] 0..0
* dosageInstruction.site 0..0
* dosageInstruction.method 0..0
* dosageInstruction.doseAndRate 0..0
* dosageInstruction.maxDosePerPeriod 0..0
* dosageInstruction.maxDosePerAdministration 0..0
* dosageInstruction.maxDosePerLifetime 0..0

* extension ^slicing.rules = #closed
* dispenseRequest.id 0..0
* dispenseRequest.extension 0..0
* dispenseRequest.modifierExtension 0..0
* dispenseRequest.initialFill 0..0
* dispenseRequest.dispenseInterval 0..0
* dispenseRequest.expectedSupplyDuration 0..0
* dispenseRequest.performer 0..0
* dispenseRequest.validityPeriod.id 0..0
* dispenseRequest.validityPeriod.extension 0..0
* dispenseRequest.validityPeriod.start 0..0
