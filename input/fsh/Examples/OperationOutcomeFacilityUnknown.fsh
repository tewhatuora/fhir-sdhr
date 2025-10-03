Instance: OperationOutcomeFacilityUnknown
InstanceOf: OperationOutcome
Description: """
This outcome message will be returned where a facility is not yet onboarded to SDHR.
"""
Usage: #example
* issue[0].severity = #error
* issue[0].code = #value
* issue[0].details.coding[0] = $sdhr-outcome-codes#sdhr-facility-unknown "SDHR Facility Unknown"
* issue[0].details.text = "The facility has not been onboarded to SDHR"
