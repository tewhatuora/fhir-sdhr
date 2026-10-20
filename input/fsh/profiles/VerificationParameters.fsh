Profile: SDHRVerificationSubmissionParameters
Parent: Parameters
Description: "Parameters profile for AuditEvent verification submission payloads."

* parameter 1..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains verification 1..100

* parameter[verification].name = "verification"
* parameter[verification].part 2..2
* parameter[verification].part ^slicing.discriminator.type = #value
* parameter[verification].part ^slicing.discriminator.path = "name"
* parameter[verification].part ^slicing.rules = #open
* parameter[verification].part contains
    auditEvent 1..1 and
    result 1..1

* parameter[verification].part[auditEvent].name = "auditEvent"
* parameter[verification].part[auditEvent].value[x] only Reference
* parameter[verification].part[auditEvent].valueReference 1..1
* parameter[verification].part[auditEvent].valueReference.reference 1..1
* parameter[verification].part[auditEvent].valueReference.reference ^short = "Relative or absolute reference identifying a local AuditEvent sample"
* parameter[verification].part[auditEvent].resource 0..0

* parameter[verification].part[result].name = "result"
* parameter[verification].part[result].value[x] only code
* parameter[verification].part[result].valueCode 1..1
* parameter[verification].part[result].valueCode from SDHRVerificationResultValueSet (required)
* parameter[verification].part[result].resource 0..0

Profile: SDHRVerificationSubmissionResponseParameters
Parent: Parameters
Description: "Parameters profile for AuditEvent verification submission response payloads. One result is returned per submitted verification, in request order. Invalid items may have no usable AuditEvent reference."

* parameter 1..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains verificationSubmissionResult 1..100

* parameter[verificationSubmissionResult].name = "verificationSubmissionResult"
* parameter[verificationSubmissionResult].part 2..2
* parameter[verificationSubmissionResult].part ^slicing.discriminator.type = #value
* parameter[verificationSubmissionResult].part ^slicing.discriminator.path = "name"
* parameter[verificationSubmissionResult].part ^slicing.rules = #open
* parameter[verificationSubmissionResult].part contains
    auditEvent 1..1 and
    status 1..1

* parameter[verificationSubmissionResult].part[auditEvent].name = "auditEvent"
* parameter[verificationSubmissionResult].part[auditEvent].value[x] only Reference
* parameter[verificationSubmissionResult].part[auditEvent].resource 0..0

* parameter[verificationSubmissionResult].part[status].name = "status"
* parameter[verificationSubmissionResult].part[status].value[x] only code
* parameter[verificationSubmissionResult].part[status].valueCode 1..1
* parameter[verificationSubmissionResult].part[status].valueCode from SDHRVerificationSubmissionStatusValueSet (required)
* parameter[verificationSubmissionResult].part[status].valueCode ^short = "Processing status for this verification submission"
* parameter[verificationSubmissionResult].part[status].resource 0..0
