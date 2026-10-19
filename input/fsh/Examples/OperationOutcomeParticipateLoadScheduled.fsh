Instance: OperationOutcomeParticipateLoadScheduled
InstanceOf: OperationOutcome
Description: "Successful participation response when a Medtech historic load has been scheduled. Scheduling does not confirm completion."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-operation-success "SDHR Operation Success"
* issue[0].details.text = "Patient participation status successfully recorded."
* issue[1].severity = #information
* issue[1].code = #informational
* issue[1].details.coding[0] = $sdhr-outcome-codes#sdhr-historic-load-scheduled "SDHR Historic Load Scheduled"
* issue[1].details.text = "A historic load has been scheduled."
