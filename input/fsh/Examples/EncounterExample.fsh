Instance: EncounterExample
InstanceOf: SDHREncounter
Description: "Example Encounter resource to record an instance of an interaction between patient and healthcare provider"
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"

* meta insert HPIFacility(F38006-B)

* extension insert HNZSDHRClientLastUpdated(2023-11-26T10:02:45+13:00)

* insert LocalIdentifierExample

* subject insert Patient(ZKC7284, Sage Westbrook)

// * identifier[+].system = $HealthRecordKey
// * identifier[=].value = "f4121d2e-61aa-4222-83ae-b36d26bbbe62"

* serviceType = http://terminology.hl7.org/CodeSystem/service-type#124 "General Practice"

* status = #finished

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#ENC "Encounter"

* period.start = "2024-03-26T10:13:26+13:00" 

* participant.type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF "primary performer"
* participant.individual insert Practitioner(91ZABY, Dr Andrea Welby)

