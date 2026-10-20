Profile: SDHRMedicationDispense
Parent: MedicationDispense
Description: "DRAFT PROFILE: MedicationDispense resource for Shared Digital Health Record. This profile constrains MedicationDispense to the SDHR subset of MDR medication dispense content."

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
* id 1..1
* id ^short = "MDR dispense record identifier (SCID + item sequence number + dispense sequence number)"
* id ^definition = "The MDR identifier for this MedicationDispense resource, composed of the NZePS prescription SCID, item sequence number, and dispense sequence number. A reversal record would include a suffix of '-X' before being removed from MDR prior to SDHR integration."

* identifier 1..1
* identifier ^short = "NZePS prescription item ID (SCID + item sequence number)"
* identifier ^definition = "NZePS SCID + item sequence number. This identifier links dispense records to the originating prescription item and excludes GTIN barcode values."

* status 1..1
* status = #completed
* status ^short = "Dispense status"
* status ^definition = "Dispense status for the MDR record. Dispense events are assumed completed when present in MDR."

* authorizingPrescription 0..*
* authorizingPrescription only Reference(MedicationRequest)
* authorizingPrescription ^short = "Reference to the authorising prescription"
* authorizingPrescription ^definition = "Link to the MedicationRequest that authorises this dispense."

* subject 1..1
* insert ProfilePatient(subject)
* subject ^short = "Patient for the dispense event"
* subject ^definition = "The patient who is the subject of this medication dispense."
* subject.display 0..0

* quantity 0..1
* quantity ^short = "Dispensed quantity"
* quantity ^definition = "The quantity of medication dispensed in this dispense event."

* whenHandedOver 0..1
* whenHandedOver ^short = "Time the medication was handed to the patient"
* whenHandedOver ^definition = "The date and time when the dispensed medication was handed over to the patient."

* dosageInstruction.patientInstruction 0..1
* dosageInstruction.patientInstruction ^short = "Patient instructions"
* dosageInstruction.patientInstruction ^definition = "Patient-facing instructions about how the dispensed medication should be taken."

* extension contains
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-medication-modified named MedicationModified 1..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-instructions-modified named InstructionsModified 1..1
* extension[MedicationModified] ^short = "NZePS modified medication flag"
* extension[MedicationModified] ^definition = "Indicates whether the dispensed medication or dosage quantity differ materially from the prescribed medication."
* extension[InstructionsModified] ^short = "NZePS modified instructions flag"
* extension[InstructionsModified] ^definition = "Indicates whether the patient instructions in the dispense event differ significantly from those in the prescription."

// Deviations from MDR profile
* performer 0..0
* subject.display 0..0

// Closed clinical subset (MED-220 / MED-230). Unlisted MDR fields are not surfaced.
* modifierExtension 0..0
* partOf 0..0
* statusReason[x] 0..0
* context 0..0
* supportingInformation 0..0
* daysSupply 0..0
* destination 0..0
* receiver 0..0
* note 0..0
* substitution 0..0
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
