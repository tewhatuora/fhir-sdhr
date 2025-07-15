Instance: OperationOutcomeParticipateSuccess
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a successful participation operation indicating that the patient's participation status was successfully recorded."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-operation-success "SDHR Operation Success"
* issue[0].details.text = "Patient participation status successfully recorded."