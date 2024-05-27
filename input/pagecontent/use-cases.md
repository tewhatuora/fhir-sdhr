### Overview

The Primary care acquisition API allows collection of a patient's clinical information from practice management systems to allow information to be surfaced back to consumers as part of their personal health record and to other health providers with their consent. 

The information collected includes: 

* AllergyIntolerance	
* Condition
* Consent	
* Encounter
* Observations (for smoking status, vaping status, vital signs)

Details of consent resource usage to opt-out of sharing information at a global, facility or clinical record level TBC. 

### Data provision

When a patient's record is updated in the patient management system for an encounter, Allergy/Intolerance info, a condition/diagnosis, or a Smoking/Vaping/Vital Signs observation, FHIR resources representing this information should be POSTed to the API. 

This may be a queued update performed later or performed synchronously as updates are made. 

If needed bundled batches may be supported - TBC. 

### API Usage Plan

A blanket usage plan of 20 requests per second per client, will be applied to all clients at the connector plane API Gateway.

