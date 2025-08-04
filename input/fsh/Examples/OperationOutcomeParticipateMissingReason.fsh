Instance: OperationOutcomeParticipateMissingReason
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a missing reason code in the Participate operation indicating that the reason for participation status is required."
Usage: #example
* issue[0].severity = #error
* issue[0].code = #required

* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-parameter-missing "SDHR Required parameter missing"
* issue[0].details.text = "The reasonCode parameter must be provided when operation is indicating records are withheld at the source."
// * issue[0].expression[0] = "Parameters.reasonCode"