/*
    Use this file to define RuleSet components for the IG.
    These are particularly useful for reusable components such
    as Patient(subject) and Practitioner(performer) references.
*/

/*
    Re-usable Patient component for use in profiles containing a `subject` json property.
    `insert ProfileSubjectPatient` will insert the following:
*/
RuleSet: ProfileSubjectPatient
* subject 1..1
* subject only Reference(Patient)
* subject.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. E.g. https://api.hip.digital.health.nz/fhir/Patient/ZZZ0008"
* subject.type = "Patient"

/*
    Re-usable Patient component for use in profiles containing a `patient` json property.
    `insert ProfilePatientPatient` will insert the following:
*/
RuleSet: ProfilePatientPatient
* patient 1..1
* patient only Reference(Patient)
* patient.reference ^short = "Must be an absolute URL reference to the patient on the NHI system. E.g. https://api.hip.digital.health.nz/fhir/Patient/ZZZ0008"
* patient.type = "Patient"


/*
    Sets up reference elements for an NHI Patient
    Usage in a FSH Instance:
    * subject insert PatientSubject(ZKC7284, Carrey Carrington)
*/

RuleSet: PatientSubject(nhi-id, nhi-name)
* type = "Patient"
* reference = "https://api.hip.digital.health.nz/fhir/Patient/{nhi-id}"
* display = "{nhi-name}"

/*
    HPI Practitioner
    Sets up reference elements for an HPI PPractitioner
    Usage in a FSH Instance:
    * subject insert PractitionerPerformer(91ZZXZ, DR Beverly Crusher)
*/
RuleSet: PractitionerPerformer(hpi-practitioner-id, hpi-practitioner-name)
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
