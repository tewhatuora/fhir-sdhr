Instance: OperationOutcomePatientLocked
InstanceOf: OperationOutcome
Description: """
This outcome message will be returned in a special case where a patient record has been `locked` due to a background load process where the SDHR service is performing a historic record load for a patient.
A typical scenario where this would occur would be where a practice has 'onboarded' to the SDHR service and SDHR is sourcing historic records for a patient who has contented to participation.
If a data holder receives this outcome when loading records they should queue the failed record(s) and retry after a delay.
"""
Usage: #example
* issue[0].severity = #error
* issue[0].code = #value
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-patient-locked "SDHR Patient Locked"
* issue[0].details.text = "The patient has been temporarily locked due to a background load process"