Instance: ParticipateInvalidPatientOutcome
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for an invalid patient participation operation indicating that the patient parameter is invalid."
Usage: #example
* issue[0].severity = #error
* issue[0].code = #value
* issue[0].details.coding[0].system = "http://terminology.hl7.org/CodeSystem/operation-outcome"
* issue[0].details.coding[0].code = #MSG_PARAM_INVALID
* issue[0].details.coding[0].display = "Invalid parameter value"
* issue[0].details.text = "The patient reference does not match the required NHI Patient URL format."
* issue[0].expression[0] = "Parameters.patient"