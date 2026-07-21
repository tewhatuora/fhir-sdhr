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
* identifier ^definition = "NZePS SCID + item sequence number. This identifier links dispense records to the originating prescription item and excludes GTIM barcode values."

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

* daysSupply 0..1
* daysSupply ^short = "Days of supply"
* daysSupply ^definition = "The expected number of days of medication supplied."

* whenHandedOver 0..1
* whenHandedOver ^short = "Time the medication was handed to the patient"
* whenHandedOver ^definition = "The date and time when the dispensed medication was handed over to the patient."

* destination 0..1
* destination only Reference(Location)
* destination ^short = "Dispense destination location"
* destination ^definition = "The destination location for the dispensed medication."

* receiver 0..1
* receiver ^short = "Person who received the dispense"
* receiver ^definition = "The individual who received the medication from the dispenser."

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

