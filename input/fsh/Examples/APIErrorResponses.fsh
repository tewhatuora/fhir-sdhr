

/************/
Instance: APIError-Unauthorised
InstanceOf: OperationOutcome
Usage: #example
Description: """
            Access to Shared Digital Health Records is **restricted**.<br>
                This API validates information that is provided by the API Consumer in their `Request-Context` header.<br>
                The API Consumer must also provide an appropriate OAuth 2.0 Bearer token in the `Authorization` header containing scopes appropriate for the resource being accessed.<br>
                The API Consumer must be registered with the Shared Digital Health Record API.<br>
            """

* issue[+].severity = #error
* issue[=].code = #suppressed
* issue[=].details = #UNAUTHORISED
* issue[=].diagnostics = "Unauthorised."