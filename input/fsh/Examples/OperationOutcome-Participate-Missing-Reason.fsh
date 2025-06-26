Instance: ParticipateMissingReasonOutcome
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a missing reason code in the Participate operation indicating that the reason for participation status is required."
Usage: #example
* issue[0].severity = #error
* issue[0].code = #required
* issue[0].details.coding[0].system = "http://terminology.hl7.org/CodeSystem/operation-outcome"
* issue[0].details.coding[0].code = #MSG_PARAM_REQUIRED
* issue[0].details.coding[0].display = "Missing required parameter"
* issue[0].details.text = "The reasonCode parameter must be provided when participationIndicator is false."
* issue[0].expression[0] = "Parameters.reasonCode"