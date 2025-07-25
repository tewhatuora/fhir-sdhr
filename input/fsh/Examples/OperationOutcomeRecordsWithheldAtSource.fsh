Instance: OperationOutcomeRecordsWithheldAtSource
InstanceOf: OperationOutcome
Description: "Example OperationOutcome when a patient has withheld records at source."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-records-withheld-at-source "Records withheld at source"
* issue[0].details.text = "Patient has withheld records at source. The operation was successful, but some records were not included in the response due to confidentiality settings."