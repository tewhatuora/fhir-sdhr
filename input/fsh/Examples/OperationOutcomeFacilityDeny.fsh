Instance: OperationOutcomeFacilityDenyExample
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a request where the patient has opted out of participating in the shared digital health record service for a specific facility."
Usage: #example

* issue[0].severity = #error
* issue[0].code = #suppressed
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-participation-status-denied-facility "SDHR Participation Status Denied at Facility"
* issue[0].details.text = "Patient has opted out of participating in the shared digital health record service at this facility."