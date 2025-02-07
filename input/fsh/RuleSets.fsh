/*
    Use this file to define RuleSet components for the IG.
    These are particularly useful for reusable components such
    as Patient(subject) and Practitioner(performer) references.
*/

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