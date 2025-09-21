Profile: BatchBundle
Parent: Bundle
Id: SDHRBatchBundle
Title: "Batch Bundle with a Single Patient"
Description: """
SDHR allows Bundle posts with the following restrictions:
- The Bundle type must be `batch` (transactions are not supported).
- All Patient references in the Bundle must target a single Patient.
- The Bundle must not contain any $participate or $hnz-participate requests.
"""
* type = #batch (exactly)
* obeys one-patient-only
* obeys no-participation-ops
