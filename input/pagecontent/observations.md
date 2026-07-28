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

Observations are physiological measurements, vital signs, and other measured or asserted findings relevant to the person's care, life stage, health risks, and conditions. Examples include:

- blood pressure;
- weight;
- body mass index (BMI);
- other vital signs; and
- other measurements or findings.

### Intended use
{: .underlined}

This domain supports review of individual measurements and trends. Interpretation requires the observation code, value, units, dates, and clinical context, together with the reference range, method, status, and provenance where supplied.

### Source information
{: .underlined}

- Participating PMS systems contribute this information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Coding, units, reference ranges, devices, precision, and recording practices may vary between source systems.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Observations may reveal sensitive clinical information even when an individual result appears routine.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations
{: .underlined}

- A value must be interpreted with its units, effective time, status, and clinical context.
- Accessing systems should preserve qualifiers and make corrected or amended results clear.
- Trends should account for changes in method, unit, source, and recording context.

### Known limitations
{: .underlined}

- Data quality, recency, coding, units, and clinical context may affect interpretation.
- Results may be absent, incomplete, corrected, entered manually, or recorded with varying precision.
- Reference ranges may be source-specific or absent.
