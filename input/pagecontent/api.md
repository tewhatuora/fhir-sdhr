# API Documentation

The SDHR API is comprised of multiple FHIR resources. This page provides technical guidance for applicaiton developers who wish to integrate their applications with the Shared Digital Health Record APIs

| **Resource** | **Description** |
| --- | --- |
| [API Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html) | FHIR API Capability Statement |
| [API Artifacts](./artifacts.html) | List of FHIR Artifacts for this API |
| [OpenAPI Specification](https://fhir-ig.digital.health.nz/openapi/index.html?urls.primaryName=Shared+Digital+Health+Record+FHIR+API) | Machine readable OpenAPI specification for this API |

## Logical View

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/api-logical-overview.plantuml` -->
{% include api-logical-overview.svg %}
</div>
<br clear="all">

## API Search Behaviour

The Shared Digital Health Record FHIR API supports the [FHIR search pattern](https://hl7.org/fhir/R4B/search.html).

You can see the supported search parameters for this API in the [API Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html#resourcesCap1)

See below for some example search queries.

### Search for Conditions by Patient and Source

This query will return all Condition resources for a given `Patient` and `meta.source`.

`GET /Condition?patient=https://api.hip.digital.health.nz/fhir/Patient/ZKC7284&_source=https://api.hip.digital.health.nz/fhir/Location/F38006-B`

<div width="100%">
<details>
<summary><b><u>Click to view example response</u></b></summary>
<br>
In this example the search returns 2 active conditions for the patient `ZKC7284` that were sourced from the HPI location `F38006-B`
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
            "url": "https://server.url/Condition?_source=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FLocation%2FF38006-B&patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FPatient%2FZKC7284"
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
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Patient/ZKC7284",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-03-21T00:34:52.819Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/Location/F38006-B"
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
                "identifier": [
                    {
                        "system": "https://standards.digital.health.nz/ns/health-record-key-id",
                        "value": "ef5b3aad-14c2-4904-aa25-7411dcb21327"
                    }
                ],
                "extension": [
                    {
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Patient/ZKC7284",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-03-21T00:41:35.416Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/Location/F38006-B"
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

### Search for Resources by Patient and Identifier

In this API `identifier` can be used to track source system unique identifiers. This should enable systems such as Patient Management Systems to track the provenance of resources. There is no limit on the number of identifiers that a resource can contain.

> Request `Condition` resources for a specific identifier
> `GET Condition?patient=https://api.hip.digital.health.nz/fhir/Patient/ZKC7284&identifier=38cb6f26-9534-46e5-b659-536992faf0cc`

> Request `Condition` resources for a specific identifier AND system,
> `GET /Condition?patient=https://api.hip.digital.health.nz/fhir/Patient/ZKC7284&identifier=https://some.local.system/ehr-key%7Cd2ed3bc7-da4a-45b8-ae3f-82176f5c64a4`

<div width="100%">
<details>
<summary><b><u>Click to view example response</u></b></summary>
<br>
In this example the above query returns a single result. Note that in most cases omission of the `patient` would return a single result but to avoid any possiblility of identifier non-uniqueness the `patient` modifier **SHOULD** be used.
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
            "url": "https://server.url/Condition?identifier=38cb6f26-9534-46e5-b659-536992faf0cc&patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FPatient%2FZKC7284"
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
                        "valueBoolean": true,
                        "url": "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
                    }
                ],
                "recorder": {
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Patient/ZKC7284",
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
                    "reference": "https://api.hip.digital.health.nz/fhir/Practitioner/91ZZXN",
                    "display": "DR Julian Subatoi Bashir",
                    "type": "Practitioner"
                },
                "meta": {
                    "lastUpdated": "2025-05-01T22:23:37.587Z",
                    "versionId": "1",
                    "profile": [
                        "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
                    ],
                    "source": "https://api.hip.digital.health.nz/fhir/Location/F38006-B"
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

## SDHR Resource updates

This section describes the process of SDHR API Consumer system interacting with the SDHR FHIR server to update existing resources.

### GET before PUT

To maintain data integrity, API Consumers authorized to make updates to resources must use a "GET before PUT" approach. By always fetching the current state of a resource before attempting an update, you ensure that the modifications reflect the most accurate and recent information, without overwriting updates which may have been made by other API Consumers.

<div width="100%">
<!-- Generated from `input/images-source/get-before-put.plantuml` -->
{% include get-before-put.svg %}
</div>
<br clear="all">

### Searching for resources before update

The SDHR API reflects the FHIR Search parameters which are documented in the [Server Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html) and well as a direct HTTP GET for a resource.

#### Case 1: The SDHR Server assigned resource ID is known by the API Consumer:

In this scenario, an HTTP GET for the resource can be made to retrieve the resource: `GET /Condition/{serverResourceId}`.

Once the update has been made, the resource can be updated in the SDHR Server by using an HTTP PUT to the resource: `PUT /Condition/{serverResourceId}`

#### Case 2: The SDHR Server assigned resource ID is unknown by the API Consumer:

In this scenario, a FHIR Search must be used with search parameters available to the API Consumer, as the server resource ID cannot be used for a direct HTTP GET.

<b>Option 1: FHIR Search by local PMS identifier, stored as a FHIR Identifier</b>

To improve accuracy in this process, API Consumers who submit or update records may append an identifier known to them to the shared record. This may be a representation or a copy of a local identifier used within the local PMS system. When a local identifier is stored, a FHIR Search using an identifier search parameter can be used to retrieve a record.

<div width="100%">
<!-- Generated from `input/images-source/search-by-identifier.plantuml` -->
{% include search-by-identifier.svg %}
</div>
<br clear="all">

<b>Option 2: FHIR Search using resource search parameters</b>

When a local identifier is not submitted to a resource, the search parameters for each resource must be used, which are documented in the [Server Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html). This will return a FHIR Bundle which may contain multiple records which must be handled by the API Consumer.

<div width="100%">
<!-- Generated from `input/images-source/search-by-parameters.plantuml` -->
{% include search-by-parameters.svg %}
</div>
<br clear="all">

## SDHR Confidential Record API behaviour

When a record is created or updated to be marked as confidential using [FHIR Security labels](https://build.fhir.org/security-labels.html), read or search operations that would return the  record will result in no access to the record.

When the data sensitivity tags using the confidentiality system `http://terminology.hl7.org/CodeSystem/v3-Confidentiality` are be applied to any SDHR resource, by adding the tag in the resource `meta.security` array, the API will use the follow behaviours when the resources are subject to FHIR API Requests.

The behaviours are valid for resources containing an security label using the `http://terminology.hl7.org/CodeSystem/v3-Confidentiality` `system` and `R` (Restricted) or `V` (Very Restricted). SDHR resources which do not contain this confidentiality tag will not be subject to these behaviours.

## Sample confidential resource

<details>
<summary><b><u>Click to view example confidential resource</u></b></summary>
{% fragment AllergyIntolerance/AllergyIntoleranceExample JSON %}
</details>

#### FHIR Search example
`GET /AllergyIntolerance?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FPatient%2FZKC7284`

Response status: `200`

Response body:

{% fragment Bundle/ConfidentialRecordsSearchResponseExample JSON %}

In this request example, a request is made to return AllergyIntolerance resources for a patient using FHIR Search. As a confidential resource was matched with this search, the search result set has been redacted due to confidentiality tags on the resource, resulting in the `meta.security` `REDACTED` tag being added to the search result `Bundle`. This indicates to the API Consumer that some portion of the searchset has been filtered due to confidentiality and not included in the content returned. The `total` within the response reflects the total of resources before filtering occurs.

#### FHIR read, vread example

`GET /AllergyIntolerance/{id}`

Response status: `403`

Response body:

{% fragment OperationOutcome/APIError-Confidential JSON %}

In this example, a request is made to a single resource which contains a confidentiality flag. This returns a 403 error.
