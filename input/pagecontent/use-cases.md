### Overview

The Shared Digital Health Record (SDHR) API allows collection of a patient's clinical information from practice management systems to allow information to be surfaced back to consumers as part of their personal health record and to other health providers with their consent. 

The information collected includes: 
	
* Condition
* Encounter
* Observations (for smoking status, vaping status, vital signs)
* and Consent resources to record consent for these resources. 


### Data provision

When a patient's record is updated in the patient management system for an encounter, Allergy/Intolerance info, a condition/diagnosis, or a Smoking/Vaping/Vital Signs observation, FHIR resources representing this information should be POSTed to the API. 

This may be a queued update performed later or performed synchronously as updates are made. 


