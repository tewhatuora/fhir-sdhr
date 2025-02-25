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

  All screening FHIR API requests must include the HNZ request context *custom header* supplying identifiers for the health user 
  and organisation behind the API request.

  This context is supplied using the 'Request-Context' custom header in the form of a base64-encoded JSON object.

  |**Context property**|**Value**|
  |:------------------|:---------|
  | `userIdentifier`  | The userid of the user as authenticated by the PMS/health application (REQUIRED) |
  | `secondaryIdentifier` | The secondary identifier for the user - this **MUST** be the end users Common Person Number (aka HPI Practitioner identifier) of the practitioner using the application (REQUIRED) |
  | `purposeOfUse`    | Set to `"NZSCREEN"` (REQUIRED)                                                  |
  | `userFullName`    | Full name of the user of the PMS/health application.` (REQUIRED)    |
  | `userRole`        | Role of the user of the PMS/health application. Set to `"PROV" (REQUIRED)                        |
  | `orgIdentifier`   | The HPI Organisation Number (aka HPI Organisation identifier) for the organisation in which the API consumer application is deployed (REQUIRED) |
  | `facilityIdentifier` | HPI identifier for the facility where the user is located (REQUIRED) |
  
  A schema definition and examples for `Request-Context` can be [found here](https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json)

  #### Example Request-Context Header Payload
  **Base64 Encoded**
  ```
  eyJ1c2VySWRlbnRpZmllciI6InBhdCIsInVzZXJSb2xlIjoiUFJPViIsInNlY29uZGFyeUlkZW50aWZpZXIiOnsidXNlIjoib2ZmaWNpYWwiLCJzeXN0ZW0iOiJodHRwczovL3N0YW5kYXJkcy5kaWdpdGFsLmhlYWx0aC5uei9ucy9ocGktcGVyc29uLWlkIiwidmFsdWUiOiI5OVpaWlMifSwicHVycG9zZU9mVXNlIjpbIlBST1YiXSwidXNlckZ1bGxOYW1lIjoiQmV2ZXJseSBDcnVzaGVyIiwib3JnSWRlbnRpZmllciI6IkcwMDAwMS1HIiwiZmFjaWxpdHlJZGVudGlmaWVyIjoiRlpaOTk5LUIifQ
  ```
  **Decoded JSON**
  ```json
  {
  "userIdentifier": "pat",
  "userRole": "PROV",
  "secondaryIdentifier": {
    "use": "official",
    "system": "https://standards.digital.health.nz/ns/hpi-person-id",
    "value": "99ZZZS"
  },
  "purposeOfUse": [
    "NZSCREEN"
  ],
  "userFullName": "Beverly Crusher",
  "orgIdentifier": "G00001-G",
  "facilityIdentifier": "FZZ999-B"
}
```

  ### Error status codes

  #### Read (GET) Operation Statuses

  |**Code**|**Meaning**|**Description**|
  |:--:|:-----------------|:--|
  |200|OK                 |The request was successful, and the response body contains the representation requested|
  |302|FOUND              |A common redirect response; you can GET the representation at the URI in the Location response header|
  |304|NOT MODIFIED       |Your client's cached version of the representation is still up to date|
  |400|BAD REQUEST        |Missing or bad `Recurity-Context` custom header; FHIR request payload does not validate against Implementation Guide|
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
  |400|BAD REQUEST        |Yes|Missing or bad `Recurity-Context` custom header;<br>FHIR request payload does not validate against Implementation Guide|
  |401|UNAUTHORIZED       |Yes|The supplied credentials, if any, are not sufficient to access the resource|
  |403|FORBIDDEN          |Yes|Insufficient privilege to access the requested FHIR resource/operation. See [OperationOutcome-APIError-Unauthorised](./OperationOutcome-APIError-Unauthorised.html)|
  |429|TOO MANY REQUESTS  |No |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |No |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|No |The server is temporarily unable to return the representation. Please wait and try again later|
 
  ### Non existent API endpoints

  When a consumer attempts to call a non-existent API end point, respond
  with a **501 Not Implemented** status code.
"""