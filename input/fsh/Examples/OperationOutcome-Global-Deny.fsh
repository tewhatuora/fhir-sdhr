Instance: GlobalDenyOperationFailedOutcome
InstanceOf: OperationOutcome
Description: "Example OperationOutcome for a request where the patient has opted out of participating in the service."
Usage: #example

// exact codes to be defined.

* issue[0].severity = #error
* issue[0].code = #suppressed
* issue[0].details.coding[0].system = "http://terminology.hl7.org/CodeSystem/operation-outcome"
* issue[0].details.coding[0].code = #MSG_RESOURCE_NOT_ALLOWED
* issue[0].details.coding[0].display = "Operation successful"
* issue[0].details.text = "Patient has opted out of participating in the service."
