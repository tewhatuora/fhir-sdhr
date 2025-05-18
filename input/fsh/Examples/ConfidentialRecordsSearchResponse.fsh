Instance: ConfidentialRecordsSearchResponseExample
InstanceOf: Bundle
Description: """
              Example of a searchset API response for an AllergyIntolerance resource search.
              In this case, the search response returns one entry item, with a total count of 2. This is because the API will not return the confidential record.
              The redacted security label is applied to the Bundle response, to indicate that confidential records have been removed from the result set.
              See the [API documentation](./api.html#sdhr-confidential-record-api-behaviour) for more information.
            """
Usage: #example
* meta.lastUpdated = "2025-04-29T23:35:29.795Z"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#redacted "REDACTED"
* type = #searchset
* total = 2
* link.relation = "self"
* link.url = "https://api.mock.sdhr.digital.health.nz/s2s/AllergyIntolerance?patient=https%3A%2F%2Fapi.hip.digital.health.nz%2Ffhir%2FPatient%2FZKC7284"
* entry[+].resource = AllergyIntoleranceExample2
* entry[=].fullUrl = "https://api.mock.sdhr.digital.health.nz/s2s/AllergyIntolerance/AllergyIntoleranceExample2"
* entry[=].search.mode = #match
