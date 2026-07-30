### Overview
{: .underlined}

This domain provides a clinically focused, longitudinal view of prescribed and dispensed medicines. Medication information is planned to be made available from a national health information source.

### FHIR artifacts
{: .underlined}

> **FHIR Artifacts**
>
> - [SDHR MedicationRequest profile](./StructureDefinition-SDHRMedicationRequest.html)
> - [SDHR MedicationDispense profile](./StructureDefinition-SDHRMedicationDispense.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [FHIR artifact catalogue](./artifacts.html)

### Clinical description
{: .underlined}

#### Medication requests

Medication Requests represent prescribing intent. They describe medicines that a clinician intended to prescribe but do not establish that the medicine was dispensed or used.

#### Medication dispenses

Medication Dispenses represent medicines supplied. They are a stronger indicator of supply than prescription information but do not establish collection, ingestion, or adherence.

> **Clinical interpretation:** Prescription information represents clinical intent. Dispensed information represents medicines supplied. Neither confirms that a medicine was taken as directed.

### Intended use
{: .underlined}

- Review what was prescribed and what was dispensed.
- Use medication information with other clinical context, including allergies, laboratory results, observations, and conditions.
- Review longer history where long-term therapy, cumulative exposure, or previous ineffective treatment may be clinically relevant. A recent history of approximately two to three years supports many, though not all, clinical purposes.

### Source information
{: .underlined}

- Medication information is sourced from the national Medicines Data Repository (MDR) through its FHIR API.
- MDR contains prescribing and dispensing information from NZePS-integrated systems.
- MDR remains the source system for creation and maintenance of medication information made available through this domain.
- SDHR does not clinically reconcile, amend, or reinterpret medication information sourced from MDR.
- Current NZePS-integrated sources include almost all New Zealand general practices, all New Zealand community pharmacies, several specialist prescribing systems, and an expanding set of secondary-care systems used primarily for outpatient prescribing.
- Source-system implementation and workflow differences affect completeness and behaviour.
- MDR dispense dates reflect pharmacy preparation and may differ from the date the patient received the medicine.
- Administered medicines are not recorded in NZePS, including medicines administered in many inpatient, outpatient, and clinic settings.

### Privacy and confidentiality considerations
{: .underlined}

- MDR may contain confidential records.
- Prescribing and dispensing confidentiality controls can be carried through to MDR, but their interpretation may vary according to how NZePS-integrated systems map confidentiality options.
- Historical records reflect the patient's confidentiality choices, or the source system's knowledge of those choices, when the record was created and may not reflect current choices.
- Medication information can reveal sensitive details relating to mental health, oncology, infectious disease, reproductive health, pain management, or substance dependence.
- Inappropriate access, disclosure, or interpretation may contribute to stigma or bias and affect patient trust.
- Access must be auditable and meet the [compliance requirements for systems reading data](./compliance-requirements-reading.html).

### Clinical safety considerations
{: .underlined}

- Medication information should be interpreted in conjunction with medicines reconciliation, clinical context, and direct confirmation with the patient where appropriate.
- Applications should make status, dates, provenance, and related information easy to identify.
- Prescriptions cancelled or invalidated before supply should be excluded where this reduces misinterpretation risk.
- Dispenses prepared and subsequently reversed because they were not collected are omitted.
- Limited historical depth may lead to repetition of an ineffective or inappropriate medicine trial.

### Known limitations
{: .underlined}

- Medication lists may be incomplete and are not necessarily reconciled.
- Data completeness varies with NZePS integration, source-system workflows, and data quality.
- Feedback mechanisms for correcting or annotating inaccurate medication information are limited.
- Administered medicines are outside NZePS coverage.
- Practical historical limits reflect current MDR availability and the risk-managed SDHR scope.
