Profile: SDHRAllergyIntolerance
Parent: AllergyIntolerance
Description: "AllergyIntolerance FHIR resource for Manaaki Nga Tahi"
* ^version = "0.1.3"
* implicitRules 0..0
* language 0..0
//* meta.profile only Canonical(https://fhir-ig.digital.health.nz/primary-care-acquisition/StructureDefinition/SDHRAllergyIntolerance)
* modifierExtension 0..0
* contained 0..0
* clinicalStatus from http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical (required)
* verificationStatus from http://terminology.hl7.org/CodeSystem/allergyintolerance-verification (required)
* code 1..1
* code.coding.userSelected 0..1
* code.coding.userSelected ^short = "Indicates that the value has been selected by a system user"
* code.coding.userSelected ^definition = "This field is used to maintain the code as selected by the source systems end user. For example, where a patient management system uses local codes or a non-common code set to record a substance or allergen this field indicates that the value is as selected by the system user. Some level of clinical interpretation may be required."
* patient.identifier only Identifier
* recorder.identifier only Identifier
* reaction.manifestation 1..*
* reaction.modifierExtension 0..0
* reaction.severity 0..1
* reaction.substance 0..0
* reaction.extension 0..0
* reaction.onset 0..0
* reaction.exposureRoute 0..0


//defined in NZ Base
// Alias: $suburb = http://hl7.org.nz/fhir/StructureDefinition/suburb
// Alias: $NZGeocode = http://hl7.org.nz/fhir/StructureDefinition/nz-geocode
// Alias: $buildingName = http://hl7.org.nz/fhir/StructureDefinition/building-name
// Alias: $domicileCode = http://hl7.org.nz/fhir/StructureDefinition/domicile-code
// Alias: $snowmed-351000210106 = http://snomed.info/sct/21000210109/version/20240401?fhir_vs=refset%2F351000210106
// Alias: $nzulm = https://nzhts.digital.health.nz/fhir/ValueSet/mws-substance-combined
// Alias: $verificationStatus = https://nzhts.digital.health.nz/fhir/ValueSet/mws-verification-status



// Profile:        MwsAllergyIntolerance 

// Parent:         AllergyIntolerance          

// Id:             MwsAllergyIntolerance
// Title:          "MwsAllergyIntolerance"

// * ^url = "http://hl7.org.nz/fhir/StructureDefinition/MwsAllergyIntolerance"



// //excluded

// * encounter 0..0 
// * type 0..0
// * implicitRules 0..0
// * language 0..0
// * lastOccurrence 0..0
// * reaction.substance 0..0
// * reaction.description 0..0
// * reaction.onset 0..0
// * reaction.severity 0..0
// * reaction.exposureRoute 0..0
// * reaction.note 0..0
// * criticality 0..0
// * asserter 0..0

// //restrictions
// //* meta.profile only http://hl7.org.nz/fhir/StructureDefinition/MwsAllergyIntolerance
// * clinicalStatus from https://nzhts.digital.health.nz/fhir/ValueSet/mws-clinical-status
// * clinicalStatus ^short = "active | inactive"
// * onset[x] only dateTime
// * recorder only  Reference(PractitionerRole) 

// * category 0..1
// * clinicalStatus 0..1
// * note 0..1
// * patient only Reference(MwsPatient)

// * code from $nzulm
// * verificationStatus from $verificationStatus
// * verificationStatus  ^short = "refuted | entered-in-error"
// * reaction 0..1
// * reaction.manifestation 1..50
// * reaction.manifestation from $snowmed-351000210106
// //extensions 
// //* extension contains
// //    http://hl7.org.nz/fhir/StructureDefinition/mws-attester  named attester  0..1 and
// //    http://hl7.org.nz/fhir/StructureDefinition/mws-attested-date named attestedDate 0..1
    
// //documentation
// //* extension[attester] ^short =  "The practitioner that set the current verificationStatus"
// //* asserter ^short = "identifier of the person who is the source of information about the allergy"
// //* asserter ^definition = "If the authentication flow is Patient then the service must set the asserter to patient and the NHI number in the token must exist on NH. If the authentication flow is System then the facility(HPI-FacID) and practitioner(HPI-CPN) are required and must be valid ids in the HPI"

// // contained resources

// * contained 0..2
// * contained only PractitionerRole  or  Patient 

// * obeys URL-LENGTH
// * obeys URL-ALLOWED-CHARS
// * obeys SYSTEM-LENGTH
// * obeys SYSTEM-ALLOWED-CHARS
// * obeys CODEABLE-CONCEPT-TEXT-LENGTH
// * obeys CODEABLE-CONCEPT-TEXT-ALLOWED-CHARS
// * obeys NOTE-LENGTH
// * obeys NOTE-ALLOWED-CHARS



// Invariant: URL-LENGTH
// Expression: "AllergyIntolerance.descendants().url.all(length()<1024)"
// Description: "URLs must be less than 1024 characters"
// Severity: #error

// Invariant: URL-ALLOWED-CHARS
// Expression: "AllergyIntolerance.descendants().url.all(matches('^[-a-zA-Z0-9@:%._~#=?&\\/]*$'))"
// Description: "character restrictions for URLs"
// Severity: #error

// Invariant: SYSTEM-LENGTH
// Expression: "AllergyIntolerance.descendants().system.all(length()<1024)"
// Description: "System URLs must be less than 1024 characters"
// Severity: #error

// Invariant: SYSTEM-ALLOWED-CHARS
// Expression: "AllergyIntolerance.descendants().system.all(matches('^[-a-zA-Z0-9@:%._~#=?&\\/]*$'))"
// Description: "character restrictions for system url"
// Severity: #error

// Invariant: CODEABLE-CONCEPT-TEXT-LENGTH
// Expression: "AllergyIntolerance.descendants().valueCodeableConcept.text.all(length()<1024)"
// Description: "valueCodeableConcept.text must be less than 1024 characters"
// Severity: #error

// Invariant: CODEABLE-CONCEPT-TEXT-ALLOWED-CHARS
// Expression: "AllergyIntolerance.descendants().valueCodeableConcept.text.all(matches('^([-a-zA-Z0-9\\' \\t\\r\\n.\\/,])*$'))"
// Description: "character restrictions for valueCodeableConcept.text"
// Severity: #error

// Invariant: NOTE-LENGTH
// Expression: "AllergyIntolerance.note.text.all(length()<1024)"
// Description: "System URLs must be less than 1024 characters"
// Severity: #error


// Invariant: NOTE-ALLOWED-CHARS
// Expression: "AllergyIntolerance.note.text.all(matches('^.*\\u003c|\\u003e|\\u0022|\\u0027.*$').not())"
// Description: "character restrictions for system notes -excluding  special characters which may be used for xss "
// Severity: #error
