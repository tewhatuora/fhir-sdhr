Instance: EncounterExample1
InstanceOf: Encounter
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta.profile = $PrimaryCareEncounterProfile
* subject.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* subject.identifier.value = "ZAT3948"
* subject.type = "Patient"
* subject.display = "Jamie Joseph Ryan"

* identifier.system = $HealthRecordKey
* identifier.value = "f4121d2e-61aa-4222-83ae-b36d26bbbe62"
* serviceType = #124
* serviceType.text = "General Practice"

* status = #finished

* class = #ss // probably wrong, needs a correct code, maybe updated binding

* period.start = "2024-03-26T10:13:26+13:00" 

* participant.type = #PPRF 
* participant.individual.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* participant.individual.identifier.value = "91ZABY"
* participant.individual.type = "Practitioner"
* participant.individual.display = "Dr Andrea Welby"

