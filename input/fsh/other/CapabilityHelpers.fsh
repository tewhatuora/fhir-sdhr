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

// documents errors per HNZ standard (https://apistandards.digital.health.nz/api-development/Synchronous%20APIs/Error%20Handling)
RuleSet: APIStandardsDocumentation
* documentation = """
  ### Request-Context custom header

  All FHIR API requests must include the HNZ request context *custom header* which supplies identifiers for the health user 
  and organisation behind the API request.

  This context is supplied using the 'Request-Context' custom header in the form of a base64-encoded JSON object.
  The value of the header has differing forms based on the type of request being made in a user context (e.g. a clinical user searching for patient records) or a system context (e.g. a system submitting data to the API in a bulk load scenario).
  
  #### Requests with user context
  | **Context property**     | **Mandatory** | **Read/search access value**                                                                                                                          |
  |:-------------------------|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `userIdentifier`         | Yes         | The userid of the user as authenticated by the PMS/health application                                                                                   |
  | `secondaryIdentifier`    | Yes         | The secondary identifier for the user - this **MUST** be the end users Common Person Number (aka HPI Practitioner identifier) of the practitioner using the application |
  | `purposeOfUse`           | Yes         | One of [ "PATRQT", "POPHLTH", "TREAT", "ETREAT", "PUBHLTH", "SYSDEV" ]. For descriptions of the values, see [Audit Events](https://fhir-ig.digital.health.nz/auditevents/ValueSet-purposeofuse.html)                                                                                 |
  | `userFullName`           | Yes         | Full name of the user of the PMS/health application.                                                                                                     |
  | `userRole`               | Yes         | Role of the user of the PMS/health application. Set to `"PROV"` (Provider) or `"PAT"` (Patient)                                                         |
  | `orgIdentifier`          | Yes         | The HPI Organisation Number (aka HPI Organisation identifier) for the organisation in which the API consumer application is deployed                     |
  | `facilityIdentifier`     | Yes         | HPI identifier for the facility where the user is located                                                                                                |

  #### Requests with system context
  | **Context property**     | **Mandatory** | **Write access value**                                                                                                                          |
  |:-------------------------|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `userIdentifier`         | Yes         | The oAuth clientId of the system submitting data to the API                                                                                   |
  | `secondaryIdentifier`    | Yes         |    ?          |
  | `purposeOfUse`           | Yes         | [ "SYSDEV" ]. For descriptions of the values, see [Audit Events](https://fhir-ig.digital.health.nz/auditevents/ValueSet-purposeofuse.html)                                                                              |
  | `userFullName`           | Yes         | Name of the PMS/health application.                                                                                                    |
  | `userRole`               | Yes         | Role of the PMS/health application. Set to `"PROV"` (Provider)                                                 |

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
  ICB7CiAgICAidXNlcklkZW50aWZpZXIiOiAiMWI4MjAwZDctM2E4Yy00ZmI2LThlNWMtY2VjNDU0MDk5OWQ1IiwKICAgICJ1c2VyUm9sZSI6ICJQUk9WIiwKICAgICJzZWNvbmRhcnlJZGVudGlmaWVyIjogewogICAgICAidXNlIjogIm9mZmljaWFsIiwKICAgICAgInN5c3RlbSI6ICJ0b2RvIiwKICAgICAgInZhbHVlIjogInRvZG8iCiAgICB9LAogICAgInB1cnBvc2VPZlVzZSI6IFsKICAgICAgIlNZU0RFViIKICAgIF0sCiAgICAidXNlckZ1bGxOYW1lIjogIlNhbXBsZSBQTVMgSW50ZWdyYXRpb24gQXBwbGljYXRpb24iCiAgfQ==
  ```
  **Decoded JSON**
  ```json
  {
    "userIdentifier": "1b8200d7-3a8c-4fb6-8e5c-cec4540999d5",
    "userRole": "PROV",
    "secondaryIdentifier": {
      "use": "official",
      "system": "todo",
      "value": "todo"
    },
    "purposeOfUse": [
      "SYSDEV"
    ],
    "userFullName": "Sample PMS Integration Application"
  }
  ```


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
 
  ### Non existent API endpoints

  When a consumer attempts to call a non-existent API end point, respond
  with a **501 Not Implemented** status code.
"""