/*
    Use this file to define RuleSet components for the IG.
    These are particularly useful for reusable components such
    as Patient(subject) and Practitioner(performer) references.
*/


/*
    Re-usable Patient component for use in profiles.
    Note that Patient and Practitioner references are used throughout the profiles
    The JSON property may differ dependong on the profile so insert the reference in the profile using the following syntax.
    `insert ProfilePatient(property)` where property is the json property:
    e.g. `insert ProfilePatient(subject)` or `insert ProfilePatient(patient)`
*/
RuleSet: ProfilePatient(property)
* {property} 1..1
* {property} only Reference(Patient)
* {property}.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. E.g. https://api.hip.digital.health.nz/fhir/Patient/ZZZ0008"
* {property}.type = "Patient"


/*
    Re-usable Practitioner component for use in profiles.
    Note that Patient and Practitioner references are used throughout the profiles
    The JSON property may differ dependong on the profile so insert the reference in the profile using the following syntax.
    `insert ProfilePractitioner(property)` where property is the json property:
    e.g. `insert ProfilePractitioner(asserter)` or `insert ProfilePractitioner(participant.individual)`
*/
RuleSet: ProfilePractitioner(property)
* {property} 1..1
* {property} only Reference(Practitioner)
* {property}.reference ^short = "Must be an absolute URL reference to the practitioner on the HPI system E.g. https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ"
* {property}.type = "Practitioner"

/*
    Sets up reference elements for an NHI Patient
    Usage in a FSH Instance:
    * subject insert Patient(ZKC7284, Carrey Carrington)
*/

RuleSet: Patient(nhi-id, nhi-name)
* type = "Patient"
* reference = "https://api.hip.digital.health.nz/fhir/Patient/{nhi-id}"
* display = "{nhi-name}"

/*
    HPI Practitioner
    Sets up reference elements for an HPI PPractitioner
    Usage in a FSH Instance:
    * subject insert Practitioner(91ZZXZ, DR Beverly Crusher)
*/
RuleSet: Practitioner(hpi-practitioner-id, hpi-practitioner-name)
* type = "Practitioner"
* reference = "https://api.hip.digital.health.nz/fhir/Practitioner/{hpi-practitioner-id}"
* display = "{hpi-practitioner-name}"

/*
    meta.source
    HPI Facility
*/
RuleSet: HPIFacility(hpi-facility-id)
* source = "https://api.hip.digital.health.nz/fhir/Location/{hpi-facility-id}"

RuleSet: MetaSource
* source ^short = "Captures the source of the record - please see description for details"
* source ^definition = "Captures the source of the record. If the record is sourced from a PMS the value should contain the HPIFacilityID
                            e.g. HPI Facility https://api.hip.digital.health.nz/fhir/Location/F38006-B
                            or HNZ System (AIR) https://api.air.digital.health.nz/fhir/"

RuleSet: LocalIdentifierDocs
* identifier 0..*
* identifier.system 1..1
* identifier.value 1..1
* identifier.use ^short = "The local identifier use SHOULD be set to secondary, where the SDHR resource id is considered the primary identifier."
* identifier.system ^short = "System for the local identifier. This MUST be consistent per PMS/Health Application"
* identifier.value ^short = "The actual local identifier value, e.g. ec2d6cad-1e19-46ee-accf-dc460a680710"
* identifier ^short = "A local identifier MAY be added to this section. If used, system MUST be specified."
* identifier ^definition = "A local identifier MAY be added to this section. This can be used to correlate the SDHR resource with a local system identifier to perform updates."
* identifier.system ^example[0].label = "Local Identifier System"
* identifier.system ^example[0].valueUri = "https://fhir.example.co.nz"
* identifier.value ^example[0].label = "Local Identifier Value"
* identifier.value ^example[0].valueString = "ec2d6cad-1e19-46ee-accf-dc460a680710"

RuleSet: LocalIdentifierExample
* identifier[+].system = "https://fhir.examplepms.co.nz"
* identifier[=].value = "ec2d6cad-1e19-46ee-accf-dc460a680710"
* identifier[=].use = #secondary

RuleSet: HealthRecordKey
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Health Record Key - unique persistent identifier for this clinical FHIR resource"
* identifier contains HealthRecordKey 0..1 MS
* identifier[HealthRecordKey].system = "https://standards.digital.health.nz/ns/health-record-key-id" (exactly)
* identifier[HealthRecordKey].use = #offical (exactly)
* identifier[HealthRecordKey].use ^short = "fixed to official"
* identifier[HealthRecordKey].value ^short = "The value of the identifier. Must be a GUID that is randomly generated to ensure collisions are avoided"
* identifier[HealthRecordKey] ^short = "Health Record Key - unique persistent identifier for this clinical FHIR resource"
* identifier[HealthRecordKey] ^definition = "This identifier should be created for each resource at the time of sending to the central repository and persisted by source systems against their view of the information. This allows a unique identifier for updates and tracking of the resource independent of the resource id and between systems"

RuleSet: UserSelected
* code.coding.userSelected 0..1
* code.coding.userSelected ^short = "Indicates that the value has been selected by a system user"
* code.coding.userSelected ^definition = "This field is used to maintain the code as selected by the source systems end user. For example, where a patient management system uses local codes or a non-common code set to record a substance or allergen this field indicates that the value is as selected by the system user. Some level of clinical interpretation may be required."