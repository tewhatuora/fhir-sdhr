Extension: NzepsItemStatus
Id: nzeps-item-status
Title: "NZePS Item Status"
Description: "NZePS item status returned alongside MedicationRequest.status. For active prescriptions it may indicate whether repeats remain; SDHR status filtering uses MedicationRequest.status."
Context: MedicationRequest
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzeps-item-status"
* ^status = #draft
* extension 0..0
* value[x] only code
* valueCode 1..1
