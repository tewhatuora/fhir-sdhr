# Primary Care Acquisition API

This FHIR API supports the submission of Primary Care data for individual patients. Data will be stored and surfaced back to the Health consumers as part of their personal health record and to other health providers with the consent of the patient. The Health consumer will be able to opt-out of sharing information at a global, facility or clinical record level.

The resources supported are:
AllergyIntolerance			
Condition		
Consent			
Encounter		
Observation	(profiles for smoking status, vaping status, vital signs)

### Dependencies and relationship to other standards

For consistency the NZPS profiles for vaping, smoking, and vitalsigns are used for their respective observation profiles. This needs to be reviewed to confirm the profiles are appropriate for the data as held in PMS's. 

{% include dependency-table.xhtml %}

### FHIR version

{% include cross-version-analysis.xhtml %}