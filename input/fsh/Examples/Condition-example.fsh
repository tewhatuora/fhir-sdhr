Instance: conditionExample1
InstanceOf: PrimaryCareCondition
Description: "Example NzCondition resource to record problems and conditions affecting a person"
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta.profile = $PrimaryCareConditionProfile
* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
* extension.valueBoolean = true
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#38341003 "HT - Hypertension"
* code.text = "Hypertension"

* subject.type = "Patient"
* subject.identifier.use = #official
* subject.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* subject.identifier.value = "ZAT3948"
* subject.display = "Jamie Joseph Ryan"

// * subject.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
// * subject.identifier.value = "ZAT3948"
// * subject.type = "Patient"
// * subject.display = "Jamie Joseph Ryan"
* onsetDateTime = "2011-02-05T00:00:00+13:00"
* recordedDate = "2023-11-26T10:02:45+13:00"
* recorder.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* recorder.identifier.value = "91ZABY"
* recorder.type = "Practitioner"
* recorder.display = "Dr Andrea Welby"
* identifier.system = $HealthRecordKey
* identifier.value = "ef5b3aad-14c2-4904-aa25-7411dcb21327"

* asserter.type = "Practitioner"
* asserter.identifier.use = #official
* asserter.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* asserter.identifier.value = "99ZZFX"