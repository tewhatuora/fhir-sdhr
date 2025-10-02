Instance: OperationOutcomeRateLimitExceeded
InstanceOf: OperationOutcome
Description: """
This outcome message will be returned where an API Consumer has exceeded the allocated rate limit.
"""
Usage: #example
* issue[0].severity = #error
* issue[0].code = #throttled
* issue[0].details.text = "Throttled"
