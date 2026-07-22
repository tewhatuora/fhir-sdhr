Profile: SDHRImmunization
Parent: AIRImmunization
Description: "DRAFT PROFILE: Immunization resource for Shared Digital Health Record. This profile constrains Immunization to the SDHR subset of AIR immunization content. AIR reference: https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/StructureDefinition-air-immunization.html"

* ^status = #draft

// SDHR wide policies for all resources
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

// Extension Handling in SDHR, some we allow and some we remove
* meta.extension contains
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment named DataQualityAssessment 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match named PlannedEventMatch 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match-quality named PlannedEventMatchQuality 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system named CreatedSourceSystem 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by named CreatedBy 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system named ModifiedSourceSystem 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by named ModifiedBy 0..1 and
    http://hl7.org/fhir/StructureDefinition/firstCreated named FirstCreated 0..1
* protocolApplied.seriesDoses[x] 0..0
* recorded 0..0
* identifier 0..0
* contained 0..0

// Extension Handling in SDHR, some we allow and some we remove
* extension contains
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-administered-product named AdministeredProduct 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent named Diluent 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site named MobileSite 0..0 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given named AgeGiven 0..1 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension named RelatedPersonExtension 0..0 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-extension named SerologyReportExtension 0..0 and
	https://standards.digital.health.nz/fhir/air/StructureDefinition/air-reschedule-date named RescheduleDate 0..0


// Duplications of key AIR elements with additional context added
* id 1..1
* id ^short = "MDR dispense record identifier (SCID + item sequence number + dispense sequence number)"
* id ^definition = "The MDR identifier for this MedicationDispense resource, composed of the NZePS prescription SCID, item sequence number, and dispense sequence number. A reversal record would include a suffix of '-X' before being removed from MDR prior to SDHR integration."