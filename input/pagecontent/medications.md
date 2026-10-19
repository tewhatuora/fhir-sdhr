### Overview
{: .underlined}

This domain provides a clinically focused, longitudinal view of prescribed and dispensed medicines. Medication information is sourced from the Medicines Data Repository (MDR).

### FHIR artifacts
{: .underlined}

> **FHIR artifacts**
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
- Prescribing and dispensing confidentiality controls are carried through to MDR
- Medication information can reveal sensitive details relating to mental health, oncology, infectious disease, reproductive health, pain management, or substance dependence.
- Inappropriate access, disclosure, or interpretation may contribute to stigma or bias and affect patient trust.
- Access must be auditable and meet the [compliance requirements for systems reading data](./compliance-requirements-reading.html).

### Search and paging behaviour
{: .underlined}

Medication searches require `patient`. Supply a valid NHI, `Patient/{NHI}`, or an absolute reference under `https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/`. Comma-separated patient values are accepted; repeated patient parameters are rejected.

| Parameter | Supported behaviour |
| --- | --- |
| `identifier` | Prescription-item business identifier, forwarded unchanged to MDR. See [medication resource IDs](./data-overview.html#medication-resource-ids). |
| `code` | Medication code, forwarded unchanged to MDR for matching. |
| `location` | Facility search value, forwarded unchanged to MDR for matching. |
| `status` | Restricted to the visible statuses described below. |
| `authoredon` | MedicationRequest prescription date filter. |
| `whenprepared`, `whenhandedover` | MedicationDispense date filters. |
| `_sort` | One date field: `authoredon` for requests; `whenprepared` or `whenhandedover` for dispenses. Prefix with `-` for descending order. |
| `_count` | Integer from 0 to 1000. `_count=0` returns `Bundle.total` without medication entries. Other medication search responses omit `Bundle.total`. |
| `_include` | Dispense searches support `MedicationDispense:prescription`. |
| `_revinclude` | Request searches support `MedicationDispense:prescription`. |
| `ct` | Continuation token supplied through a returned paging link. |

Unsupported parameters, including `_lastUpdated`, and empty parameter values return HTTP 400. Identifier, medication-code and facility matching are performed by MDR; SDHR does not reinterpret these values. Date matching is also performed by MDR.

Use repeated date parameters to express a range, for example:

- `GET /MedicationRequest?patient=ZZZ9994&authoredon=ge2024-01-01&authoredon=le2026-12-31`
- `GET /MedicationDispense?patient=ZZZ9994&whenprepared=ge2024-01-01&whenprepared=le2026-12-31`

Here `ge` includes dates on or after the lower bound, and `le` includes dates on or before the upper bound. For an identifier, code or facility search, supply the corresponding MDR search value, for example `GET /MedicationRequest?patient=ZZZ9994&identifier={prescription-item-identifier}`. Replace the placeholder with the actual identifier and URL-encode the query value.

Request searches default to `_sort=-authoredon` and statuses `active`, `on-hold`, `completed`, `stopped`, `draft` and `unknown`. Dispense searches default to `_sort=-whenprepared` and status `completed`. A supplied status filter is intersected with these sets; if no permitted status remains, the result is empty. SDHR also removes returned requests whose FHIR `status` is `cancelled`, `entered-in-error` or `error`, and non-completed dispenses. These status exclusions apply to searches; direct reads and version reads apply projection and consent checks but do not apply this search filter.

MedicationRequest.status is retained as supplied by MDR and is the value used for status filtering. SDHR also returns the optional `http://hl7.org.nz/fhir/StructureDefinition/nzeps-item-status` extension separately. Its value normally matches the standard status; for active prescriptions it may give a sub-status indicating whether repeats remain. SEHRs may use this additional detail to display a repeats-remaining flag. It does not replace or override the standard status.

SDHR always requests related prescriptions for dispense searches and related dispenses for request searches, even when the caller omits the include parameter. Consumers must distinguish matching entries from included resources using `entry.search.mode`.

Follow the returned Bundle paging links, which use SDHR URLs; treat continuation tokens as opaque. Filtering occurs within each MDR page. SDHR does not retrieve replacement records to fill a short page. An empty page does not establish that later pages contain no visible records. Medication search responses omit `Bundle.total` unless `_count=0` is requested. For `_count=0`, `Bundle.total` is the total number of query matches, not a page size. Do not infer the total from page length.

### Privacy response behaviour
{: .underlined}

Global SDHR participation checks apply across linked NHIs. Medication [domain participation](./consent-based-access.html#domain-participation) covers MedicationRequest and MedicationDispense together; a medication-domain opt-out denies access to both resource types. Medication resources labelled `R` or `V`, or belonging to a patient outside the linked patient group, are withheld. Facility opt-outs are checked against the prescription's `supportingInformation` location references. When any facility opt-out applies, prescriptions without usable facility information are also withheld.

Prescriptions and dispenses are assessed together. A withheld prescription causes linked dispenses to be withheld. A confidential or otherwise disallowed dispense can also cause its linked prescription to be withheld. When facility opt-outs exist, a dispense is withheld if its prescription references cannot be resolved to suitable prescriptions in the search Bundle. Direct dispense reads resolve the prescriptions through MDR and deny access when the required consent checks cannot be satisfied.

Whenever any facility opt-out exists for the patient or a linked NHI, medication searches include the [records-withheld-at-source OperationOutcome](./OperationOutcome-OperationOutcomeMedicationFacilityOptOut.html), even if no medication entries were removed or the search has no medication matches. This warning indicates that the history may be incomplete. It does not establish that this particular page had records removed.

When SDHR removes entries for medication privacy, the search response remains HTTP 200, carries `Bundle.meta.security` code `REDACTED`, and includes an informational `OperationOutcome` entry with issue code `suppressed`. Consumers should show that information was withheld, rather than treating the result as a complete medication history. Direct reads denied by consent return HTTP 403.

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
- Practical historical limits reflect current MDR availability.
