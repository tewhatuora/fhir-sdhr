Instance: SearchConditionResponseExample
InstanceOf: Bundle
Description: "Example of a search response for a condition search. In this case the search response returns one result using the search parameters `code` and `subject`. `GET /Condition?subject=https://api.hip.digital.health.nz/fhir/Patient/ZKC7284&code=http://snomed.info/sct%7C38341003`"
Usage: #example
* meta.lastUpdated = "2025-04-29T23:35:29.795Z"
* type = #searchset
* total = 1
* link.relation = "self"
* link.url = "https://api.mock.sdhr.digital.health.nz/s2s/Condition?code=http%3A%2F%2Fsnomed.info%2Fsct%7C38341003&subject=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2Fnhi%2Fv1%2FPatient%2FZKC7284"
* entry.search.mode = #match
* entry.fullUrl = "https://api.mock.sdhr.digital.health.nz/s2s/Condition/ConditionHypertensionExample"
* entry.resource = ConditionHypertensionExample
