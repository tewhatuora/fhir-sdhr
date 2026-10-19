Instance: OperationOutcomeGlobalDenyDeceasedExample
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a read or search request denied by a global opt-out with reason patient-deceased."
Usage: #example

* issue[0].severity = #error
* issue[0].code = #suppressed
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-participation-status-denied-deceased "SDHR Participation Status Denied - Patient Deceased"
* issue[0].details.text = "Patient data is unavailable in the Shared Digital Health Record as they are deceased."