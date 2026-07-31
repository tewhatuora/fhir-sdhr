### Overview
{: .underlined}

This domain contains immunisation records sourced from a national immunisation information source.

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

- Immunisation information is expected to be sourced from a national immunisation information source.
- The contributing national system remains the source system for creation and maintenance of immunisation records.
- SDHR does not clinically reconcile, amend, or reinterpret immunisation records.
- Accessing systems should use coded FHIR content where available and present vaccine details, administration dates, status, source information, and provenance alongside immunisation records.
- Immunisation information is expected to be made available as part of a nationally governed immunisation record rather than through individual primary care systems.

### Privacy and confidentiality considerations
{: .underlined}

- Immunisation information is subject to SDHR privacy, security, access, audit, and purpose-of-use controls.
- Immunisation records may reveal sensitive information about a person's health status, risk factors, eligibility, participation in specific immunisation programmes, or aspects of their clinical history.
- Consumers may have privacy choices or restrictions applied through the source system or SDHR participation controls.
- Accessing systems should distinguish between records that are unavailable because access has been restricted and records that are genuinely absent.

### Clinical safety considerations
{: .underlined}

- Immunisation records should be interpreted in conjunction with vaccine details, administration dates, status, source information, and clinical context.
- Accessing systems should clearly present administered immunisations and any available status or provenance information.
- Absence of an immunisation record does not establish that a vaccine has not been administered.
- Vaccination decisions should consider the full clinical context, including patient history, applicable immunisation guidance, and information available from the source system.
- SDHR information does not replace clinical judgement or review of source records where these are required.

### Known limitations
{: .underlined}

- Implementation guidance for this domain is still under development.
- Source coverage, historical depth, update behaviour, and operational processes may evolve as implementation progresses.
- Immunisation records should not be assumed to represent a complete history unless supported by source-system guidance.
- Availability of specific data elements, status information, and provenance may vary depending on the source system and implementation approach.
- Access restrictions, privacy settings, or participation choices may affect the information available through SDHR.
