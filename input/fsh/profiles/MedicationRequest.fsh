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

* status ^short = "Item status for the NZePS prescription item"
* status ^definition = "The status of the medication request, mapped from the NZePS item status and legacy item status extensions when present."

* extension contains
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-long-term-medication named LongTermMedication 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-instructions-modified named InstructionsModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-medication-modified named MedicationModified 0..1 and
	http://hl7.org.nz/fhir/StructureDefinition/nzeps-status-type named ItemStatus 0..0
* extension[ItemStatus] ^short = "Legacy extension no longer supported"
* extension[ItemStatus] ^definition = "Legacy MDR status extension. If present, this is mapped to status during ingestion, but it is not exposed in SEHR content."

* supportingInformation ^short = "Reference to a location (HPI facility ID) that supports the medication request"
* supportingInformation ^definition = "A reference for the location (HPI facility ID) associated with the medication request."

// Deviations from MDR profile
* recorder 0..0
* note 0..0
* subject.display 0..0


