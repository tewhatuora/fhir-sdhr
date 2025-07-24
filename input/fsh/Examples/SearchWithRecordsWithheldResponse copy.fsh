Instance: SearchWithRecordsWithheldExample

InstanceOf: Bundle
Description: """
              Example of a searchset API response for an Condition resource search where the patient has withheld records at their PMS.
              In this case, the search response returns one entry `'total':1`.
              The response also includes an entry which is an `OperationOutcome` resource indicating that some records were withheld at source.
              This is indicated by the `search.mode` being set to `outcome` for the `OperationOutcome` entry.
            """
Usage: #example
* meta.lastUpdated = "2025-04-29T23:35:29.795Z"
* type = #searchset
* total = 1
* link.relation = "self"
* link.url = "https://api.mock.sdhr.digital.health.nz/s2s/Condition?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC7284"
* entry[+].resource = ConditionHypertensionExample
* entry[=].fullUrl = "https://api.mock.sdhr.digital.health.nz/s2s/Condition/ConditionHypertensionExample"
* entry[=].search.mode = #match
* entry[+].resource = OperationOutcomeRecordsWithheldAtSource
* entry[=].search.mode = #outcome
