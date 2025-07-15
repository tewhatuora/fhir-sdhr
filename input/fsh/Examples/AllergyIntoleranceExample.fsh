Instance: AllergyIntoleranceExample
InstanceOf: SDHRAllergyIntolerance
Usage: #example
Description: "An example payload for a Primary Care AllergyIntolerance resource indicating an allergy to Penicillin, with a confidentiality of restricted."
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta insert HPIFacility(F38006-B)
* meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R "Restricted"

* extension[+] insert HNZSDHRClientLastUpdated(2023-11-26T10:02:45+13:00)

* insert LocalIdentifierExample

* type = #allergy
* clinicalStatus = $sct#443601000210103 "Active Phase"
* verificationStatus = $sct#410605003 "Confirmed present"
* code = $sct#91936005 "Allergy to penicillin (finding)"
* code.coding.userSelected = true
* category = $sct#62014003 "Adverse reaction caused by drug (disorder)"

* patient insert Patient(ZKC7284, Sage Westbrook)

* recorder insert Practitioner(91ZZXN, DR Julian Subatoi Bashir)

Instance: AllergyIntoleranceExample2
InstanceOf: SDHRAllergyIntolerance
Usage: #example
Description: "An example payload for a Primary Care AllergyIntolerance resource indicating an allergy to Cashew nuts"
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta insert HPIFacility(F38006-B)

* insert LocalIdentifierExample

* type = #allergy
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed "Confirmed"
* code = http://snomed.info/sct#227493005 "Cashew nuts"
* code.coding.userSelected = true
* category = $sct#370540009 "Adverse reaction caused by food (disorder)"
* patient insert Patient(ZKC7284, Sage Westbrook)
* recorder insert Practitioner(91ZZXN, DR Julian Subatoi Bashir)