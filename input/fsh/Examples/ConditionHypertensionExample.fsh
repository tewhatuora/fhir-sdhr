Instance: ConditionHypertensionExample
InstanceOf: SDHRCondition
Description: "Example Hypertension Condition"
Usage: #example
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"

* meta insert HPIFacility(F38006-B)

//* meta insert MetaTagExample

* insert LocalIdentifierExample

* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
* extension.valueBoolean = true
* extension[+] insert HNZSDHRClientLastUpdated(2023-11-26T10:02:45+13:00)
* extension[+] insert HNZSDHRHighlighted(true)

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#38341003 "HT - Hypertension"
* code.text = "Hypertension"

* subject insert Patient(ZKC7284, Sage Westbrook)

* recorder insert Practitioner(99ZZZZ, Dottie McStuffins)

* onsetDateTime = "2011-02-05T00:00:00+13:00"
* recordedDate = "2023-11-26T10:02:45+13:00"

* asserter insert Practitioner(91ZZXN, DR Julian Subatoi Bashir)