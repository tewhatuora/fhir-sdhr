Instance: ObservationVitalSignsExample
InstanceOf: SDHRObservation
Description: "An example SDHR Vital Signs Observation"
Usage: #example

* meta insert HPIFacility(F38006-B)

* insert LocalIdentifierExample

* code = $sct#122869004 "Measurement procedure (procedure)"
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"

* subject insert Patient(ZKC7284, Sage Westbrook)

* performer insert Practitioner(91ZZXZ, DR Beverly Crusher)

* issued = "2024-12-12T04:22:55.965Z"

* status = #final

* effectiveDateTime = "2024-12-12T04:22:55.965Z"

* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].code.coding.userSelected = true
* component[=].valueQuantity = 73 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].code.coding.userSelected = true
* component[=].valueQuantity = 73 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8867-4 "Heart rate"
* component[=].valueQuantity = 44 '/min' "beats/minute"
* component[=].code.coding.userSelected = true
* component[+].code = $loinc#80404-7 "R-R interval.standard deviation (Heart rate variability)"
* component[=].valueQuantity = 44 'ms' "milliseconds"
* component[=].code.coding.userSelected = true
* component[+].code = $loinc#9279-1 "Respiratory rate"
* component[=].valueQuantity = 17 '/min' "breaths/minute"
* component[=].code.coding.userSelected = true
* component[+].code = $loinc#8310-5 "Body temperature"
* component[=].valueQuantity = 38 'Cel' "degree Celsius"
* component[=].code.coding.userSelected = true

* meta.versionId = "1"
* meta.lastUpdated = "2025-01-26T00:21:56.607Z"