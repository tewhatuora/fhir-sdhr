Like any NZ organisation collecting or sharing patient health information, Health NZ must abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *NZ Shared Digital Health Record API* has implemented the following measures:

1. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances.

If a health consumer chooses not to participate in SDHR, they can contact the Health NZ assisted channel. This action creates a `Consent` record for the patient with the `provision.type` property set to `deny`.

Health NZ channels also record the reason for global opt-out in the root `Consent.provision.extension` using URL `https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-global-opt-out-reason-extension` and a `valueCode`. A globally denied consent with reason `patient-deceased` causes read, vread, and search requests rejected by the global consent check to return HTTP `403` with code `sdhr-participation-status-denied-deceased` and message "Patient data is unavailable in the Shared Digital Health Record as they are deceased."

Other or missing global opt-out reasons retain the generic global-denial outcome. Write requests also retain the generic global-denial outcome. A reason extension alone, without `provision.type` set to `deny`, does not trigger deceased global denial. See the [deceased global-denial example](./OperationOutcome-OperationOutcomeGlobalDenyDeceasedExample.html) and [global participation denial API behaviour](./api.html#global-participation-denial-api-behaviour).

For clarity, in general, the `Consent` scope is not available to consuming application and should be considered an administrative function.
