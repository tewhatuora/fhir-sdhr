### Overview

The Primary care acquisition API allows collection of a patient's clinical information from practice management systems to allow information to be surfaced back to consumers as part of their personal health record and to other health providers with their consent. 

The information collected includes: 

* Encounters
* Care plans
* Problems/conditions
* Allergies and intolerances
* Observations
* Measures and Vital Signs
* Smoking Status and Vaping Status

The Health consumer can opt-out of sharing information at a global, facility or clinical record level.

### Patient consent

A health consumer has the option of opting out of sharing their information from a practice management system. 

* a global level
* a facility (GP Practice) level
* a resource level (TBC)

A patient's opt out information is provided as a FHIR consent resource. This consent resource would be provided when [trigger conditions].

### Data provision

When a patient's record is updated in the patient management system for an encounter, Allergy/Intolerance info, a condition/diagnosis, or a Smoking/Vaping/Vital Signs observation, FHIR resources representing this information should be posted to the API. 

