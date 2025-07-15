Instance: OperationOutcomeGlobalDenyExample
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a request where the patient has opted out of participating in the shared digital health record service."
Usage: #example

* issue[0].severity = #error
* issue[0].code = #suppressed
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-participate-deny "SDHR Participate Deny"
* issue[0].details.text = "Patient has opted out of participating in the shared digital health record service."