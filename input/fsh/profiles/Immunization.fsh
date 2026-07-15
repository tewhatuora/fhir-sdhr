Profile: SDHRImmunization
Parent: http://hl7.org/fhir/StructureDefinition/Immunization
Description: "DRAFT PROFILE: Immunization resource for Shared Digital Health Record. This profile constrains Immunization to the SDHR subset of AIR immunization content. AIR reference: https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/StructureDefinition-air-immunization.html"

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

* extension 0..2

* identifier 0..0
* status 1..1
* statusReason 0..1
* vaccineCode 1..1
* vaccineCode.id 0..0
* vaccineCode.extension 0..0
* vaccineCode.coding 1..*
* vaccineCode.coding.id 0..0
* vaccineCode.coding.extension 0..0
* vaccineCode.coding.system 1..1
* vaccineCode.coding.version 0..0
* vaccineCode.coding.code 1..1
* vaccineCode.coding.display 0..1
* vaccineCode.coding.userSelected 0..1
* vaccineCode.text 0..1
* patient 1..1
* encounter 0..0
* occurrence[x] only dateTime
* occurrence[x] 1..1
* recorded 0..0
* primarySource 0..0
* reportOrigin 0..0
* location 0..1
* manufacturer 0..0
* lotNumber 0..1
* expirationDate 0..1
* site 0..1
* route 0..1
* doseQuantity 0..0
* performer 0..*
* performer.id 0..0
* performer.extension 0..0
* performer.modifierExtension 0..0
* performer.function 0..1
* performer.actor 1..1
* note 0..0
* reasonCode 0..*
* reasonReference 0..*
* isSubpotent 0..0
* subpotentReason 0..0
* education 0..0
* programEligibility 0..0
* fundingSource 0..0
* reaction 0..0
* protocolApplied 0..*
* protocolApplied.id 0..0
* protocolApplied.extension 0..0
* protocolApplied.modifierExtension 0..0
* protocolApplied.series 0..0
* protocolApplied.authority 0..0
* protocolApplied.targetDisease 0..*
* protocolApplied.doseNumber[x] 1..1
* protocolApplied.seriesDoses[x] 0..0
