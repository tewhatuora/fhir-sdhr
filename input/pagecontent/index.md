# NZ Shared Digital Health Record API

This FHIR API supports the submission of Primary Care data for individual patients. Data will be stored and surfaced back to the Health consumers as part of their personal health record and to other health providers with the consent of the patient. 

The resources supported are:	
* Condition
* Encounter
* Observation (profiles for smoking status, vaping status, vital signs)
* and Consent resources to record consent for these resources. 

### Dependencies and relationship to other standards

For consistency the NZPS profiles for vaping, smoking, and vitalsigns are used for their respective observation profiles. 

### FHIR version

{% include cross-version-analysis.xhtml %}
