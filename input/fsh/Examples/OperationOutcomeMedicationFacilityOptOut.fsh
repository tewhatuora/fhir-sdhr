Instance: OperationOutcomeMedicationFacilityOptOut
InstanceOf: OperationOutcome
Description: "Medication search warning when any facility opt-out exists, including when no records were removed from the response."
Usage: #example
* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-records-withheld-at-source "Records withheld at source"
* issue[0].details.text = "Patient has opted out of sharing records from one or more facilities. Medication records from those facilities may be excluded from this response."
