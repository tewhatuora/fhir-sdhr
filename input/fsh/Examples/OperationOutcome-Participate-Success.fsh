Instance: ParticipateSuccessOutcome
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a successful participation operation indicating that the patient's participation status was successfully recorded."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0].system = "http://terminology.hl7.org/CodeSystem/operation-outcome"
* issue[0].details.coding[0].code = #MSG_SUCCESS
* issue[0].details.coding[0].display = "Operation successful"
* issue[0].details.text = "Patient participation status successfully recorded."