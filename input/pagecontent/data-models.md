### FHIR Data Models

This section provides an overview of the design of the FHIR data representations that authorised applications can use to record and interchange shared digital health record information.

#### Shared Digital Health Record ID

Every resource in the Shared Digital Health Record is assigned an id. This id is guaranteed to be unique and is issued by the system when the resource is loaded. It is expected that SDHR providers and consumers honour this id and use it as a unique reference whenever interracting with resources in the SDHR. See below for the technical specification for this property

##### Property Specification: id (UUID v4)

| **Name** | **Type** | **Format** | **Description** |
|:-----|:-----|:-------|:------------|
| id | string | uuid (RFC 4122, v4) | Server-assigned, globally unique identifier. Immutable. Must be a valid UUID v4 in the canonical `8-4-4-4-12` form (lowercase hex). Example: `31d3b19e-760e-42df-aea6-9bddf81b4565`. |
 

Details:
- Is a valid RFC 4122 UUID v4.
- Contains 32 hexadecimal digits displayed in 5 groups separated by hyphens, in the format:

`8-4-4-4-12`

Must conform to the following canonical example pattern:

`xxxxxxxx-xxxx-4xxx-[8|9|a|b]xxx-xxxxxxxxxxxx`

- Is unique across all resources of this type.
- Will not change over the lifetime of the resource.
- Is **case-sensitive**.

**Example**

`31d3b19e-760e-42df-aea6-9bddf81b4565`

**Regex**

`^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$`

Note that the `id` is distinct from any other `identifier` in the resource. In FHIR an `identifier` is described as a property that holds external business identifiers for a resource unlike the `id` which, in the case of SDHR is a server assigned guaranteed uniqie id.

**Example truncated resource**

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
    "id": "31d3b19e-760e-42df-aea6-9bddf81b4565"}
```

#### Overview

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/fhir-sdhr-resource-model.plantuml` -->
{% include fhir-sdhr-resource-model.svg %}
</div>
<br clear="all">


