// REST resource CRUD operations
RuleSet: GenericCRUDInteractions
//* interaction[0].code = #create
* interaction[+].code = #read
//* interaction[+].code = #update
//* interaction[+].code = #delete
//* interaction[+].code = #vread
* interaction[+].code = #search-type
* versioning = #versioned
* readHistory = false
* updateCreate = false
* conditionalCreate = false
* conditionalRead = #not-supported
* conditionalUpdate = false
* conditionalDelete = #not-supported

// REST resource search only interfaces (no CRUD)
RuleSet: SearchOnlyInteraction
* interaction[+].code = #search-type
* versioning = #versioned
* readHistory = false
* updateCreate = false
* conditionalCreate = false
* conditionalRead = #not-supported
* conditionalUpdate = false
* conditionalDelete = #not-supported

// adds markdown doc to a CapabilityStatement element
RuleSet: ResourceDocumentation(markdown)
* documentation = "{markdown}"

RuleSet: LimitedInteractionsDocumentation
* documentation = "Note that the supported interactions of the API will vary per API Consumer, depending on the consuming system's role."

// documents errors per HNZ standard (https://apistandards.digital.health.nz/api-development/Synchronous%20APIs/Error%20Handling)
RuleSet: APIStandardsDocumentation
* documentation = """
  ### Request-Context custom header

  All FHIR API requests MUST include the HNZ request context *custom header* which supplies identifiers for the health user 
  and organisation, or system behind the API request.

  This context is supplied using the 'Request-Context' custom HTTP header in the form of a base64-encoded JSON object.
  The value of the header has differing forms based on the type of request being made, namely whether it is in a user context (e.g. a clinical user searching for patient records), or a system context (e.g. a system submitting data to the API in a bulk load scenario).
  
  #### Requests with user context
  | **Context property**     | **Mandatory** | **Value**                                                                                                                          |
  |:-------------------------|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `userIdentifier`         | Yes         | The userid of the user as authenticated by the PMS/health application                                                                                   |
  | `secondaryIdentifier`    | Yes         | The secondary identifier for the user - this **MUST** be the end users Common Person Number (aka HPI Practitioner identifier) of the practitioner using the application where available. Otherwise, any secondary identifier that is held for the user |
  | `purposeOfUse`           | Yes         | One of [ "PATRQT", "POPHLTH", "TREAT", "ETREAT", "PUBHLTH", "RECORDMGT" ]. For descriptions of the values, see [Audit Events](https://fhir-ig.digital.health.nz/auditevents/ValueSet-purposeofuse.html)                                                                                 |
  | `userFullName`           | Yes         | Full name of the user of the PMS/health application.                                                                                                     |
  | `userRole`               | Yes         | Role of the user of the PMS/health application. Set to `"PROV"` (Provider) or `"PAT"` (Patient)                                                         |
  | `orgIdentifier`          | Yes         | The HPI Organisation Number (aka HPI Organisation identifier) for the organisation in which the API consumer application is deployed                     |
  | `facilityIdentifier`     | Yes         | The HPI Facility identifier for the facility where the record is being sourced / accessed.                                                                                                |

  #### Requests with system context
  | **Context property**     | **Mandatory** | **Value**                                                                                                                          |
  |:-------------------------|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `userIdentifier`         | Yes         | The oAuth clientId of the system submitting data to the API                                                                                   |
  | `purposeOfUse`           | Yes         | [ "RECORDMGT" ]. For descriptions of the values, see [Audit Events](https://fhir-ig.digital.health.nz/auditevents/ValueSet-purposeofuse.html)                                                                              |
  | `userFullName`           | Yes         | Name of the PMS/health application.                                                                                                    |
  | `userRole`               | Yes         | Role of the PMS/health application. Set to `"110150"` (Application)                                                 |
  | `orgIdentifier`          | Yes         | The HPI Organisation Number (aka HPI Organisation identifier) for the organisation in which the API consumer application is deployed                     |
  | `facilityIdentifier`     | Yes         | HPI identifier for the facility where the user is located                                                                                                |

  A schema definition and examples for `Request-Context` can be [found here](https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json)

  #### Example Request-Context Header Payload for a clinical user searching for a patient's Conditions
  **Base64 Encoded**
  ```
  ewogICJ1c2VySWRlbnRpZmllciI6ICJwbXMtaWQtMTIzIiwKICAidXNlclJvbGUiOiAiUFJPViIsCiAgInNlY29uZGFyeUlkZW50aWZpZXIiOiB7CiAgICAidXNlIjogIm9mZmljaWFsIiwKICAgICJzeXN0ZW0iOiAiaHR0cHM6Ly9zdGFuZGFyZHMuZGlnaXRhbC5oZWFsdGgubnovbnMvaHBpLXBlcnNvbi1pZCIsCiAgICAidmFsdWUiOiAiOTlaWlpTIgogIH0sCiAgInB1cnBvc2VPZlVzZSI6IFsKICAgICJQT1BITFRIIgogIF0sCiAgInVzZXJGdWxsTmFtZSI6ICJCZXZlcmx5IENydXNoZXIiLAogICJvcmdJZGVudGlmaWVyIjogIkcwMDAwMS1HIiwKICAiZmFjaWxpdHlJZGVudGlmaWVyIjogIkZaWjk5OS1CIgp9
  ```
  **Decoded JSON**
  ```json
  {
    "userIdentifier": "pms-id-123",
    "userRole": "PROV",
    "secondaryIdentifier": {
      "use": "official",
      "system": "https://standards.digital.health.nz/ns/hpi-person-id",
      "value": "99ZZZS"
    },
    "purposeOfUse": [
      "POPHLTH"
    ],
    "userFullName": "Beverly Crusher",
    "orgIdentifier": "G00001-G",
    "facilityIdentifier": "FZZ999-B"
  }
  ```
    #### Example Request-Context Header Payload for a system submitting data to the API, where there is no end user
  **Base64 Encoded**
  ```
  ewogICAgInVzZXJJZGVudGlmaWVyIjogIjFiODIwMGQ3LTNhOGMtNGZiNi04ZTVjLWNlYzQ1NDA5OTlkNSIsCiAgICAidXNlclJvbGUiOiAiMTEwMTUwIiwKICAgICJwdXJwb3NlT2ZVc2UiOiBbCiAgICAgICAgIlJFQ09SRE1HVCIKICAgIF0sCiAgICAidXNlckZ1bGxOYW1lIjogIlNhbXBsZSBQTVMgSW50ZWdyYXRpb24gQXBwbGljYXRpb24iLAogICAgIm9yZ0lkZW50aWZpZXIiOiAiRzAwMDAxLUciLAogICAgImZhY2lsaXR5SWRlbnRpZmllciI6ICJGWlo5OTktQiIKfQ==
  ```
  **Decoded JSON**
  ```json
  {
      "userIdentifier": "1b8200d7-3a8c-4fb6-8e5c-cec4540999d5",
      "userRole": "110150",
      "purposeOfUse": [
          "RECORDMGT"
      ],
      "userFullName": "Sample PMS Integration Application",
      "orgIdentifier": "G00001-G",
      "facilityIdentifier": "FZZ999-B"
  }
  ```

  ### Mandatory search parameters
  All FHIR API search requests must include the HNZ mandatory search parameters. These are listed in the Combined Search Parameters section of each resource below.

  ### Error status codes

  #### Read (GET) Operation Statuses

  |**Code**|**Meaning**|**Description**|
  |:--:|:-----------------|:--|
  |200|OK                 |The request was successful, and the response body contains the representation requested|
  |302|FOUND              |A common redirect response; you can GET the representation at the URI in the Location response header|
  |304|NOT MODIFIED       |Your client's cached version of the representation is still up to date|
  |400|BAD REQUEST        |Missing or bad `Request-Context` custom header; FHIR request payload does not validate against Implementation Guide|
  |401|UNAUTHORIZED       |The supplied credentials, if any, are not sufficient to access the resource|
  |403|FORBIDDEN          |Insufficient privilege to access the requested FHIR resource/operation|
  |404|NOT FOUND          |The requested representation was not found. Retrying this request is unlikely to be successful|
  |429|TOO MANY REQUESTS  |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|We are temporarily unable to return the representation. Please wait and try again later|

  #### Search (GET) Operation Statuses

  |**Code**|**Meaning**   |**OperationOutcome** in response?|**Description**|
  |:--:|:-----------------|:----------------------------------|:----------------------------------|
  |200|OK                 |Yes, When there are additional messages about a match result|The request was successful, and the response body contains the representation requested|
  |302|FOUND              |No |A common redirect response; you can GET the representation at the URI in the Location response header|
  |400|BAD REQUEST        |Yes|Missing or bad `Request-Context` custom header;<br>FHIR request payload does not validate against Implementation Guide|
  |401|UNAUTHORIZED       |Yes|The supplied credentials, if any, are not sufficient to access the resource|
  |403|FORBIDDEN          |Yes|Insufficient privilege to access the requested FHIR resource/operation. See [OperationOutcome-APIError-Unauthorised](./OperationOutcome-APIError-Unauthorised.html)|
  |429|TOO MANY REQUESTS  |No |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |No |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|No |The server is temporarily unable to return the representation. Please wait and try again later|

   #### Update or Create (POST or PUT) Operation Statuses

  |**Code**|**Meaning**   |**OperationOutcome** in response?|**Description**|
  |:--:|:-----------------|:----------------------------------|:----------------------------------|
  |200|OK                 |Yes, When there are additional messages about an operation|The request was successful, and the response body contains the representation requested|
  |201|CREATED            |No|The request was successful, and the response body contains the representation created|
  |400|BAD REQUEST        |Yes|Missing or bad `Request-Context` custom header;<br>FHIR request payload does not validate against Implementation Guide|
  |401|UNAUTHORIZED       |Yes|The supplied credentials, if any, are not sufficient to access the resource|
  |403|FORBIDDEN          |Yes|Insufficient privilege to access the requested FHIR resource/operation. See [OperationOutcome-APIError-Unauthorised](./OperationOutcome-APIError-Unauthorised.html)|
  |429|TOO MANY REQUESTS  |Yes |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |Yes |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|No |The server is temporarily unable to return the representation. Please wait and try again later|

  ### Non existent API endpoints

  When a consumer attempts to call a non-existent API end point, respond
  with a **501 Not Implemented** status code.

  ### API Rate Limits
  API rate limiting is enforced on a per client basis, and the status of the rate limit is communicated via the following HTTP response headers:

  | **Header name**       | **Description**                                  |
  |:----------------------|:-------------------------------------------------|
  | x-ratelimit-remaining | The amount of available quota |
  | x-ratelimit-limit     | The maximum available requests per window |
  | x-ratelimit-reset     | The remaining time, in milliseconds, until a new window starts |

  The API client **MUST** monitor these headers and ensure that they do not exceed the quota expressed in the `x-ratelimit-limit` header before the time window expressed in `x-ratelimit-reset`.
  If the rate limit is exceeded, the API will respond with a **429 Too Many Requests** status code and the [Rate Limit OperationOutcome](./OperationOutcome-OperationOutcomeRateLimitExceeded.json.html).

  | **Usage plan**       | **Rate limits**                                  |
  |:----------------------|:-------------------------------------------------|
  | SDHR Gold | 400 requests per second, per client |
  | SDHR Silver     | 50 requests per second, per client |
  | SDHR Bronze     | 10 requests per second, per client |

  Where the rate limit is exceeded as part of normal operations, the API client can request an increased quota by contacting the SDHR service desk portal.
"""