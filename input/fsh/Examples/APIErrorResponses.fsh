

/************/
Instance: APIError-Unauthorised
InstanceOf: OperationOutcome
Usage: #example
Description: """
            Access to Shared Digital Health Records is **restricted**.<br>
                This API validates information that is provided by the API Consumer in their `Request-Context` header.
                The API Consumer must also provide an appropriate OAuth 2.0 Bearer token in the `Authorization` header containing scopes appropriate for the resource being accessed.
                The API Consumer must be registered with the Shared Digital Health Record API.
            """

* issue[+].severity = #error
* issue[=].code = #suppressed
* issue[=].details = #UNAUTHORISED
* issue[=].diagnostics = "Unauthorised."

// Confidential records are not accessible
Instance: APIError-Confidential
InstanceOf: OperationOutcome
Usage: #example
Description: "Example OperationOutcome API response, returned when a resource has been flagged as confidential, and so cannot be accessed."

* issue[+].severity = #error
* issue[=].code = #security
* issue[=].diagnostics = "Resource access is forbidden"
