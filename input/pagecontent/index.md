# NZ Shared Digital Health Record (SDHR) API

This FHIR API supports authorised submission of and access to Aotearoa patients shared digital health records. Data will be stored and surfaced to [authorised Health consumers](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-workers) and the [patient](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-sector-participants) themselves as part of their personal health record. 

The API Enables registered health care providers access to health consumer information, made available from an individual’s enrolled primary care practice management systems (PMSs), to provide a nationally available minimum dataset of patient information available to health professionals.

## Brief description

The Shared Digital Health Record (SDHR) API will enable a person’s core health information to be securely accessed from their general practice PMS. With the patient’s permission, information will be copied to a central database which will be made available to health professionals across Aotearoa, through existing shared patient record systems, such as shared electronic health records. This will give a fuller view of a person’s important health information and enable better care.

This health information will initially include a person’s health conditions and allergies, observations (eg, smoking status, heart rate and blood pressure), and encounters (when they’ve seen a health professional).

The FHIR resources supported are:
* [AllergyIntolerance](./StructureDefinition-SDHRAllergyIntolerance.html)
* [Condition](./StructureDefinition-SDHRCondition.html)
* [Consent](./StructureDefinition-SDHRConsent.html)
* [Encounter](./StructureDefinition-SDHREncounter.html)
* [Observation](./StructureDefinition-SDHRObservation.html)

# Overview

- SDHR is a data service that will enable healthcare providers to access to, and in future the ability to update, a person's core health information across care settings nationally.

- It will give health professionals access to the important patient information they need to care for people.

- New Zealanders will be reassured that their important healthcare data can be securely accessed where and when needed – which could be life saving.

# Accessible data

The SDHR API will initially access the following information from PMSs.

- Health conditions.
- Encounters (when someone has interacted with the health system).
- Allergies and intolerances.
- Observations (smoking status, vaping status, vital signs).

Further information may become available to be accessed over time.

# Who can use this API

The SDHR API is for:
- Accredited health care providers
- health software developers
- developers of practice management systems, consumer-facing patient portals or third-party integrators
- shared electronic health record vendors, enabling them to access data from SDHR and make it available to existing shared patient record systems.

Healthcare professionals using clinical workstations or PMSs that have the SDHR API will be able to access the central minimum dataset of patient information through their CWS or PMS.

# Use cases

SDHR will enable:
- health professionals to access patient information to support the care of that patient, wherever in the country the person or health professional is
- health professionals to have a summary view of a patient’s health record, copied from their general practice’s PMS
- someone’s information to be accessed in emergency situations. For example, if a person is unconscious in the emergency department, the SDHR will give rapid access to potentially life-saving information about their allergies, medications, and medical history
- (in time), health professionals to update a patient’s health record.

# Onboarding and implementation

To begin the onboarding process for this API, please visit the Consumer onboarding page.

For more information on integrating, please review the Implementation guide [https://fhir-ig.digital.health.nz/sdhr/index.html].

# API types

## FHIR API

All FHIR API endpoints adhere to Fast Healthcare Interoperable Resources (FHIR) interoperability standards and follow REST protocols.

## Service levels

- Target 99.99 percent service availability 24 hours a day, seven days a week.
- For support when using the SDHR, please use the link here to access the SDHR service desk portal or call the team on 0800 855 066 (press 2 and then 1). These channels are currently monitored:

- 8am - 5pm, Monday to Friday (from 9.30am on Wednesdays)
- 9am - 2pm, Saturday Additional requirements

Any additional requirements the API subscriber will need to know. You should also include any specific requirements we need to ensure is included in the API Subscriber agreement which all subscribers of your API will need to agree and sign. You will need to consult with Legal on this.

### FHIR version

{% include cross-version-analysis.xhtml %}

