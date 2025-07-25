Instance: OperationOutcomeParticipateInvalidPatient
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for an invalid patient participation operation indicating that the patient parameter is invalid."
Usage: #example
* issue[0].severity = #error
* issue[0].code = #value
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-invalid-patient "SDHR Invalid Patient"
* issue[0].details.text = "The patient parameter is invalid for the shared digital health record service operation. Please ensure the patient is correctly specified and matches the required NHI Patient URL format."
// * issue[0].expression[0] = "Parameters.patient"