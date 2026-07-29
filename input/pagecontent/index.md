The Shared Digital Health Record (SDHR) enables authorised clinical systems to access and share core patient health information to support the provision of healthcare.

Through SDHR, information from the SDHR Primary Care Collection and selected national health information sources is made available through a common interoperability platform. Information is shared subject to patient participation choices and appropriate privacy, confidentiality, security, and access controls.

SDHR acts as a trusted source for accessing core health information for a patient across care settings. Information from participating systems is made available through common interoperability standards and information models, with consistent privacy, choice, and control options applied. Source systems remain responsible for creating and authoritatively maintaining their information. The initial release of SDHR accommodates variation in clinical coding and recording practices across participating systems while providing a common framework for information sharing and access.

### Patient Information

SDHR makes selected patient health information available from both the SDHR Primary Care Collection and national health information sources.

#### SDHR Primary Care Collection

Information contributed by participating primary care providers:

- [Allergies and intolerances](./StructureDefinition-SDHRAllergyIntolerance.html)
- [Health conditions](./StructureDefinition-SDHRCondition.html)
- [Observations](./StructureDefinition-SDHRObservation.html)

#### Additional Information Sources (in development)

Information planned to be made available from national health information sources:

- [Medication requests](./StructureDefinition-SDHRMedicationRequest.html)
- [Medication dispenses](./StructureDefinition-SDHRMedicationDispense.html)
- [Immunisations](./StructureDefinition-SDHRImmunization.html)

See [Contribute Information to SDHR](./contribute-information.html), [Access Information from SDHR](./access-information.html), [Data Overview](./data-overview.html), [Data Models](./data-models.html), and [FHIR Artifacts](./artifacts.html) for information about supported interactions, data, profiles, and implementation requirements.

### Integration Patterns

Clinical systems integrate with SDHR in one or both of the following ways.

#### Access SDHR Information

Shared Electronic Health Record (SEHR) systems and other authorised clinical applications retrieve patient health information from SDHR and make it available to healthcare professionals involved in providing care.

SEHR systems use SDHR information (alongside other clinical information sources as required) to provide a consolidated view of a person's health information.

See the [requirements for systems providing access to SDHR information](./compliance-requirements-reading.html).

#### Contribute SDHR Information

Participating PMS systems contribute patient health information to the SDHR Primary Care Collection on behalf of participating primary care providers.

The PMS remains the system of record for information contributed to the SDHR Primary Care Collection.

See the [requirements for systems contributing data](./compliance-requirements.html).

### Getting Started

To begin integrating with SDHR:

- Begin the onboarding process through the [Digital Services Hub consumer onboarding process](https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding/).
- Review the use cases for [contributing information](./contribute-information.html) and [accessing information](./access-information.html), and the [Data Overview](./data-overview.html).
- Review the [API documentation](./api.html).
- Explore the [FHIR Artifacts](./artifacts.html) and [Data Models](./data-models.html).
- Review the requirements for systems [accessing](./compliance-requirements-reading.html) or [contributing](./compliance-requirements.html) SDHR information.
- Download the [UAT Postman collection](postman/UAT-SDHR.postman_collection.json) and [example environment](postman/UAT-SDHR-example.postman_environment.json).

### Additional Information

Additional information about SDHR, participation, privacy, and onboarding:

- **For patients:** [SDHR privacy and information-sharing choices](https://www.healthnz.govt.nz/privacy/wider-sharing-of-your-health-information/privacy-shared-digital-health-record).
- **For practices:** [About the Shared Digital Health Record](https://www.healthnz.govt.nz/health-professionals/guidance-standards/topic/digital-technologies/digital-health-initiatives/shared-digital-health-record).
- **For participating providers:** [Onboarding to the Shared Digital Health Record](https://www.healthnz.govt.nz/health-professionals/guidance-standards/topic/digital-technologies/digital-health-initiatives/shared-digital-health-record/onboarding-to-the-shared-digital-health-record).

### FHIR Version

{% include cross-version-analysis.xhtml %}
