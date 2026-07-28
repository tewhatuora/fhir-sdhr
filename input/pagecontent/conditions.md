### Overview
{: .underlined}

This domain contains Condition records contributed by participating primary care providers to the SDHR Primary Care Collection.

### FHIR artifacts
{: .underlined}

> **FHIR Artifacts**
>
> - [SDHR Condition profile](./StructureDefinition-SDHRCondition.html)
> - [Condition example](./Condition-ConditionHypertensionExample.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [FHIR artifact catalogue](./artifacts.html)

### Clinical description
{: .underlined}

Depending on PMS data models and workflows, Condition resources may contain:

- diagnoses;
- problems;
- risk factors;
- disabilities;
- family history; and
- social history.

They may also include classifications, symptoms, diseases, or pregnancy information. Some PMS systems record social and family history as classifications that map to FHIR `Condition`. Not every Condition represents a confirmed diagnosis of the patient.

### Intended use
{: .underlined}

This domain provides a structured view of recorded current and historical conditions to support clinical assessment and continuity of care.

### Source information
{: .underlined}

- Participating PMS systems contribute this information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Meaning and classification vary between PMS products and local workflows, particularly for problem lists, diagnoses, social history, and family history.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Conditions can disclose sensitive clinical and social information.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations
{: .underlined}

- Accessing systems should display coded meaning, clinical status, verification status, date, and provenance where available.
- Systems must not present every Condition as a confirmed diagnosis of the patient.

### Known limitations
{: .underlined}

- Condition lists may be incomplete or may not have been clinically reconciled.
- A record may be inactive, resolved, provisional, entered in error, or recorded at a different level of specificity.
- PMS products and local workflows may classify the same information differently.
