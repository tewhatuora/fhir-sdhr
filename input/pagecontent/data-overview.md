### Overview
{: .underlined}

SDHR provides access to core health information from participating primary care providers through the SDHR Primary Care Collection and from supported national health information sources. Each domain has distinct clinical meaning, source characteristics, privacy considerations, and known limitations.

The domain pages explain what information is available and how it should be interpreted. FHIR representation and profile-level requirements remain in [data models](./data-models.html) and the [FHIR artifact catalogue](./artifacts.html).

### Available domains
{: .underlined}

| Domain | Description | Status | Profile |
| --- | --- | --- | --- |
| [Allergies & Intolerances](./allergies-intolerances.html) | Recorded allergies, intolerances, adverse reactions, and related warnings | Available | [SDHR AllergyIntolerance](./StructureDefinition-SDHRAllergyIntolerance.html) |
| [Conditions](./conditions.html) | Recorded diagnoses, problems, and other condition-like classifications | Available | [SDHR Condition](./StructureDefinition-SDHRCondition.html) |
| [Observations](./observations.html) | Measurements, vital signs, and other measured or asserted findings | Available | [SDHR Observation](./StructureDefinition-SDHRObservation.html) |
| [Medications](./medications.html) | Prescribing intent and medicines supplied | In development | [SDHR MedicationRequest](./StructureDefinition-SDHRMedicationRequest.html)<br>[SDHR MedicationDispense](./StructureDefinition-SDHRMedicationDispense.html) |
| [Immunisations](./immunisations.html) | A patient's immunisation history | In development | [SDHR Immunization](./StructureDefinition-SDHRImmunization.html) |
{: .grid}

### Information sources
{: .underlined}

#### SDHR Primary Care Collection

The SDHR Primary Care Collection contains information contributed by participating PMS products. Its current scope includes:

- allergies and intolerances;
- conditions; and
- observations.

In future we expect to include encounters/appointments and (subject to further design and engagement) consultation notes from certain care settings.

#### National health information sources

SDHR supports information made available from national repositories and services. 

- medications (requests and dispenses); and
- immunisations

In the future we expect to include laboratory results and radiology reports, clinical documents from secondary care (e.g. discharge summaries, clinic letters, and referrals).

### Information governance
{: .underlined}

SDHR is not the system of record for the information it shares. Source systems remain responsible for creating, maintaining and correcting information.

### Clinical safety and interpretation
{: .underlined}

- Information should be interpreted within the wider clinical context.
- Information may originate from different systems and workflows.
- Information may be incomplete, duplicated or represented differently across systems.
- Provenance, status and dates are important to interpretation.
- Absence of information in SDHR does not establish that information does not exist elsewhere.
- Information should be verified where clinically required.

Information may be unavailable because:
- the source organisation does not participate in SDHR;
- the patient has exercised a participation or confidentiality choice;
- the information is outside the scope of currently connected data sources; or
- the information has not been contributed to SDHR.

### SDHR ID
{: .underlined}

Every resource in the SDHR Primary Care Collection is assigned an `id`. This identifier is guaranteed to be unique and is issued by the system when the resource is loaded. SDHR providers and consumers are expected to honour the `id` and use it as a unique reference when interacting with resources in SDHR.

#### Property specification: `id` (UUID v4)

| **Name** | **Type** | **Format** | **Description** |
|:-----|:-----|:-------|:------------|
| `id` | string | UUID (RFC 4122, v4) | Server-assigned, globally unique identifier. Immutable. Must be a valid UUID v4 in the canonical `8-4-4-4-12` form using lowercase hexadecimal characters. Example: `31d3b19e-760e-42df-aea6-9bddf81b4565`. |
{: .grid}

The `id`:

- is a valid RFC 4122 UUID v4;
- contains 32 hexadecimal digits displayed in five groups separated by hyphens, in the `8-4-4-4-12` format;
- conforms to the canonical pattern `xxxxxxxx-xxxx-4xxx-[8|9|a|b]xxx-xxxxxxxxxxxx`;
- is unique across all resources of this type;
- does not change over the lifetime of the resource; and
- is case-sensitive.

**Example**

`31d3b19e-760e-42df-aea6-9bddf81b4565`

**Regular expression**

`^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$`

The `id` is distinct from any resource `identifier`. In FHIR, an `identifier` holds an external business identifier, whereas the SDHR `id` is a server-assigned, guaranteed unique identifier.

**Truncated resource example**

```json
{
    "subject": {
        "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZMW6001",
        "type": "Patient"
    },
    "identifier": [
        {
            "value": "a49865c3-bba7-40e5-a476-2fd92abf3591",
            "system": "https://some.local.system/ehr-key"
        }
    ],
    "id": "31d3b19e-760e-42df-aea6-9bddf81b4565"
}
```
