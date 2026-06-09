# fhir-sdhr

FHIR Implementation Guide Shared Digital Health Record API 

Health New Zealand | Te Whatu Ora Shared Digital Health Record FHIR API.

## Local development

`./_updatePublisher.sh -y` - Download the latest FHIR Publisher

`./_genonce.sh` - Build the IG using the latest FHIR Publisher

`./_genopenapi.sh` - Generate an HNZ OpenAPI specification. Run after `_genonce.sh` to avoid changes being lost

`http-server output` - To run a local server (install using `npm install --global http-server`)

