Instance: HypertensionConditionExample
InstanceOf: SDHRCondition
Description: "Example Hypertension Condition"
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta.profile = $SDHRConditionProfile
* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
* extension.valueBoolean = true
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#38341003 "HT - Hypertension"
* code.text = "Hypertension"

* subject insert PatientSubject(ZKC7284, Carrey Carrington)

* recorder insert PractitionerPerformer(99ZZZZ, Dottie McStuffins)

* onsetDateTime = "2011-02-05T00:00:00+13:00"
* recordedDate = "2023-11-26T10:02:45+13:00"

* identifier.system = $HealthRecordKey
* identifier.value = "ef5b3aad-14c2-4904-aa25-7411dcb21327"

* asserter insert PractitionerPerformer(91ZZXN, DR Julian Subatoi Bashir)