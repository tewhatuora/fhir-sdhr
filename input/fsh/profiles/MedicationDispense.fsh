Profile: SDHRMedicationDispense
Parent: http://hl7.org/fhir/StructureDefinition/MedicationDispense
Description: "DRAFT PROFILE: MedicationDispense resource for Shared Digital Health Record. This profile constrains MedicationDispense to the SDHR subset of MDR medication dispense content."

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
* identifier ^short = "MDR ID (NZePS Item ID)"
* identifier ^definition = "MDR identifier assigned by the NZ ePrescribing System (NZePS). This is the Medication Dispense MDR ID."
* identifier ^comment = "This identifier is the MDR ID for the medication dispense record."
* partOf 0..0
* status 1..1
* statusReason[x] 0..0
* category 0..1
* medication[x] only CodeableConcept
* medication[x] 1..1
* medicationCodeableConcept ^binding = http://nzmt.org.nz/vs (preferred)
* subject 0..1
* subject.display 0..0
* context 0..0
* supportingInformation 0..0
* performer 0..*
* performer.id 0..0
* performer.extension 0..0
* performer.modifierExtension 0..0
* performer.function 0..0
* location 0..1
* location.reference 0..1
* location.type 0..0
* location.identifier 0..0
* location.display 0..1
* authorizingPrescription 0..*
* quantity 0..1
* quantity.value 0..1
* quantity.unit 0..1
* daysSupply 0..0
* whenPrepared 0..1
* whenHandedOver 0..1
* destination 0..0
* receiver 0..0
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
* substitution 0..0
* detectedIssue 0..0
* eventHistory 0..0
