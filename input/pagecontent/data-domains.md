# Data Domains

## Overview

SDHR makes selected patient health information available from the SDHR Primary Care Collection and national health information sources. Each data domain has its own clinical meaning, source-system characteristics, confidentiality considerations, and implementation limitations.

This page provides domain-level guidance to help implementers understand the information made available through SDHR. FHIR representation and profile-level requirements are documented in [Data Models](./data-models.html) and [FHIR Artifacts](./artifacts.html). Technical interactions are documented in the [API documentation](./api.html).

## Allergies and Intolerances

### Overview

Allergy and intolerance records contributed by participating primary care providers are available from the SDHR Primary Care Collection.

### Clinical description

An allergy or intolerance is a harmful or undesirable physiological response specific to an individual and associated with exposure to a substance. Source systems may use related terms such as adverse reaction, adverse drug reaction, adverse event, medical warning, alert, or side effect.

### Intended use

This domain supports review of known allergies and intolerances, including assessment of potential risk when planning treatment, prescribing, dispensing, or administering a substance.

### Source information

- Participating PMS systems contribute the current information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Source terminology and workflows may represent allergies, intolerances, adverse reactions, and warnings differently.
- Accessing systems should use coded FHIR content and provenance rather than relying only on display labels.

### Confidentiality and privacy considerations

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Allergy and intolerance records cannot currently be marked confidential at the individual record or domain level in the source workflow.
- Accessing systems must not assume that the absence of a confidentiality marker means the information is non-sensitive.

### Clinical safety considerations

- Allergy and intolerance information should be clinically verified where required.
- Accessing systems should make substance, reaction, clinical status, verification status, date, and source clear where available.
- SDHR information does not replace local medicines reconciliation or direct confirmation with the patient where these are required.

### Known limitations

- Records may be incomplete, duplicated, entered at different levels of clinical certainty, or represented differently by contributing PMS systems.
- Absence of a record does not establish that the patient has no known allergy or intolerance.

### Related FHIR profiles

