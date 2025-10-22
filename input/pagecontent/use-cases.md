### Overview

[The Shared Digital Health Record (SDHR) API](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#api-provider) allows collection of a patient's clinical information from ministry, primary and secondary care systems, allowing information to be surfaced back to [authorised health sector](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-workers) [API consumers](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#api-consumer).


This IG is a Draft only. Please be aware it is subject to change. Profiles are being updated regularly. Please do not rely on the current version for development decisions.

The information included in the Shared Digital Health Record: 
	
* [AllergyIntolerance](./StructureDefinition-SDHRAllergyIntolerance.html)
* [Condition](./StructureDefinition-SDHRCondition.html)
<!-- * [Encounter](./StructureDefinition-SDHREncounter.html) -->
* [Observation](./StructureDefinition-SDHRObservation.html)

* [Immunization](https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/StructureDefinition-air-immunization.html)

<!-- * and Consent resources to record consent for these resources.  -->

### Data provision

When a patient's record is created or updated in a system of record for an allergy/intolerance, condition, or observation, FHIR resources representing this information should be POSTed or PUT to the API. 

This should be performed synchronously as soon as the change is made to the record.
