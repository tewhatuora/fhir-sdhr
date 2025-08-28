Profile: BatchBundle
Parent: Bundle
Id: SDHRBatchBundle
Title: "Batch Bundle with a Single Patient"
Description: "All Patient references inside the batch must refer to the same Patient."
* type = #batch (exactly)
* obeys one-patient-only
* obeys no-participation-ops

Invariant: one-patient-only
Description: "All Patient references in the bundle are the same (compares full reference strings)."
Severity: #error
Expression: "entry.resource.descendants().where($this is Reference).reference.where(matches('(^|.*/)?Patient/[^/]+$')).exists() and entry.resource.descendants().where($this is Reference).reference.where(matches('(^|.*/)?Patient/[^/]+$')).distinct().count() = 1"

Invariant: no-participation-ops
Description: "Bundle entries MUST NOT invoke $participate or $hnz-participate."
Severity: #error
Expression: "entry.request.url.where($this.matches('[$](participate|hnz-participate)')).exists().not()"