- [SDHR AllergyIntolerance profile](./StructureDefinition-SDHRAllergyIntolerance.html)
- [Data Models](./data-models.html)
- [Resource interaction catalogue](./api.html#resource-interaction-catalogue)

## Conditions

### Overview

Condition records contributed by participating primary care providers are available from the SDHR Primary Care Collection.

### Clinical description

This domain may contain problems, diagnoses, classifications, symptoms, disabilities, diseases, pregnancy, risk factors, social history, and family history. It can include clinical and non-clinical concepts because some PMS systems record social and family history as classifications that map to FHIR `Condition`.

### Intended use

This domain provides a structured view of recorded current and historical conditions to support clinical assessment and continuity of care.

### Source information

- Participating PMS systems contribute the current information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Meaning and classification vary between PMS products and local workflows, particularly for problem lists, diagnoses, social history, and family history.

### Confidentiality and privacy considerations

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Conditions can disclose sensitive clinical and social information.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations

- Accessing systems should display coded meaning, clinical status, verification status, date, and provenance where available.
- Systems must not assume that every Condition represents a confirmed diagnosis of the patient.
- Condition information should be interpreted with other available clinical context.

### Known limitations

- Condition lists may be incomplete or may not have been clinically reconciled.
- A record may be inactive, resolved, provisional, entered in error, or recorded at a different level of specificity.
- Absence of a condition does not establish that the condition is not present.

### Related FHIR profiles

- [SDHR Condition profile](./StructureDefinition-SDHRCondition.html)
- [Data Models](./data-models.html)
- [Resource interaction catalogue](./api.html#resource-interaction-catalogue)

## Observations

### Overview

Observation records contributed by participating primary care providers are available from the SDHR Primary Care Collection.

### Clinical description

Observations are physiological measurements, vital signs, and other measured or asserted findings relevant to the person's care, life stage, health risks, and conditions.

### Intended use

This domain supports review of measurements and trends when interpreted with the observation code, value, units, effective time, reference range, method, status, context, and provenance supplied in the resource.

### Source information

- Participating PMS systems contribute the current information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Coding, units, reference ranges, devices, precision, and recording practices may vary between source systems.

### Confidentiality and privacy considerations

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Observations may reveal sensitive clinical information even when an individual result appears routine.
- Information marked confidential, sensitive, or excluded from sharing in the source PMS must not be contributed.

### Clinical safety considerations

- A value must be interpreted with its units, effective time, status, and clinical context.
- Accessing systems should preserve qualifiers and make corrected or amended results clear.
- Trends should account for changes in method, unit, source, and recording context.

### Known limitations

- Data quality, recency, coding, units, and clinical context may affect interpretation.
- Results may be absent, incomplete, corrected, entered manually, or recorded with varying precision.
- Reference ranges may be source-specific or absent.
- Absence of an observation does not establish that the measurement was not performed elsewhere.

### Related FHIR profiles

- [SDHR Observation profile](./StructureDefinition-SDHRObservation.html)
- [Data Models](./data-models.html)
- [Resource interaction catalogue](./api.html#resource-interaction-catalogue)

## Medications

> **In development:** Medication requests and medication dispenses are planned to be made available from a national health information source.

### Overview

SDHR medications represent a clinically focused, longitudinal view of prescribed and dispensed medicines. Practical historical limits reflect current Medicines Data Repository (MDR) availability and the risk-managed SDHR scope.

### Clinical description

This domain contains:

- prescribed medicines, represented as medication requests; and
- dispensed medicines, represented as medication dispenses.

It supports understanding of what was prescribed, what was dispensed, and how medicines use may relate to clinical presentation, safety risks, and treatment decisions. Source and presentation systems may use terms such as medicines, medication history, prescribed and dispensed medicines, or patient medications.

### Intended use

- Use dispensed information as a stronger indicator of medicines supplied than prescription information, while recognising that a dispense does not confirm collection, ingestion, or adherence.
- Use prescription information as evidence of clinical intent, while recognising that it may not reflect actual use.
- Interpret medication information with other clinical context, including allergies, laboratory results, observations, and conditions.
- Review longer history where long-term therapy, cumulative exposure, or previous ineffective treatment may be clinically relevant. A recent history of approximately two to three years supports many, though not all, clinical purposes.

### Source information

- Medication information is sourced from the national MDR through its FHIR API.
- MDR data contains prescribing and dispensing information from NZePS-integrated systems.
- Current NZePS-integrated sources include almost all New Zealand general practices, all New Zealand community pharmacies, several specialist prescribing systems, and an expanding set of secondary-care systems used primarily for outpatient prescribing.
- Source-system implementation and workflow differences affect completeness and behaviour.
- MDR dispense dates reflect pharmacy preparation and may differ from the date the patient received the medicine.
- Administered medicines are not recorded in NZePS, including medicines administered in many inpatient, outpatient, and clinic settings.

### Confidentiality and privacy considerations

- MDR may contain confidential records.
- Prescribing and dispensing confidentiality controls can be carried through to MDR, but their interpretation may vary according to how NZePS-integrated systems map confidentiality options.
- Historical records reflect the patient's confidentiality choices, or the source system's knowledge of those choices, when the record was created and may not reflect current choices.
- Medication information can reveal sensitive details relating to mental health, oncology, infectious disease, reproductive health, pain management, or substance dependence.
- Inappropriate access, disclosure, or interpretation may contribute to stigma or bias and affect patient trust.
- Access must be auditable and meet the [compliance requirements for systems reading data](./compliance-requirements-reading.html).

### Clinical safety considerations

- Medication information must be interpreted with sufficient clinical context and medicines reconciliation.
- The user interface has a material effect on safety. Applications should make status, dates, provenance, and related information easy to identify.
- Incomplete records can lead to incorrect assumptions about adherence, treatment failure, or therapeutic intent.
- Prescriptions cancelled or invalidated before supply should be excluded where this reduces misinterpretation risk.
- Dispenses prepared and subsequently reversed because they were not collected are omitted.
- Limited historical depth may lead to repetition of an ineffective or inappropriate medicine trial.

### Known limitations

- Medication lists may be incomplete and are not necessarily reconciled.
- A dispense does not confirm that the medicine was collected, taken, or taken as directed.
- A prescription records clinical intent but may not reflect actual use.
- Data completeness varies with NZePS integration, source-system workflows, and data quality.
- Feedback mechanisms for correcting or annotating inaccurate medication information are limited.
- Administered medicines are outside NZePS coverage.

### Related FHIR profiles

- [SDHR MedicationRequest profile](./StructureDefinition-SDHRMedicationRequest.html)
- [SDHR MedicationDispense profile](./StructureDefinition-SDHRMedicationDispense.html)
- [Data Models](./data-models.html)
- [Resource interaction catalogue](./api.html#resource-interaction-catalogue)

## Immunisations

> **In development:** Immunisation domain guidance is under development. This section will describe the clinical meaning, intended use, source information, confidentiality considerations, safety considerations, and known limitations for immunisation information made available through SDHR.

### Overview

Immunisation information is planned to be made available from a national health information source. Authoritative implementation guidance is not yet available in this IG.

### Clinical description

Under development.

### Intended use

Under development.

### Source information

Under development.

### Confidentiality and privacy considerations

Under development. Accessing systems must apply the privacy, confidentiality, security, access, and audit controls defined for SDHR and must not assume immunisation information is non-sensitive.

### Clinical safety considerations

Under development. Implementers must not make production assumptions from this placeholder.

### Known limitations

Authoritative source coverage, historical depth, update behaviour, and data quality guidance are under development.

### Related FHIR profiles

- [SDHR Immunization profile](./StructureDefinition-SDHRImmunization.html)
- [Data Models](./data-models.html)
- [Resource interaction catalogue](./api.html#resource-interaction-catalogue)
