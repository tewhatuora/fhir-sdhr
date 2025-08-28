Profile: BatchBundle
Parent: Bundle
Id: SDHRBatchBundle
Title: "Batch Bundle with a Single Patient"
Description: "All Patient references inside the batch must refer to the same Patient."
* type = #batch (exactly)
* obeys one-patient-only
* obeys no-participation-ops
