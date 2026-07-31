The Shared Digital Health Record (SDHR), provided by Health New Zealand | Te Whatu Ora (Health NZ), enables authorised clinical systems to securely access and share core patient health information across care settings. It brings together information from the SDHR Primary Care Collection and selected national sources through common standards, subject to participation, privacy, confidentiality, security, and access controls. Source systems remain responsible for maintaining the information they provide.

### Patient information

Information is available from:

#### SDHR Primary Care Collection

Information contributed by participating primary care providers:

- [Allergies and intolerances](./StructureDefinition-SDHRAllergyIntolerance.html)
- [Health conditions](./StructureDefinition-SDHRCondition.html)
- [Observations](./StructureDefinition-SDHRObservation.html)

#### Additional information sources (in development)

Information planned to be made available from national health information sources:

- [Medication requests](./StructureDefinition-SDHRMedicationRequest.html)
- [Medication dispenses](./StructureDefinition-SDHRMedicationDispense.html)
- [Immunisations](./StructureDefinition-SDHRImmunization.html)

See [Contribute information to SDHR](./contribute-information.html), [Access information from SDHR](./access-information.html), [Data overview](./data-overview.html), [data models](./data-models.html), and [FHIR artifacts](./artifacts.html) for information about supported interactions, data, profiles, and implementation requirements.

### Integration patterns

Clinical systems integrate with SDHR in one or both of the following ways.

#### Access SDHR information

Shared electronic health record (SEHR) systems and other authorised clinical applications retrieve patient health information from SDHR and make it available to healthcare professionals involved in providing care.

SEHR systems use SDHR information (alongside other clinical information sources as required) to provide a consolidated view of a person's health information.

See the [requirements for systems providing access to SDHR information](./compliance-requirements-reading.html).

#### Contribute SDHR information

Participating practice management systems (PMS) contribute patient health information to the SDHR Primary Care Collection on behalf of participating primary care providers.

The PMS remains the system of record for information contributed to the SDHR Primary Care Collection.

See the [requirements for systems contributing data](./compliance-requirements.html).

### Getting started

To begin integrating with SDHR:

- Begin the onboarding process through the [Digital Services Hub consumer onboarding process](https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding/).
- Review the use cases for [contributing information](./contribute-information.html) and [accessing information](./access-information.html), and the [data overview](./data-overview.html).
- Review the [API documentation](./api.html).
- Explore the [FHIR artifacts](./artifacts.html) and [data models](./data-models.html).
- Review the requirements for systems [accessing](./compliance-requirements-reading.html) or [contributing](./compliance-requirements.html) SDHR information.
- Download the [UAT Postman collection](postman/UAT-SDHR.postman_collection.json) and [example environment](postman/UAT-SDHR-example.postman_environment.json).

### Additional information

Additional information about SDHR, participation, privacy, and onboarding:

- **For patients:** [SDHR privacy and information-sharing choices](https://www.healthnz.govt.nz/privacy/wider-sharing-of-your-health-information/privacy-shared-digital-health-record).
- **For practices:** [About the Shared Digital Health Record](https://www.healthnz.govt.nz/health-professionals/guidance-standards/topic/digital-technologies/digital-health-initiatives/shared-digital-health-record).
- **For participating providers:** [Onboarding to the Shared Digital Health Record](https://www.healthnz.govt.nz/health-professionals/guidance-standards/topic/digital-technologies/digital-health-initiatives/shared-digital-health-record/onboarding-to-the-shared-digital-health-record).

### FHIR version

{% include cross-version-analysis.xhtml %}
