### Overview

[The Shared Digital Health Record (SDHR) API](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#api-provider) facilitates access to a patient's clinical information held in Health NZ, primary, and secondary care systems. This allows information to be surfaced back to [authorised health workers](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#health-workers) who are using an approved clinical system. [API consumers](https://apistandards.digital.health.nz/api-concepts/ComponentDefinitions#api-consumer).

This IG is a Draft only. Please be aware it is subject to change. Profiles are being updated regularly. Please do not rely on the current version for development decisions.

### Collection of structured health information from Primary care providers

#### Business Purpose

To collect patient information from a participating Health Service Provider, via their PMS.

#### Scope

Applies to: 

- Allergies and Intolerances 
- Conditions  
- Observations  

#### Key Behaviour

- Clinical data is recorded in PMS. 
- Data is sent to the Shared Digital Health Record as close to real-time as possible, subject to patient privacy choices. 
- The Shared Digital Health Record stores a copy only (and the PMS remains the system of record). 

#### Important Rules

- Historical data is only collected if the patient is enrolled at the contributing HSP. 
- Data marked as confidential/sensitive within the source system must not be submitted to the Shared Digital Health Record. 
- Data is rejected if the patient has chosen to opt out of data sharing for information held at a given facility, or if they have chosen not to participate in the Shared Digital Health Record data sharing at all. 
- The PMS is responsible for ensuring the copy of data in the Shared Digital Health Record accurately reflects the state of the data in the PMS. 

### Clinical Access Clinical Data

#### Business Purpose

To provide clinicians with access to relevant patient information from multiple sources, enabling safer and more informed care. 

#### Scope

Applies to: 

- Allergies and intolerances 
- Conditions  
- Observations  
- Medications (prescriptions and dispensing) 
- Observations  

#### Key Behaviour

- Data is retrieved for a specific resource using:  
    - patient identifier (NHI)  
    - any other optional search filters. 
- Patient privacy preferences are applied before data is returned. 
- SEHR is responsible for displaying the data to clinical end users. 

- The request must include the context of the request, for auditing purposes. 

#### Important Rules

- Historical data is only collected if the patient is enrolled at the contributing HSP. 
- Data marked as confidential/sensitive within the source system must not be submitted to the Shared Digital Health Record. 
- Data is rejected if the patient has chosen to opt out of data sharing for information held at a given facility, or if they have chosen not to participate in the Shared Digital Health Record data sharing at all. 
- The PMS is responsible for ensuring the copy of data in the Shared Digital Health Record accurately reflects the state of the data in the PMS. 

### Domain Descriptions
 
#### Allergies and Intolerances
 
**Alias:** Adverse Reactions, Adverse Drug Reactions (ADR), Adverse Events, Adverse Events Following Immunisation (AEFI), Medical Warnings, Warnings, Alerts, Side Effects.
 
**Clinical description:** A record of a harmful or undesirable, physiological response which is unique to an individual and associated with exposure to a substance.
 
**Considerations for use:**
 
Primary care information is collected from practices, with respect for the confidentiality and sharing preferences as expressed by the health consumer.
 
Note that allergy and intolerance records cannot be made confidential at the record / domain level.
 
Data sources will be added over time.
 
---
 
#### Conditions

**Alias:** Problems, Diagnoses, Classifications.
 
**Clinical description:** For one person, this can cover:

Problems and conditions affecting the person, including long term and other current health issues such as:
 
- A disability
- Symptoms
- Diseases
- Pregnancy
- An allergy
- Risk factors such as high blood cholesterol and obesity
- Social history
- Family history
Social issues and family history concepts are included as non-clinical conditions because these are recorded as 'Classifications' in some PMS types, which feed into the 'Conditions' resource.
 
**Considerations for use:**
 
Primary care information is collected from practices, with respect for the confidentiality and sharing preferences as expressed by the health consumer.
 
Data sources will be added over time.
 
---
 
#### Observations
 
**Alias:** Vital sign, Health Consumer Measurement
 
**Clinical description:** The physiological measurements and vital signs that are important to the person's life stage, health risks, and conditions.
 
**Considerations for use:**
 
Primary care information is collected from practices, with respect for the confidentiality and sharing preferences as expressed by the Health Consumer.
 
Data sources will be added over time.
 
---

#### Medications

Including: 
- Prescribed Medications
- Dispensed Medications

**Alias:** Medicines, Medicines/Medication data, Medicines/Medication history, Prescribed and dispensed medicines, Administered Medicines/Medications
- HealthOne: Prescribed medications, Dispensed medications
- Medtech Evo: Patient Medications
- Valencia SEHR: Medication

**Clinical description:** SDHR Medications represents a clinically focussed view of a person's prescribed and dispensed medicines, sourced from the national Medicines Data Repository (MDR).
 
It supports clinicians to understand what medications a person has been prescribed, what has been dispensed, and how medicines use may relate to clinical presentation, safety risks, and treatment decisions.
 
**Considerations for use:**
 
- Medications information is presented as a longitudinal view with practical limits, reflecting current MDR data availability and risk managed scope.
- Dispensed medications are generally the most reliable indicator of medicines supplied to a patient; however, MDR dispensing does not confirm collection, ingestion, or adherence.
- Prescribed medications provide important context — they can reflect intention but may not always reflect real-world use.
- Clinical interpretation often requires correlation with other information (e.g., labs, observations, conditions).
- Historical depth is occasionally critical, particularly for long-term therapies or cumulative-dose medications; however the majority of clinical objectives can be met with a recent history (last 2–3 years).
- Prescriptions for medications that are later invalidated or cancelled prior to any meds being issued will not be included in SDHR medications data to reduce the risk of clinical misinterpretation.
- SDHR medications data is limited to prescribing and dispensing data sourced from NZePS integrated systems and surfaced via the MDR FHIR API. Variability in system implementation and workflows means data completeness and behaviour may differ by source. Current NZePS integrated systems include:
  - Almost all NZ GP practices
  - All NZ community pharmacies
  - Several speciality prescribing systems
  - Secondary care use is expanding, primarily for outpatient prescribing.
- MDR dispensed dates reflect pharmacy preparation rather than collection, and there may be delays between preparation and patient receipt.
- Dispenses that are prepared and then subsequently reversed because they were not collected will be omitted from SDHR medications records.

**Misuse (clinical):**
 
- Medications data may be misinterpreted if viewed without sufficient clinical context or reconciliation.
- Over-reliance on incomplete records may lead to incorrect assumptions about adherence, treatment failure, or therapeutic intent.
- An inappropriate or ineffective trial of medication may be repeated if insufficient historical data is available.
- Inappropriate access or interpretation could contribute to stigma or bias, particularly for medications associated with mental health, pain management, or substance use.


**Confidentiality:**
 
- MDR data may include confidential records.
- Confidentiality controls can be applied within prescribing and dispensing systems and carried through to MDR; however, their interpretation may vary depending on how NZePS prescribing and dispensing systems have mapped their confidentiality options.
- Historic medications records reflect patient confidentiality choices (or system ignorance) at the time of the record creation, not necessarily current preferences.
- Access must be auditable and consistent with legal and policy requirements.
- Clinical use should account for known limitations in confidentiality handling and avoid assumptions where records may be incomplete or restricted.
**Sensitivity:**
 
- Medications information can reveal highly sensitive clinical details including mental health treatment, oncology, infectious diseases, reproductive health, and substance dependence.
- Disclosure or misinterpretation may impact patient trust if not handled appropriately.

**Notes / Issues:**
 
- Medications lists are not always complete or fully reconciled.
- The way medications data is presented in the UI has a material impact on clinical safety. This includes how easily clinicians can access and view related clinical information, such as allergies and laboratory results, to support accurate interpretation.
- Medications data reflects multiple source systems with differing workflows and data quality characteristics.
- Limited feedback loops exist to correct or annotate inaccurate medications information.
- "Administered Medications" are not recorded in NZePS. These are generally given in inpatient settings, but also can be in outpatient and some clinic settings.


#### Immunisations *(coming soon)*
 
**Alias:** Vital sign, Health Consumer Measurement
 
**Clinical description:** The physiological measurements and vital signs that are important to the person's life stage, health risks, and conditions.
 
**Considerations for use:**
 
Primary care information is collected from practices, with respect for the confidentiality and sharing preferences as expressed by the Health Consumer.
 
Data sources will be added over time.