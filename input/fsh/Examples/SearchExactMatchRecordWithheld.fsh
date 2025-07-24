Instance: SearchExactMatchRecordWithheldExample

InstanceOf: Bundle
Description: """
              Example of a searchset API response for an Condition resource search where the patient has withheld records at their PMS.
              In this case, the server does not have the record but the parameters supplied in the search mean we are able to uniquely match to a single record that has been withheld using the $participate operation.
              The search response returns zero entries `'total':0`.
              The response includes an entry which is an `OperationOutcome` resource indicating that records were withheld at source.
              This is indicated by the `search.mode` being set to `outcome` for the `OperationOutcome` entry.
            """
Usage: #example
* meta.lastUpdated = "2025-04-29T23:35:29.795Z"
* type = #searchset
* total = 0
* link.relation = "self"
* link.url = "https://api.mock.sdhr.digital.health.nz/s2s/Condition?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC4633&_source=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FLocation%2FF38006-B&identifier=6b8a6cc1-612f-456e-89df-9fbcd753acb2"
* entry[+].resource = OperationOutcomeRecordsWithheldAtSource
* entry[=].search.mode = #outcome
