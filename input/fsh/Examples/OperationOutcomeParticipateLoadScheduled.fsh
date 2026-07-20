Instance: OperationOutcomeParticipateLoadScheduled
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a successful HNZ participation operation where the patient's participation status was recorded and historic-load work was scheduled."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-operation-success "SDHR Operation Success"
* issue[0].details.text = "Patient participation status successfully recorded."
* issue[1].severity = #information
* issue[1].code = #informational
* issue[1].details.coding[0] = $sdhr-outcome-codes#sdhr-historic-load-scheduled "SDHR Historic Load Scheduled"
* issue[1].details.text = "A historic load has been scheduled."
