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
* {property}.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. See constraints for details."
* {property}.type = "Patient"
* {property}.type 1..1
* {property}.reference 1..1
* {property}.reference obeys nhi-url-format

Invariant: nhi-url-format
Description: "Reference must be an NHI Patient URL with format https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1111 or ZZZ11AA"
Expression: "matches('^https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/[A-Z]{3}([0-9]{4}|[0-9]{2}[A-Z]{2})$')"
Severity: #error

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
* {property}.reference ^short = "Must be an absolute URL reference to the practitioner on the HPI system. See constraints for details."
* {property}.type = "Practitioner"
* {property}.reference obeys hpi-url-format

Invariant: hpi-url-format
Description: "Reference must be an HPI Practitioner URL with format https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/11AAAA"
Expression: "matches('^https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/[0-9]{2}[A-Z]{4}$')"
Severity: #error


/*
    Sets up reference elements for an NHI Patient
    Usage in a FSH Instance:
    * subject insert Patient(ZKC7284, Sage Westbrook)
*/

RuleSet: Patient(nhi-id, nhi-name)
* type = "Patient"
* reference = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/{nhi-id}"
* display = "{nhi-name}"

/*
    HPI Practitioner
    Sets up reference elements for an HPI PPractitioner
    Usage in a FSH Instance:
    * subject insert Practitioner(91ZZXZ, DR Beverly Crusher)
*/
RuleSet: Practitioner(hpi-practitioner-id, hpi-practitioner-name)
* type = "Practitioner"
* reference = "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/{hpi-practitioner-id}"
* display = "{hpi-practitioner-name}"

/*
    meta.source
    HPI Facility
*/
RuleSet: HPIFacility(hpi-facility-id)
* source = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/{hpi-facility-id}"

RuleSet: MetaSource
* source 1..1
* source ^short = "Captures the source of the record - please see description for details"
* source ^definition = "Captures the source of the record. This must contain the HPIFacilityID
                            e.g. https://api.hip.digital.health.nz/fhir/hpi/v1/Location/F38006-B"

Invariant: hpi-location-url-format
Description: "Reference must be an HPI Location URL with format https://api.hip.digital.health.nz/fhir/hpi/v1/Location/A1111-A"
Expression: "matches('^https://api.hip.digital.health.nz/fhir/hpi/v1/Location/[A-Z]{1}[0-9]{5}-[A-Z]{1}$')"
Severity: #error

Invariant: code-or-note-required
Description: "The AllergyIntolerance resource must have at least one of 'code' or 'note'."
Expression: "(code.exists() or note.exists())"
Severity: #error

RuleSet: MetaTag
* tag 0..*
* tag ^short = "Tag the resource with a code to indicate usability components of the resource"
* tag ^definition = "Tag the resource with a code to indicate usability components of the resource. This is used to indicate that the resource is important and, for example, should be highlighted in a user interface."
* tag from sdhr-resource-tags-valueset (preferred)

RuleSet: MetaTagExample
* tag[+].system = "https://standards.digital.health.nz/ns/sdhr-resource-tags"
* tag[=].code = #highlighted
* tag[=].display = "Highlighted"

RuleSet: LocalIdentifierDocs
* identifier 1..*
* identifier.system 1..1
* identifier.value 1..1
* identifier.use ^short = "The local identifier use SHOULD be set to secondary, where the SDHR resource id is considered the primary identifier."
* identifier.system ^short = "System for the local identifier. This MUST be consistent per PMS/Health Application"
* identifier.value ^short = "The actual local identifier value, e.g. ec2d6cad-1e19-46ee-accf-dc460a680710"
* identifier ^short = "A local identifier MUST be added to this section. If used, system MUST be specified."
* identifier ^definition = "A local identifier MUST be added to this section. This can be used to correlate the SDHR resource with a local system identifier to perform updates."
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

// sets up Coding referencing a code in the local RF codesystem
RuleSet: SDHRCoding(code-value,display)
* coding.system = Canonical(SDHRCodeSystem)
* coding.code = #{code-value}
* coding.display = "{display}"

RuleSet: HNZSDHRClientLastUpdated(dateTime)
* url = "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension"
* valueDateTime = "{dateTime}"

RuleSet: HNZSDHRHighlighted(highlighted)
* url = "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-highlighted-extension"
* valueBoolean = {highlighted}


Invariant: one-patient-only
Description: "All Patient references in the bundle are the same (compares full reference strings)."
Severity: #error
Expression: "entry.resource.descendants().where($this is Reference).reference.where(matches('(^|.*/)?Patient/[^/]+$')).exists() and entry.resource.descendants().where($this is Reference).reference.where(matches('(^|.*/)?Patient/[^/]+$')).distinct().count() = 1"

Invariant: no-participation-ops
Description: "Bundle entries MUST NOT invoke $participate or $hnz-participate."
Severity: #error
Expression: "entry.request.url.where($this.matches('[$](participate|hnz-participate)')).exists().not()"