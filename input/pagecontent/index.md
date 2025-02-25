# NZ Shared Digital Health Record API

This FHIR API supports the submission of Primary Care data for patients. Data will be stored and surfaced to [authorised Health consumers](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-workers) and the [patient](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-sector-participants) themselves as part of their personal health record. 

The resources supported are:	
* [AllergyIntolerance](./StructureDefinition-SDHRAllergyIntolerance.html)
* [Condition](./StructureDefinition-SDHRCondition.html)
* [Encounter](./StructureDefinition-SDHREncounter.html)
* [Observation](./StructureDefinition-SDHRObservation.html)

* [Immunization](https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/StructureDefinition-air-immunization.html)
<!-- * and Consent resources to record consent for these resources.  -->

### FHIR version

{% include cross-version-analysis.xhtml %}
