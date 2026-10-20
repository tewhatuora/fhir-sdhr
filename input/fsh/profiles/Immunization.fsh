Invariant: sdhr-imm-status-1
Description: "SDHR does not return immunization records that AIR has marked as entered in error."
Expression: "status != 'entered-in-error'"
Severity: #error

Profile: SDHRImmunization
Parent: AIRImmunization
Description: "Immunization resource for the Shared Digital Health Record. This profile constrains AIR Immunization content to the subset required for direct clinical care."

* ^status = #draft
* obeys sdhr-imm-status-1

// SDHR-wide exclusions
* implicitRules 0..0
* language 0..0
* text 0..0
* contained 0..0
* modifierExtension 0..0

// AIR always assigns an ImmSOT identifier to resources returned through SDHR.
* id 1..1
* id ^short = "Unique identifier for the immunization event assigned by ImmSOT"
* id ^definition = "The unique identifier assigned to the immunization event by ImmSOT. AIR always supplies this identifier for records returned through SDHR."

// Metadata retained by SDHR. Closing the inherited AIR slicing prevents other
// AIR metadata extensions from being returned.
* meta.id 0..0
* meta.extension ^slicing.rules = #closed
* meta.extension[DataQualityAssessment] 0..0
* meta.extension[PlannedEventMatch] 0..0
* meta.extension[PlannedEventMatchQuality] 0..0
* meta.extension[CreatedSourceSystem] 0..1
* meta.extension[CreatedBy] 0..0
* meta.extension[ModifiedSourceSystem] 0..1
* meta.extension[ModifiedBy] 0..0
* meta.extension[CreatedDate] 0..1
* meta.versionId 0..1
* meta.lastUpdated 0..1
* meta.security 0..*
* meta.source 0..0
* meta.profile 1..1
* meta.tag 0..0

// Only the administered product and age-at-administration AIR extensions are
// included in the SDHR direct-care subset.
* extension ^slicing.rules = #closed
* extension[administeredProduct] 0..1
* extension[Diluent] 0..0
* extension[MobileSiteId] 0..0
* extension[AgeGiven] 0..1
* extension[relatedPersonExtension] 0..0
* extension[serologyReportExtension] 0..0
* extension[rescheduleDateExtension] 0..0

// Event details
* identifier 0..0
* status ^short = "Status of the immunization event"
* status ^definition = "The status of the immunization event. SDHR returns completed and not-done records; records marked entered-in-error are excluded."
* statusReason ^short = "Reason for the immunization event status"

* vaccineCode.id 0..0
* vaccineCode.extension 0..0
* vaccineCode.coding 1..1
* vaccineCode.coding.id 0..0
* vaccineCode.coding.extension 0..0
* vaccineCode.coding.system 1..1
* vaccineCode.coding.version 0..0
* vaccineCode.coding.code 1..1
* vaccineCode.coding.display 0..1
* vaccineCode.coding.userSelected 0..1
* vaccineCode.text 0..1

* patient ^short = "NHI of the person who was immunized"
* patient ^definition = "The person who was immunized, identified by their National Health Index (NHI) number. Patient names are not sourced from AIR."
* patient.display 0..0

* recorded 0..0

// SDHR obtains the facility name from the AIR Location returned using
// _include=Location and places it in Reference.display. Identifier has no
// display child in FHIR R4.
* location ^short = "Facility where the immunization event occurred"
* location ^definition = "The HPI facility where the immunization event occurred. SDHR requests the referenced AIR Location and enriches location.display with the facility name."
* location.display ^short = "Facility name supplied by SDHR from the included AIR Location"
* location.display ^definition = "The facility name obtained from the AIR Location included with the search response."

* lotNumber ^short = "Vaccine batch or lot number"
* expirationDate ^short = "Vaccine batch expiry date"
* site ^short = "Body site where the vaccine was administered"
* route ^short = "Route by which the vaccine was administered"

// A record can contain more than one vaccinator.
* performer.id 0..0
* performer.extension 0..0
* performer.modifierExtension 0..0
* performer.function ^short = "Role performed by the vaccinator"
* performer.actor ^short = "Identifier or reference for the vaccinator"

* reasonCode ^short = "Clinical or funding indication for the immunization"
* reasonReference ^short = "Condition, observation, or report supporting the indication"

* protocolApplied.id 0..0
* protocolApplied.extension 0..0
* protocolApplied.modifierExtension 0..0
* protocolApplied.series 0..0
* protocolApplied.authority 0..0
* protocolApplied.targetDisease ^short = "Vaccine-preventable disease targeted by this dose"
* protocolApplied.doseNumber[x] only positiveInt
* protocolApplied.doseNumber[x] 1..1
* protocolApplied.doseNumber[x] ^short = "Dose number administered"
* protocolApplied.seriesDoses[x] 0..0
