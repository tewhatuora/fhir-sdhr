CodeSystem: SDHROutcomeCodes
Id: sdhr-outcome-codes
Title: "SDHR Specific Outcome Codes"
Description:  "This code system defines standard OperationOucome codes used throughout this Implementation Guide for New Zealand Shared Digital Health Records"
* ^publisher = "Te Whatu Ora / Health New Zealand"
* ^experimental = false
* ^caseSensitive = true
* ^version = "1.0.0"
* ^purpose = """
The codes defined in this CodeSystem are used by the Shared Digital Health Record service to indicate the outcome of
operations.

These codes will be used in various `OperationOutcome` resources to provide feedback on the outcome of a request.

See [SDHR Participate Operation](https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/SDHRParticipateOperation) for more example information on the use of these codes.

"""

* ^status = #active

* #sdhr-records-withheld-at-source "Records withheld at source" "This code is used when the patient has records that are withheld from the Shared Digital Health Record service at source, for example, a GP practice or hospital."
* #sdhr-participation-status-denied "SDHR Participation Status Denied" "This code is used when the patient has opted out of participating in the Shared Digital Health Record service."
* #sdhr-participation-status-denied-facility "SDHR Participation Status Denied at Facility" "This code is used when the patient has opted out of participating in the Shared Digital Health Record service at a specific facility."
* #sdhr-invalid-patient "SDHR Invalid Patient" "This code is used when the patient parameter is invalid for the Shared Digital Health Record service operation. Please ensure the patient is correctly specified and matches the required NHI Patient URL format."
* #sdhr-parameter-missing "SDHR Required parameter missing" "This code is used when a required parameter is missing in the request, such as the reasonCode parameter."
* #sdhr-parameter-invalid "SDHR parameter invalid" "This code is used when a parameter is invalid in the request."
* #sdhr-participation-status-invalid "SDHR Participation Status Invalid"
* #sdhr-operation-success "SDHR Operation Success" "This code is used when the operation was successful, such as when a patient's participation status was successfully recorded."
* #sdhr-participation-status-unknown "SDHR Participation Status Unknown" "This code is used when the Shared Digital Health Record service has no record of participation preferences for this patient. Please use the $participate operation to indicate the patient's participation preferences."
* #sdhr-facility-locked "SDHR Facility Locked" "This code is used when a facility has been temporarily locked due to a background load process"
* #sdhr-patient-locked "SDHR Patient Locked" "This code is used when a patient has been temporarily locked due to a background load process"
* #sdhr-facility-unknown "SDHR Facility Unknown" "This code is used when a facility has not been onboarded to SDHR"
