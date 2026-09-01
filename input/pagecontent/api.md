The SDHR API comprises multiple FHIR resources. This page provides technical guidance for application developers integrating with the Shared Digital Health Record APIs.

<style>
details {
  margin-bottom: 1rem;
}
</style>

The [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html) defines supported FHIR interactions and request requirements. The [FHIR artifacts](./artifacts.html) provide the profiles, operation definitions, examples, and terminology used by the API, and the [OpenAPI Specification](https://fhir-ig.digital.health.nz/openapi/index.html?urls.primaryName=Shared+Digital+Health+Record+FHIR+API) provides a machine-readable interface description.

### Authentication and request context
{: .underlined}

The SDHR API uses OAuth 2.0 client credentials. API consumers are authorised for approved interactions through the SDHR onboarding process.

The `Request-Context` header is required for API requests and supplies the user, organisation, facility, and other request context needed for authorisation and audit. `X-Correlation-Id` is optional and supports request tracing. The [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html) and [OpenAPI Specification](https://fhir-ig.digital.health.nz/openapi/index.html?urls.primaryName=Shared+Digital+Health+Record+FHIR+API) define the technical header requirements.

### Resource interaction catalogue
{: .underlined}

The following tables summarise the interactions intended for external API consumers contributing information to or accessing information from SDHR. The linked profiles, operation definitions, and detailed sections remain authoritative for parameters, payloads, response behaviour, validation, and errors.

#### Contributed resource interactions

Allergy, condition, and observation information is contributed to the SDHR Primary Care Collection. These resources support the same interaction pattern.

| Resource | Interactions | HTTP verbs and relative URLs | Profile or definition | Detailed behaviour |
| --- | --- | --- | --- | --- |
| AllergyIntolerance | search, create, read, update | `GET /AllergyIntolerance`<br>`POST /AllergyIntolerance`<br>`GET /AllergyIntolerance/{id}`<br>`PUT /AllergyIntolerance/{id}` | [SDHR AllergyIntolerance](./StructureDefinition-SDHRAllergyIntolerance.html) | [Search behaviour](#api-search-behaviour)<br>[Update behaviour](#sdhr-resource-updates) |
| Condition | search, create, read, update | `GET /Condition`<br>`POST /Condition`<br>`GET /Condition/{id}`<br>`PUT /Condition/{id}` | [SDHR Condition](./StructureDefinition-SDHRCondition.html) | [Search behaviour](#api-search-behaviour)<br>[Update behaviour](#sdhr-resource-updates) |
| Observation | search, create, read, update | `GET /Observation`<br>`POST /Observation`<br>`GET /Observation/{id}`<br>`PUT /Observation/{id}` | [SDHR Observation](./StructureDefinition-SDHRObservation.html) | [Search behaviour](#api-search-behaviour)<br>[Update behaviour](#sdhr-resource-updates) |
{: .grid}

#### Batch interaction

| Resource | Interaction | HTTP verb and relative URL | Profile or definition | Detailed behaviour |
| --- | --- | --- | --- | --- |
| Bundle | batch | `POST /` | [SDHR Batch Bundle](./StructureDefinition-SDHRBatchBundle.html) | The Bundle must use `type = batch`; transaction processing and participation operations within the Bundle are not supported. |
{: .grid}

#### National source resource interactions

Medication and immunisation information is read-only through SDHR. It is sourced from national health information sources and cannot be created, updated, or deleted through the SDHR API.

| Resource | Interactions | HTTP verbs and relative URLs | Profile or definition | Detailed behaviour |
| --- | --- | --- | --- | --- |
| MedicationRequest | search, read | `GET /MedicationRequest`<br>`GET /MedicationRequest/{id}` | [SDHR MedicationRequest](./StructureDefinition-SDHRMedicationRequest.html) | [Search behaviour](#api-search-behaviour) |
| MedicationDispense | search, read | `GET /MedicationDispense`<br>`GET /MedicationDispense/{id}` | [SDHR MedicationDispense](./StructureDefinition-SDHRMedicationDispense.html) | [Search behaviour](#api-search-behaviour) |
| Immunization | search, read, vread | `GET /Immunization`<br>`GET /Immunization/{id}`<br>`GET /Immunization/{id}/_history/{vid}` | [SDHR Immunization](./StructureDefinition-SDHRImmunization.html) | [Search behaviour](#api-search-behaviour)<br>[Confidential record behaviour](#sdhr-confidential-record-api-behaviour) |
{: .grid}

#### Participation operations

| Operation | HTTP verb and relative URL | Definition | Status | Detailed behaviour |
| --- | --- | --- | --- | --- |
| `$participate` | `POST /$participate` | [SDHR Participate Operation](./OperationDefinition-SDHRParticipateOperation.html) | Active | [Technical contract](#participate-operation)<br>[Contribution workflow](./contribute-information.html#facility-participation) |
| `$participation-status` | `POST /$participation-status` | [SDHR Participation Status Operation](./OperationDefinition-SDHRParticipationStatusOperation.html) | Active | [Technical contract](#participation-status-operation)<br>[Access information workflow](./access-information.html#access-workflow) |
{: .grid}

#### Access verification operation catalogue

| Operation | HTTP verb and relative URL | Definition | Status | Detailed behaviour |
| --- | --- | --- | --- | --- |
| `$verification-samples` | `GET /AuditEvent/$verification-samples` | [SDHR Verification Samples Operation](./OperationDefinition-SDHRVerificationSamplesOperation.html) | Draft | [Access verification operations](#access-verification-operations) |
| `$verification-submissions` | `POST /AuditEvent/$verification-submissions` | [SDHR Verification Submissions Operation](./OperationDefinition-SDHRVerificationSubmissionsOperation.html) | Draft | [Access verification operations](#access-verification-operations) |
{: .grid}

### Logical view
{: .underlined}

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/api-logical-overview.plantuml` -->
{% include api-logical-overview.svg %}
</div>
<br clear="all">

### API search behaviour
{: .underlined}

The Shared Digital Health Record FHIR API supports the [FHIR search pattern](https://hl7.org/fhir/R4B/search.html).

Supported search parameters are listed in the [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html#resourcesCap1).

See below for some example search queries.

#### Search for Conditions by patient and source

This query returns all Condition resources for a given `Patient` and `meta.source`.

`GET /Condition?patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284&_source=https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A`

<div width="100%">
<details>
<summary><b><u>Click to view example response</u></b></summary>
<br>
In this example, the search returns two active conditions for patient `ZKC7284`, sourced from HPI location `FZZ111-A`.
<br>
<pre><code class="language-json">
{
    "resourceType": "Bundle",
    "id": "92e3f5a6-2f8e-4e9d-a8f9-e5e6c578dd53",
    "meta": {
        "lastUpdated": "2025-05-01T21:23:04.818Z"
    },
    "type": "searchset",
    "total": 2,
    "link": [
        {
            "relation": "self",
            "url": "https://server.url/Condition?_source=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fhpi%2Fv1%2FLocation%2FFZZ111-A&patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC7284"
        }
    ],
    "entry": [
        {
            "search": {
                "mode": "match"
            },
            "fullUrl": "https://server.url/Condition/635b2a1c-bdd1-4a20-8c2f-6d8348352f6a",
            "resource": {
                "identifier": [
                    {
                        "system": "https://standards.digital.health.nz/ns/health-record-key-id",
                        "value": "ef5b3aad-14c2-4904-aa25-7411dcb21327"
                    }
                ],
                "extension": [
                    {
                        "url": "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension",
                        "valueDateTime": "2025-03-20T09:14:00+13:00"
                    },
                    {
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/99ZZZZ",
                    "display": "Dottie McStuffins",
                    "type": "Practitioner"
                },
                "code": {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "38341003",
                            "display": "HT - Hypertension"
                        }
                    ],
                    "text": "Hypertension"
                },
                "verificationStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
                            "code": "confirmed"
                        }
                    ]
                },
                "subject": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284",
                    "display": "Carrey Carrington",
                    "type": "Patient"
                },
                "recordedDate": "2023-11-26T10:02:45+13:00",
                "clinicalStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                            "code": "active"
                        }
                    ]
                },
                "onsetDateTime": "2011-02-05T00:00:00+13:00",
                "asserter": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-03-21T00:34:52.819Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A"
                },
                "id": "635b2a1c-bdd1-4a20-8c2f-6d8348352f6a",
                "resourceType": "Condition"
            }
        },
        {
            "search": {
                "mode": "match"
            },
            "fullUrl": "https://server.url/Condition/c3605e85-6785-4fa9-94a5-6d8015416c53",
            "resource": {
                "extension": [
                    {
                        "url": "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension",
                        "valueDateTime": "2025-03-20T09:17:00+13:00"
                    },
                    {
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/99ZZZZ",
                    "display": "Dottie McStuffins",
                    "type": "Practitioner"
                },
                "code": {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "13645005",
                            "display": "Chronic obstructive pulmonary disease"
                        }
                    ],
                    "text": "Hypertension"
                },
                "verificationStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
                            "code": "confirmed"
                        }
                    ]
                },
                "subject": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284",
                    "display": "Carrey Carrington",
                    "type": "Patient"
                },
                "recordedDate": "2023-11-26T10:02:45+13:00",
                "clinicalStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                            "code": "active"
                        }
                    ]
                },
                "onsetDateTime": "2011-02-05T00:00:00+13:00",
                "asserter": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-03-21T00:41:35.416Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A"
                },
                "id": "c3605e85-6785-4fa9-94a5-6d8015416c53",
                "resourceType": "Condition"
            }
        }
    ]
}
</code></pre>
</details>
</div>
<br clear="all">

#### Search for resources by patient and identifier

The `identifier` search parameter can be used with unique source-system identifiers. This enables systems such as PMS products to locate resources using identifiers they assigned and retained. A resource can contain multiple identifiers.

> Request `Condition` resources for a specific identifier
> `GET Condition?patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284&identifier=38cb6f26-9534-46e5-b659-536992faf0cc`

> Request `Condition` resources for a specific identifier AND system,
> `GET /Condition?patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284&identifier=https://some.local.system/ehr-key%7Cd2ed3bc7-da4a-45b8-ae3f-82176f5c64a4`

<div width="100%">
<details>
<summary><b><u>Click to view example response</u></b></summary>
<br>
In this example, the query returns a single result.
<br>
<pre><code class="language-json">

{
    "resourceType": "Bundle",
    "id": "4c3cf2a4-4424-46f4-b4af-00c46812ec7e",
    "meta": {
        "lastUpdated": "2025-05-01T22:23:57.904Z"
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "https://server.url/Condition?identifier=38cb6f26-9534-46e5-b659-536992faf0cc&patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC7284"
        }
    ],
    "entry": [
        {
            "search": {
                "mode": "match"
            },
            "fullUrl": "https://server.url/Condition/72ca633a-23cc-4848-a512-5111750508fb",
            "resource": {
                "identifier": [
                    {
                        "system": "https://some.local.system/ehr-key",
                        "value": "38cb6f26-9534-46e5-b659-536992faf0cc"
                    }
                ],
                "extension": [
                    {
                        "url": "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension",
                        "valueDateTime": "2025-05-01T09:02:00+13:00"
                    },
                    {
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/99ZZZZ",
                    "display": "Dottie McStuffins",
                    "type": "Practitioner"
                },
                "code": {
                    "coding": [
                        {
                            "system": "http://health.govt.nz/read-codes",
                            "code": "SN3..",
                            "display": "Local pressure"
                        }
                    ],
                    "text": "Hypertension"
                },
                "verificationStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
                            "code": "confirmed"
                        }
                    ]
                },
                "subject": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284",
                    "display": "Carrey Carrington",
                    "type": "Patient"
                },
                "recordedDate": "2023-11-26T10:02:45+13:00",
                "clinicalStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                            "code": "active"
                        }
                    ]
                },
                "onsetDateTime": "2011-02-05T00:00:00+13:00",
                "asserter": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-05-01T22:23:37.587Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A"
                },
                "id": "72ca633a-23cc-4848-a512-5111750508fb",
                "resourceType": "Condition"
            }
        }
    ]
}

</code></pre>
</details>
</div>
<br clear="all">

### SDHR resource updates
{: .underlined}

This section describes how an API consumer interacts with the SDHR FHIR server to update existing resources.

#### GET before PUT

To maintain data integrity, API consumers authorised to update resources must use a "GET before PUT" approach. Fetching the current resource before updating it ensures that changes are based on the latest state and do not overwrite updates made by another API consumer.

<div width="100%">
<!-- Generated from `input/images-source/get-before-put.plantuml` -->
{% include get-before-put.svg %}
</div>
<br clear="all">

#### Searching for resources before update

The [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html) documents the supported FHIR search parameters and direct read interactions.

##### Case 1: The server-assigned resource ID is known

Retrieve the resource directly using `GET /Condition/{serverResourceId}`.

After applying the required changes, update the resource using `PUT /Condition/{serverResourceId}`.

##### Case 2: The server-assigned resource ID is unknown

Use a FHIR search with parameters available to the API consumer to locate the resource before updating it.

<b>Option 1: FHIR Search by local PMS identifier, stored as a FHIR Identifier</b>

API consumers that create or update records may include a source-system identifier in the shared resource. When this identifier is retained locally, the API consumer can use the `identifier` search parameter to locate the resource.

<div width="100%">
<!-- Generated from `input/images-source/search-by-identifier.plantuml` -->
{% include search-by-identifier.svg %}
</div>
<br clear="all">

<b>Option 2: FHIR Search using resource search parameters</b>

When a source-system identifier is unavailable, use the resource-specific parameters documented in the [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html). The search returns a FHIR `Bundle` that may contain multiple matches, which the API consumer must handle safely.

<div width="100%">
<!-- Generated from `input/images-source/search-by-parameters.plantuml` -->
{% include search-by-parameters.svg %}
</div>
<br clear="all">

### SDHR custom operations
{: .underlined}

The SDHR service includes the following FHIR custom operations.

#### Access verification operations

> **Draft**: These verification operations and examples are currently draft and should be treated as draft interface content.

SEHR systems need to periodically retrieve sampled access events from SDHR, review whether those accesses were valid, and submit the verification decisions. Samples are represented as FHIR `AuditEvent` resources that conform to the [SDHR AuditEvent profile](./StructureDefinition-SDHRAuditEvent.html).

This workflow is performed on an ongoing basis so that newly sampled access events continue to be reviewed and verified over time.

The end-to-end sequence and corresponding processing steps are documented in the [audit access records workflow](./access-information.html#audit-access-records-workflow).

##### Retrieve verification samples

The SEHR calls `GET /AuditEvent/$verification-samples` to retrieve a `Bundle` of sampled `AuditEvent` resources that require verification. The operation supports `_count` and `_offset` query parameters for paging, for example:

`GET /AuditEvent/$verification-samples?_count=1&_offset=0`

See [SDHRVerificationSamplesOperation](./OperationDefinition-SDHRVerificationSamplesOperation.html).

<details>
<summary><b><u>Click to view verification samples Bundle example</u></b></summary>

{% fragment Bundle/BundleVerificationSamplesResponseExample JSON %}

</details>

##### Review sampled access events

The SEHR reviews the returned `AuditEvent` resources using either an automated process or a manual workflow to determine whether each recorded access was valid.

##### Submit verification decisions

The SEHR calls `POST /AuditEvent/$verification-submissions` with the defined `Parameters` payload to submit one or more verification decisions.

See [SDHRVerificationSubmissionsOperation](./OperationDefinition-SDHRVerificationSubmissionsOperation.html), the [SDHRVerificationSubmissionParameters profile](./StructureDefinition-SDHRVerificationSubmissionParameters.html), and the [SDHRVerificationSubmissionResponseParameters profile](./StructureDefinition-SDHRVerificationSubmissionResponseParameters.html).

<details>
<summary><b><u>Click to view verification submission request example</u></b></summary>

{% fragment Parameters/ParametersVerificationSubmissionRequestExample JSON %}

</details>

<details>
<summary><b><u>Click to view verification submission response example</u></b></summary>

{% fragment Parameters/ParametersVerificationSubmissionResponseExample JSON %}

</details>

#### Participate operation

The `$participate` operation enables API consumers, such as PMS products, to record a patient's facility participation preference and record-level withholding or release.

| Contract element | Requirement |
| --- | --- |
| Interaction | System-level custom operation |
| HTTP request | `POST /$participate` |
| Definition | [SDHR Participate Operation](./OperationDefinition-SDHRParticipateOperation.html) |
| Request body | FHIR `Parameters` conforming to the operation definition |
| Response body | `OperationOutcome` indicating success or failure |
| Behaviour | Idempotent for repeated requests with the same parameters |
{: .grid}

The operation supports facility opt-out and opt-back-in, technical initialisation of the default facility preference, withholding a local `Condition` or `Observation`, and releasing a previously withheld record. A facility opt-out archives the patient's active contributed resources from that facility; archived resources are retained but are excluded from normal search and read interactions. Parameter cardinalities, conditional requirements, bindings, and response definitions are authoritative in the [OperationDefinition](./OperationDefinition-SDHRParticipateOperation.html).

Request examples:

- [Facility opt-out](./Parameters-ParametersDoNotParticipate.html)
- [Set or restore facility participation](./Parameters-ParametersParticipate.html)
- [Record withheld at source](./Parameters-ParametersParticipateRecordWithheld.html)
- [Release a withheld record](./Parameters-ParametersParticipateRecordReleased.html)

Response examples:

- [Successful participation update](./OperationOutcome-OperationOutcomeParticipateSuccess.html)
- [Invalid patient reference](./OperationOutcome-OperationOutcomeParticipateInvalidPatient.html)
- [Missing withholding reason](./OperationOutcome-OperationOutcomeParticipateMissingReason.html)
- [Facility preference not yet known](./OperationOutcome-OperationOutcomeParticipatePreferencesNotKnown.html)

<details>
<summary><b><u>Example request to release a withheld record</u></b></summary>

{% fragment Parameters/ParametersParticipateRecordReleased JSON %}

</details>

See [Manage participation](./contribute-information.html#manage-participation) for the end-to-end facility, Health NZ, confidentiality, and historical-reload workflows. UAT identities and expected deny or lock outcomes are documented under [Test Data](./test-data.html).

#### Participation status operation

The `$participation-status` operation allows an SEHR system to check whether a patient is globally participating in SDHR before requesting health information. It returns the patient's NHI reference and the `hnzParticipationIndicator` boolean. The operation does not change the patient's participation preference and does not return clinical information.

| Contract element | Requirement |
| --- | --- |
| Interaction | System-level custom operation |
| HTTP request | `POST /$participation-status` |
| Definition | [SDHR Participation Status Operation](./OperationDefinition-SDHRParticipationStatusOperation.html) |
| Request body | FHIR `Parameters` containing one NHI `patient` reference |
| Response body | FHIR `Parameters` containing the patient reference and `hnzParticipationIndicator` |
| `hnzParticipationIndicator` | `true` indicates global participation; `false` indicates that the patient has opted out globally |
{: .grid}

The operation is intended to be called by a healthcare provider on behalf of the patient. The patient must be identified by an NHI. The status returned is global; it does not represent a facility-level participation preference.

Request example:

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "patient",
      "valueReference": {
        "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZXK9000",
        "type": "Patient"
      }
    }
  ]
}
```

Response examples:

- [Patient not globally participating](./Parameters-ParametersParticipationStatusNotParticipatingResponse.html)
- [Patient globally participating](./Parameters-ParametersParticipationStatusParticipatingResponse.html)

SEHR systems should use the result to determine whether to continue with an information request. If `hnzParticipationIndicator` is `false`, the patient is globally opted out of SDHR and no information will be available for that patient.

### SDHR confidential record API behaviour
{: .underlined}

SDHR represents two distinct confidentiality cases: an SDHR resource carrying a restrictive FHIR security label, and a source record registered as withheld through `$participate` where the clinical resource is not stored in SDHR. Their API responses differ.

#### Stored resource security-label behaviour

Confidentiality labels are applied to an SDHR resource through its `meta.security` array using the `http://terminology.hl7.org/CodeSystem/v3-Confidentiality` code system.

The behaviours below apply to resources labelled `R` (Restricted) or `V` (Very Restricted). SDHR resources without either confidentiality label are not subject to these behaviours.

##### Sample confidential resource

<details>
<summary><b><u>Click to view example confidential resource</u></b></summary>
{% fragment AllergyIntolerance/AllergyIntoleranceExample JSON %}
</details>

##### Search response

`GET /AllergyIntolerance?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC7284`

Response status: `200`

Response body:

<details>
<summary><b><u>Click to view example response</u></b></summary>

{% fragment Bundle/SearchConfidentialRecordsResponseExample JSON %}

</details>

This search requests `AllergyIntolerance` resources for a patient. Because the search matches a confidential resource, that resource is omitted and the server adds a `REDACTED` tag to `Bundle.meta.security`. The tag tells the API consumer that the result set has been filtered. `Bundle.total` reports the number of matches before confidentiality filtering.

##### Read and vread response

`GET /AllergyIntolerance/{id}`

Response status: `403`

Response body:

{% fragment OperationOutcome/APIError-Confidential JSON %}

In this example, a request for a single confidential resource receives an HTTP 403 response.

#### Record withheld at source behaviour

The following search supplies these parameters:

- `patient` | <https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC4633>
- `source` | <https://api.hip.digital.health.nz/fhir/hpi/v1/Location/F38006-B>
- `identifier` | 6b8a6cc1-612f-456e-89df-9fbcd753acb2

`GET /Condition?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC4633&_source=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fhpi%2Fv1%2FLocation%2FF38006-B&identifier=6b8a6cc1-612f-456e-89df-9fbcd753acb2`

In this example, the supplied parameters exactly match a single record that the source system has marked as withheld. The server does not hold the clinical record, but it can uniquely match the search to the withheld record registered through the [$participate operation](./OperationDefinition-SDHRParticipateOperation.html).

The search response contains an `OperationOutcome` entry with `"mode":"outcome"`:

<details>
<summary><b><u>Click to view example response</u></b></summary>

{% fragment Bundle/SearchExactMatchRecordWithheldExample JSON %}

</details>

[See example details](./Bundle-SearchExactMatchRecordWithheldExample.html)

### Internal-only operations
{: .underlined}

The `$hnz-participate` and `$hnz-participation-status` operations are restricted to authorised Health NZ internal channels and are not available to external API consumers.
