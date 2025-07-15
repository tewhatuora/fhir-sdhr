Like any NZ organisation collecting/sharing patient health information, Te Whatu Ora Health New Zealand has to abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *NZ Shared Digital Health Record API* has implemented the following measures:

1. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances.

For the Shared Digital Health Record, if a health consumer elects **NOT** to participate this will be done by contacting the Health New Zealand assisted channel. The result of this action will be a `Consent` record created for this patient with a `provision.type` property set to `deny`

For clarity, in general, the `Consent` scope is not available to consuming application and should be considered an administrative function.

An [example consent resource](./Consent-ConsentExample.html) is included to show what this should look like. 




