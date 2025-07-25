Instance: OperationOutcomeParticipatePreferencesNotKnown
InstanceOf: OperationOutcome
Description: "Example OperationOutcome where a patient has not indicated their participation preferences for the Shared Digital Health Record service."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-participation-unknown "SDHR Participation Unknown"
* issue[0].details.text = "The Shared Digital Health Record service has no record of participation preferences for this patient. Please use the $participate operation to indicate the patients participation preferences."