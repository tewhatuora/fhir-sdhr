Instance: ConditionRespiratoryExample
InstanceOf: SDHRCondition
Description: "Example Respiratory Condition"
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"

* meta insert HPIFacility(F38006-B)

* insert LocalIdentifierExample

* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
* extension.valueBoolean = false
* extension[+] insert HNZSDHRClientLastUpdated(2025-01-26T10:02:45+13:00)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = http://health.govt.nz/read-codes#H051.00 "Acute up resp tract infection"

* subject insert Patient(ZKC7284, Sage Westbrook)

* recorder insert Practitioner(91ZZXN, DR Julian Subatoi Bashir)

* onsetDateTime = "2011-02-05T00:00:00+13:00"
* recordedDate = "2023-11-26T10:02:45+13:00"

* asserter insert Practitioner(99ZZZZ, Dottie McStuffins)
