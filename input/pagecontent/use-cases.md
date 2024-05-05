### Overview

The Primary care acquisition API allows collection of a patient's clinical information from practice management systems to allow information to be surfaced back to consumers as part of their personal health record and to other health providers with their consent. 

The information collected includes: 

* AllergyIntolerance	
* Condition
* Consent	
* Encounter
* Observations (for smoking status, vaping status, vital signs)

### Consent-based access control

Like any NZ organisation collecting/sharing patient health information, Te Whatu Ora Health New Zealand has to abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *Primary Care Data Acquisition API* has implemented the following measures:

1. Client applications **MUST** record the patient's actual consent to Te Whatu Ora Health New Zealand collecting their health information using instances of the [PrimaryCareConsent](./StructureDefinition-PrimaryCareConsent.html) resource on this server, and
2. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances based on presence of a valid referencing Consent resource instances, and  
3. The actual FHIR resource instances to be protected **MUST** be referenced in FHIR `.provision.data.` references in an associated Consent instance.

It is up to the each health organisation storing/sharing health information through this FHIR API to
- Operate a process which obtains patient consent, and
- Arrange for their FHIR-integrated application to call the FHIR API to create appropriate FHIR Consent resources representing the state of patients' consents.

### Consent-based protection measures

#### Access control measure
When a client application, authorized by TWO to access the FHIR API, tries to access an instance of  
  a FHIR resource X of an **access-controlled type** at a Url like:  
  
```
  FHIR_API_URL/{resource-type}/X (where X is a resource instance identifier)
```  

- This API permits access to X only when a valid Consent instance is found that references X - this allows all FHIR client applications authorized by Te Whatu Ora to access the resource instance.  
- If the API finds no valid Consent instance that references X, access is denied to all FHIR client applications (including the application that created the resource instance).


### Data provision

When a patient's record is updated in the patient management system for an encounter, Allergy/Intolerance info, a condition/diagnosis, or a Smoking/Vaping/Vital Signs observation, FHIR resources representing this information should be POSTed to the API. 

This may be a queued update performed later or performed synchronously as updates are made. 

If needed bundled batches may be supported - TBC. 

