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
* identifier ^definition = "NZePS SCID + item sequence number. This identifier links the prescription item to dispense records and excludes GTIM barcode values."

* subject 1..1
* insert ProfilePatient(subject)
* subject ^short = "Patient for the medication request"
* subject ^definition = "The patient who is the subject of this medication request."
* subject.display 0..0

* status ^short = "Item status for the NZePS prescription item"
* status ^definition = "The status of the medication request, mapped from the NZePS item status and legacy item status extensions when present."

* extension contains
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-long-term-medication named LongTermMedication 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-instructions-modified named InstructionsModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-medication-modified named MedicationModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-status-type named ItemStatus 0..0
* extension[ItemStatus] ^short = "Legacy extension no longer supported"
* extension[ItemStatus] ^definition = "Legacy MDR status extension. If present, this is mapped to status during ingestion, but it is not exposed in SEHR content."

* category 0..*
* category ^short = "Medication request usage category"
* category ^definition = "Indicates the type of medication request, such as inpatient, outpatient, or community treatment."

* medicationCodeableConcept 1..1
* medicationCodeableConcept ^short = "Medication to be taken"
* medicationCodeableConcept ^definition = "The medication requested for the patient, expressed as a codeable concept."
* medicationCodeableConcept.coding.system 0..1 = http://nzmt.org.nz
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


