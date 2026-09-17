Like any NZ organisation collecting or sharing patient health information, Health NZ must abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *NZ Shared Digital Health Record API* has implemented the following measures:

1. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances.

If a health consumer chooses not to participate in SDHR, they can contact the Health NZ assisted channel. This action creates a `Consent` record for the patient with the `provision.type` property set to `deny`.

For clarity, in general, the `Consent` scope is not available to consuming application and should be considered an administrative function.
