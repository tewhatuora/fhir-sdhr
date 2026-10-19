### Overview
{: .underlined}

This domain contains immunisation records sourced from the Aotearoa Immunisation Register (AIR).

### FHIR artifacts
{: .underlined}

> **FHIR artifacts**
>
> - [SDHR Immunization profile](./StructureDefinition-SDHRImmunization.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [FHIR artifact catalogue](./artifacts.html)

### Clinical description
{: .underlined}

Immunisation records document vaccines administered to a person and form part of their longitudinal immunisation history.

Immunisation information supports understanding of vaccination status, previous vaccine administration, and related clinical decision-making across primary, community, hospital, outreach, telehealth, and after-hours care settings.

### Intended use
{: .underlined}

This domain supports visibility of a person's immunisation history and immunisation status.

Immunisation information may support:

- vaccination planning and administration;
- avoidance of unnecessary duplicate vaccination;
- identification of missed or overdue immunisations;
- assessment of protection against vaccine-preventable diseases;
- continuity of care across care settings; and
- clinical decision-making in high-risk, urgent, or transient care situations.

Immunisation information from SDHR should be treated as shared clinical context and does not replace clinical assessment, local documentation, or review of source records where these are required.

### Source information
{: .underlined}

- Immunisation information is sourced from AIR, which holds national immunisation information.
- AIR remains the source system for creation and maintenance of immunisation records.
- SDHR does not clinically reconcile, amend, or reinterpret immunisation records.
- Accessing systems should use coded FHIR content where available and present vaccine details, administration dates, status, source information, and provenance alongside immunisation records.

### Privacy and confidentiality considerations
{: .underlined}

- Immunisation information is subject to SDHR privacy, security, access, audit, and purpose-of-use controls.
- Immunisation records may reveal sensitive information about a person's health status, risk factors, eligibility, participation in specific immunisation programmes, or aspects of their clinical history.
- Patients may have applied privacy choices or restrictions through AIR (by choosing 'restricted access') or SDHR participation controls.
- Accessing systems should distinguish between records that are unavailable because access has been restricted and records that are genuinely absent.

### Search and result behaviour
{: .underlined}

Immunization searches require `patient`. AIR receives the originally requested NHI and resolves linked NHIs for its records. SDHR does not combine separate AIR searches for linked NHIs.

| Parameter | Supported behaviour |
| --- | --- |
| `date` | Occurrence date filter, applied by SDHR. Supports `eq`, `ge`, `gt`, `le` and `lt`; repeat the parameter for a range. Unprefixed values use `eq`, matching the UTC calendar day. |
| `location` | Facility identifier or reference, applied by SDHR. |
| `vaccine-code` | Token match against `vaccineCode` using `system\|code` or bare `code`. |
| `product` | Token match against the AIR administered-product extension, using `system\|code` or bare `code`; distinct from `vaccine-code`. |
| `vaccine-code:text`, `product:text` | Case-insensitive substring match against the relevant concept text or coding display, applied by SDHR. |
| `target-disease`, `status`, `status-reason` | Forwarded to AIR. |
| `_sort` | `date` for oldest first or `-date` for newest first. Default: newest first. |

Other parameters and modifiers, or unsupported date comparators, return HTTP 400. In particular, `_count`, `_include` and `_revinclude` are not accepted. Records marked `entered-in-error` are removed from search results. Records without a parseable occurrence date sort last in descending order and first in ascending order.

SDHR filters the Bundle returned by one AIR call and does not retrieve extra pages or create SDHR pages. Any paging links supplied by AIR are passed through without rewriting them for the local filters. Normally, `Bundle.total` is the number of visible Immunization entries after filtering. If AIR supplies `meta.security`, SDHR retains AIR's total, or uses zero when AIR omits it; the total may therefore differ from the number of visible entries.

### Restricted access responses
{: .underlined}

Global SDHR participation checks apply across linked NHIs, while AIR applies its own Restricted Access rules. When AIR returns `Bundle.meta.security` code `REDACTED`, SDHR preserves it. Existing AIR outcome entries are retained. If AIR supplies no outcome entry, SDHR adds an informational `OperationOutcome` with issue code `informational` and details code `sdhr-records-withheld-at-source` from `https://fhir-ig.digital.health.nz/sdhr/CodeSystem/sdhr-outcome-codes`.

Consumers must inspect Bundle security metadata and outcome entries before interpreting an empty result as an absence of immunisation records.

### Clinical safety considerations
{: .underlined}

- Immunisation records should be interpreted in conjunction with vaccine details, administration dates, status, source information, and clinical context.
- Accessing systems should clearly present administered immunisations and any available status or provenance information.
- Absence of an immunisation record does not establish that a vaccine has not been administered.
- Vaccination decisions should consider the full clinical context, including patient history, applicable immunisation guidance, and information available from the source system.
- SDHR information does not replace clinical judgement or review of source records where these are required.

### Known limitations
{: .underlined}

- Source coverage, historical depth, update behaviour, and operational processes may evolve as implementation progresses.
- Immunisation records should not be assumed to represent a complete history.
- Availability of specific data elements, status information, and provenance may vary depending on the source system and implementation approach.
- Access restrictions, privacy settings, or participation choices may affect the information available through SDHR.
