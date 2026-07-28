### Overview
{: .underlined}

This domain contains allergy and intolerance information contributed by participating primary care providers to the SDHR Primary Care Collection.

### FHIR artifacts
{: .underlined}

> **FHIR Artifacts**
>
> - [SDHR AllergyIntolerance profile](./StructureDefinition-SDHRAllergyIntolerance.html)
> - [AllergyIntolerance examples](./AllergyIntolerance-AllergyIntoleranceExample.html)
> - [Search parameters and behaviour](./api.html#api-search-behaviour)
> - [Resource interactions](./api.html#resource-interaction-catalogue)
> - [Terminology bindings and artifacts](./artifacts.html)

### Clinical description
{: .underlined}

An allergy or intolerance is a harmful or undesirable physiological response specific to an individual and associated with exposure to a substance. Source systems may use related terms such as adverse reaction, adverse drug reaction, adverse event, medical warning, alert, or side effect. PMS systems may model these concepts differently, and the clinical certainty of individual records varies.

### Intended use
{: .underlined}

This domain supports review of known allergies and intolerances, including assessment of potential risk when planning treatment, prescribing, dispensing, or administering a substance.

### Source information
{: .underlined}

- Participating PMS systems contribute this information to the SDHR Primary Care Collection.
- The PMS remains the source system for contributed information.
- Source terminology and workflows may represent allergies, intolerances, adverse reactions, and warnings differently.
- Accessing systems should use coded FHIR content and provenance rather than relying only on display labels.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Allergy and intolerance records cannot currently be marked confidential at the individual record or domain level in the source workflow.
- Accessing systems must not assume that the absence of a confidentiality marker means the information is non-sensitive.

### Clinical safety considerations
{: .underlined}

- Accessing systems should make the substance, reaction, clinical status, verification status, date, and source clear where available.
- SDHR information does not replace local medicines reconciliation or direct confirmation with the patient where these are required.

### Known limitations
{: .underlined}

- Different PMS systems may model allergies, intolerances, warnings, and adverse reactions differently.
- Records may be incomplete, duplicated, entered at different levels of clinical certainty, or represented differently by contributing PMS systems.
- Absence of a record does not establish that the patient has no known allergy or intolerance.
