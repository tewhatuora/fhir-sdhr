### Overview
{: .underlined}

This domain contains Observation records contributed by participating primary care providers to the SDHR Primary Care Collection.

### FHIR artifacts
{: .underlined}

> **FHIR Artifacts**
>
> - [SDHR Observation profile](./StructureDefinition-SDHRObservation.html)
> - [Vital signs example](./Observation-ObservationVitalSignsExample.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [FHIR artifact catalogue](./artifacts.html)

### Clinical description
{: .underlined}

Observations are measurements, assessments, and findings recorded during care.

For the initial SDHR release, this domain is primarily intended to support sharing of vital signs and related physical measurements, including:

- blood pressure;
- pulse and heart rate;
- respiratory rate;
- temperature;
- oxygen saturation;
- weight; and
- height or length.

Source systems may also record other observation types using local coding and workflows.

### Intended use
{: .underlined}

This domain supports review of individual measurements and trends over time.

Observation data should be interpreted in conjunction with the observation code, result value, units, effective date and time, clinical context, status, and source information. Where available, reference ranges, methods, devices, and provenance may provide additional context for interpretation.

Observation information from SDHR should be treated as shared clinical context. It does not replace clinical assessment, local documentation, or review of source records where these are required.

### Source information
{: .underlined}

- Participating PMS systems contribute this information to the SDHR Primary Care Collection.
- The contributing PMS remains the source system for creation and maintenance of observation records.
- SDHR does not clinically reconcile, recalculate, or reinterpret contributed observations.
- Coding, units, reference ranges, devices, precision, and recording practices may vary between source systems.
- Accessing systems should use coded FHIR content where available and present units, dates, status, source information, and provenance alongside observation results.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Observation records may reveal sensitive information about a person's health status, risks, or care history, even when an individual result appears routine.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations
{: .underlined}

- Observation values must always be interpreted with their units, effective date and time, status, and clinical context.
- Accessing systems should present observation codes, values, units, and dates clearly and preserve important qualifiers where supplied.
- Trends should account for changes in recording practices, units, methods, devices, source systems, and clinical context.
- Absence of an observation does not establish that a measurement was not performed, was normal, or was not clinically relevant.
- SDHR information does not replace clinical judgement, direct patient assessment, or review of source records where these are required.

### Known limitations
{: .underlined}

- Different PMS systems may use different coding approaches to identify and classify observations.
- Data quality, recency, coding, units, and available clinical context may affect interpretation.
- Results may be absent, incomplete, corrected, entered manually, or recorded with varying levels of precision.
- Reference ranges, methods, devices, performer information, and supporting context may be absent or inconsistently recorded.
- Some source systems cannot reliably distinguish all observation types using standard terminology, which may affect filtering and categorisation of observations.
- Observation data should not be assumed to represent a complete view of all measurements or findings recorded about a person.