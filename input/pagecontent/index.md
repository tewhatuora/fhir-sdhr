# NZ Shared Digital Health Record (SDHR) API

Enables a person’s core health information to be securely accessed from their general practice PMS. This information can then be made available to health professionals across Aotearoa.

# Brief Description

The Shared Digital Health Record (SDHR) API will enable a person’s core health information to be securely accessed from their general practice PMS. With the patient’s permission, information will be copied to a central database which will be made available to health professionals across Aotearoa, through existing shared patient record systems, such as shared electronic health records. This will give a fuller view of a person’s important health information and enable better care.

This health information will initially include a person’s health conditions and allergies, observations (eg, heart rate and blood pressure)

<!-- , and encounters (when they’ve seen a health professional). -->

# Overview

- The SDHR data service will enable a person's core health information to be accessed across care settings nationally, and, in time, to be updated.
- It will give health professionals access to the important patient information they need to care for people.
- New Zealanders will be reassured that their important healthcare data can be securely accessed where and when needed – which could be life saving.

# Accessible Data

The SDHR API will initially access the following information from PMSs.

* [Allergies and intolerances.](./StructureDefinition-SDHRAllergyIntolerance.html)
* [Health conditions.](./StructureDefinition-SDHRCondition.html)
<!-- * [Encounters (when someone has interacted with the health system).](./StructureDefinition-SDHREncounter.html) -->
* [Observations.](./StructureDefinition-SDHRObservation.html)
<!-- * [Consent](./StructureDefinition-SDHRConsent.html) -->

Further information may become available to be accessed over time.

# Who can use this API

Access to the SDHR APIs is currently limited to pre-approved integration partners involved in the development of the Shared Digital Health Record data service. The APIs will be generally available following this initial development phase, subject to future funding decisions.

The SDHR API is for:

- accredited healthcare providers
- health software developers
- developers of practice management systems, consumer-facing patient portals or third-party integrators
- shared electronic health record vendors, enabling them to access data from SDHR and make it available to existing shared patient record systems.

Healthcare professionals using clinical workstations (CWS) or PMSs that have the SDHR API will be able to access the central minimum dataset of patient information through their CWS or PMS.

# Use Cases

SDHR will enable:

- health professionals to access patient information to support the care of that patient, wherever in the country the person or health professional is
- health professionals to have a summary view of a patient’s health record, copied from the patient’s general practice’s PMS
- someone’s information to be accessed in emergency situations. For example, if a person is unconscious in the emergency department, the SDHR data service will give rapid access to potentially life-saving information about their allergies, medications, and medical history
- (in time), health professionals to update a patient’s health record.

# Onboarding and Implementation

To begin the onboarding process for this API, please visit the [Consumer onboarding page](https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding/).

For more information on integrating, please review the [Implementation guide](https://fhir-ig.digital.health.nz/sdhr/index.html).

# API Types

## FHIR API

All FHIR API endpoints adhere to Fast Healthcare Interoperable Resources (FHIR) interoperability standards and follow REST protocols

# Service Levels

- Target 99.99 percent service availability 24 hours a day, seven days a week.
- For support when using the SDHR APIs, please use the link here to access the SDHR service desk portal or call the team on 0800 855 066 (press 2 and then 1). These channels are currently monitored:  

  - 8am - 5pm, Monday to Friday (from 9.30am on Wednesdays)
  - 9am - 2pm, Saturday

# Additional Requirements

Any additional requirements for consuming the SDHR APIs will be released once the service is made available for onboarding, following this initial development phase, and subject to future funding decisions.

# FHIR version

{% include cross-version-analysis.xhtml %}

# Postman Collection

We provide a Postman collection for the Mock+ and UAT environments. These environments contain placeholder values for the client ID, client secret, and developer email address which you will need to replace with your own values. The Postman collections are available in the following locations:

* [UAT Collection](postman/UAT-SDHR.postman_collection.json)
* [UAT Environment](postman/UAT-SDHR-example.postman_environment.json)
