### Overview
{: .underlined}

This domain contains Condition records contributed by participating primary care providers to the SDHR Primary Care Collection.

### FHIR artifacts
{: .underlined}

> **FHIR artifacts**
>
> - [SDHR Condition profile](./StructureDefinition-SDHRCondition.html)
> - [Condition example](./Condition-ConditionHypertensionExample.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [FHIR artifact catalogue](./artifacts.html)

### Clinical description
{: .underlined}

Condition resources in SDHR reflect condition and classification information recorded in participating PMS systems. Depending on the PMS product and local workflow, this may include:

- diagnoses
- problems
- risk factors
- disabilities
- pregnancy information
- family history
- social history
- symptoms
- diseases

Some PMS systems record social history, family history and other contextual information as classifications that are mapped to FHIR Condition resources. As a result, not every Condition resource represents a confirmed diagnosis of the patient.

### Intended use
{: .underlined}

This domain provides a structured view of condition and classification information recorded by participating healthcare providers to support clinical assessment and continuity of care.

Information should be interpreted in the context of the patient's overall clinical history and other available health information.

### Source information
{: .underlined}

Participating PMS systems contribute this information to the SDHR Primary Care Collection. The PMS remains the system of record for contributed information.

Meaning and classification can vary between PMS products and local workflows, particularly for problem lists, diagnoses, social history and family history.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Conditions can disclose sensitive clinical and social information.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations
{: .underlined}

Accessing systems should display the recorded code or description, clinical status, verification status, relevant dates and provenance where available.

Inactive records may represent different clinical meanings, including resolved, in remission, refuted or entered-in-error. Systems should avoid presenting inactive or unverified records in a way that implies a current confirmed diagnosis.

Where coded values have been mapped or translated, source text and original user-selected text should be retained where available.

### Known limitations
{: .underlined}

Condition lists may be incomplete and may not reflect a fully reconciled clinical record. Data quality, coding practices and clinical workflows vary between contributing systems.

A missing Condition record may reflect source sharing controls, patient participation choices, confidentiality settings, local data entry practices, or information not being supplied by the source PMS.
