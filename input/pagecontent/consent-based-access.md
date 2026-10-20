Like any NZ organisation collecting or sharing patient health information, Health NZ must abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *NZ Shared Digital Health Record API* has implemented the following measures:

1. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances.

If a health consumer chooses not to participate in SDHR, they can contact the Health NZ assisted channel. This action creates a `Consent` record for the patient with the `provision.type` property set to `deny`.

Health NZ channels also record the reason for global opt-out in the root `Consent.provision.extension` using URL `https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-global-opt-out-reason-extension` and a `valueCode`. A globally denied consent with reason `patient-deceased` causes read and search requests rejected by the global consent check to return HTTP `403` with code `sdhr-participation-status-denied-deceased` and message "Patient data is unavailable in the Shared Digital Health Record as they are deceased."

Other or missing global opt-out reasons retain the generic global-denial outcome. Write requests also retain the generic global-denial outcome. A reason extension alone, without `provision.type` set to `deny`, does not trigger deceased global denial. See the [deceased global-denial example](./OperationOutcome-OperationOutcomeGlobalDenyDeceasedExample.html) and [global participation denial API behaviour](./api.html#global-participation-denial-api-behaviour).

For clarity, in general, the `Consent` scope is not available to consuming application and should be considered an administrative function.


### Domain participation

Authorised Health NZ channels record domain choices through [`$hnz-domain-participate`](./OperationDefinition-SDHRHNZDomainParticipateOperation.html). Every request identifies exactly one patient and supplies one `domains` parameter containing one or more named boolean parts. For example:

```json
{
  "resourceType": "Parameters",
  "parameter": [
    { "name": "patient", "valueReference": { "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284" } },
    {
      "name": "domains",
      "part": [
        { "name": "SDHRMedications", "valueBoolean": false },
        { "name": "SDHRImmunisations", "valueBoolean": true }
      ]
    }
  ]
}
```

The request changes only the named patient's Consent. Omitted domains retain their existing choices, and an unrecorded choice defaults to In. A domain appears at most once. A request for one domain uses the same structure with one part. Domain requests do not accept global participation fields or multiple patients; global participation continues to use `$hnz-participate` with its required `hnzParticipationIndicator`.

For access, a deny recorded on any member of a linked NHI group denies that domain for the whole group, including searches and direct reads. Opting one member back in does not override another member's deny or change their Consent. Global opt-out takes precedence over domain permits. Medications covers MedicationRequest and MedicationDispense together; Immunisations is independent.

Domain updates do not archive or restore records, trigger historic loads, change facility/global participation, or change participation in upstream national systems. The `domainParticipation` groups in the participation-status response describe individual recorded choices; they are a response format and are not accepted as update parameters.
