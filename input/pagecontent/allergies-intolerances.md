### Overview
{: .underlined}

This domain contains allergy and intolerance information contributed by participating primary care providers to the SDHR Primary Care Collection.

### FHIR artifacts
{: .underlined}

> **FHIR Artifacts**
>
> - [SDHR AllergyIntolerance RAllergyIntolerance.html
> - [/AllergyIntolerance-AllergyIntoleranceExample.html
> - [Search parameters and ehaviour
> - [Resource interactionsteraction-catalogue
> - [Terminologyhtml

### Clinical description
{: .underlined}

An allergy or intolerance is a harmful or undesirable physiological response specific to an individual and associated with exposure to a substance.

Source systems may use related terms such as adverse reaction, adverse drug reaction, adverse event, medical warning, alert, or side effect. PMS systems may model and represent these concepts differently, and the clinical certainty and current relevance of individual records may vary.

### Intended use
{: .underlined}

This domain supports clinical review of known allergies and intolerances, including assessment of potential risk when planning treatment, prescribing, dispensing, or administering medicines, vaccines, products, or other substances.

Allergy and intolerance information from SDHR should be treated as shared clinical context. It may support safer care, particularly in unplanned or urgent care settings, but it does not replace local medicines reconciliation, allergy verification, prescribing safety checks, or direct confirmation with the patient where these are required.

### Source information
{: .underlined}

- Participating PMS systems contribute this information to the SDHR Primary Care Collection.
- The contributing PMS remains the source system for creation and maintenance of allergy and intolerance information.
- SDHR does not clinically reconcile, correct, or reclassify contributed allergy and intolerance records.
- Source terminology and workflows may represent allergies, intolerances, adverse reactions, warnings, and "no known allergies" differently.
- Accessing systems should use coded FHIR content where available, but should also present relevant original text, notes, dates, source information, and provenance.

### Privacy and confidentiality considerations
{: .underlined}

- Primary care information is contributed subject to patient participation choices and source sharing controls.
- Allergy and intolerance records cannot currently be marked confidential at the individual record or domain level in the source workflow.
- Accessing systems must not assume that the absence of a confidentiality marker means the information is non-sensitive.

### Clinical safety considerations
{: .underlined}

- Accessing systems should make the substance, reaction or manifestation, notes, clinical status, verification status, dates, source, and provenance clear where available.
- In some source records, the most clinically useful substance or reaction information may be present only in free text.
- Type, category, clinical status, and verification status may be missing or used inconsistently by source systems and should be interpreted in context with the full record.
- SDHR information does not replace local medicines reconciliation, allergy verification, prescribing safety checks, or direct confirmation with the patient where these are required.

### Known limitations
{: .underlined}

- Different PMS systems may model allergies, intolerances, warnings, adverse reactions, and "no known allergies" differently.
- Records may be incomplete, duplicated, entered at different levels of clinical certainty, or represented differently by contributing PMS systems.
- Structured coding of causative substances and reaction manifestations is not consistently available across source systems.
- Both active and inactive records may be returned. Accessing systems should present status clearly and avoid assuming inactive records are clinically irrelevant.
- Absence of a record does not establish that the patient has no known allergy or intolerance.
- Some records may represent negated allergy statements (for example, "no known allergies") rather than a positive allergy or intolerance.
``