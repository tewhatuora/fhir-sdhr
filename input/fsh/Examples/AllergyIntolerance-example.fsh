Instance: AllergyIntoleranceExample
InstanceOf: SDHRAllergyIntolerance
Usage: #example
Description: "An example payload for a Primary Care AllergyIntolerance resource indicating an allergy to Penicillin"
* meta.lastUpdated = "2024-01-26T10:03:26+13:00"
* meta insert HPIFacility(F38006-B)
//* meta.profile = $SDHRAllergyIntoleranceProfile

* insert LocalIdentifierExample

* type = #allergy
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed "Confirmed"
* code = http://mims.co.nz#m00286 "Penicillins"
* code.coding.userSelected = true
* category = #medication

* patient insert PatientSubject(ZKC7284, Carrey Carrington)

* recorder insert PractitionerPerformer(91ZZXN, DR Julian Subatoi Bashir)