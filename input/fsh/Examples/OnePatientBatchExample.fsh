Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $sct = http://snomed.info/sct

Instance: GOFSH-GENERATED-ID-0
InstanceOf: Bundle
Usage: #example
* type = #batch
* meta.profile = "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRBatchBundle"
* entry[0].fullUrl = "urn:uuid:2c9a5a2b-4b2a-4d2a-a9e2-2a7e9f6f0c01"
* entry[=].resource = Inline-Condition-1
* entry[=].request.method = #POST
* entry[=].request.url = "Condition"
* entry[+].fullUrl = "urn:uuid:1d8e3b41-5a29-4c43-8d0d-6e1d0b0f5a02"
* entry[=].resource = Inline-Condition-2
* entry[=].request.method = #PUT
* entry[=].request.url = "Condition/Inline-Condition-2"

Instance: Inline-Condition-1
InstanceOf: Condition
Usage: #inline
* meta.source = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B"
* meta.profile = "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/long-term-condition"
* extension.valueBoolean = true
* identifier.use = #secondary
* identifier.system = "https://fhir.examplepms.co.nz"
* identifier.value = "ec2d6cad-1e19-46ee-accf-dc460a680710"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#38341003 "HT - Hypertension"
* code.text = "Hypertension"
* subject = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZMW6002) "Sage Westbrook"
* subject.type = "Patient"
* onsetDateTime = "2011-02-05T00:00:00+13:00"
* recordedDate = "2023-11-26T10:02:45+13:00"
* recorder = Reference(https://api.hip.digital.health.nz/fhir/Practitioner/99ZZZZ) "Dottie McStuffins"
* recorder.type = "Practitioner"
* asserter = Reference(https://api.hip.digital.health.nz/fhir/Practitioner/91ZZXN) "DR Julian Subatoi Bashir"
* asserter.type = "Practitioner"

Instance: Inline-Condition-2
InstanceOf: Condition
Usage: #inline
* meta.profile = "https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/SDHRCondition"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#38341003 "HT - Hypertension"
* code.text = "Hypertension"
* subject = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZMW6003) "Sage Westbrook"
* subject.type = "Patient"
* recordedDate = "2025-08-20T10:02:45+12:00"