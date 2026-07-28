> **Draft**: This page is subject to change and will be updated as the access workflow and associated assurance requirements are confirmed.

### Purpose and scope
{: .underlined}

To allow Shared Electronic Health Record (SEHR) systems and other clinical portal applications to retrieve patient health information from SDHR and make it available to healthcare professionals involved in providing care.

#### Actors

<table class="grid">
  <thead>
    <tr>
      <th>Actor</th>
      <th>Role</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Healthcare professional</td>
      <td>Uses information in the context of providing care to a specific patient.</td>
    </tr>
    <tr>
      <td>Shared Electronic Health Record (SEHR) system</td>
      <td>Identifies the patient, supplies the required access context, requests information, and presents the response.</td>
    </tr>
    <tr>
      <td>SDHR</td>
      <td>Applies applicable controls, audits access, and returns information the requester is authorised to access.</td>
    </tr>
    <tr>
      <td>Source systems</td>
      <td>Originate information made available through SDHR.</td>
    </tr>
  </tbody>
</table>

#### Scope

This use case currently or progressively applies to:

- [Allergies and intolerances](./data-domains.html#allergies-and-intolerances)
- [Health conditions](./data-domains.html#conditions)
- [Observations](./data-domains.html#observations)
- [Medication requests](./data-domains.html#medications) — in development
- [Medication dispenses](./data-domains.html#medications) — in development
- [Immunisations](./data-domains.html#immunisations) — in development

The corresponding FHIR representations are described in [Data Models](./data-models.html) and [FHIR Artifacts](./artifacts.html).

### Business rules
{: .underlined}

- Requests must include sufficient context to support audit and access review.
- Patient participation and privacy controls must be applied before information is returned.
- Confidential or restricted information must only be returned where permitted.
- Accessing systems must present SDHR information in a way that supports safe clinical interpretation.
- Accessing systems should make source, date, status, and relevant limitations visible where these affect interpretation.
- Accessing systems must comply with the [requirements for systems reading SDHR information](./compliance-requirements-reading.html).
- Accessing systems must not imply that absence of information in SDHR means absence of a clinical condition, medication, allergy, observation, immunisation, or other relevant health information.

#### Preconditions

- The accessing system has completed onboarding and required compliance activities.
- The accessing system is authorised to access SDHR.
- The healthcare professional is authenticated.
- The request is made in the context of a specific patient.
- The patient can be identified, normally using NHI.
- Patient participation, privacy, confidentiality, security, and access controls permit information to be returned.
- The request includes required user, organisation, facility, and request context for audit purposes, where applicable.

### Access information
{: .underlined}

#### Access workflow

<!-- Generated from `input/images-source/access-information-workflow.plantuml` -->
{% include access-information-workflow.svg %}

#### Processing steps

1. A healthcare professional selects a specific patient in the SEHR.
2. The SEHR establishes the patient, authenticated user, organisation, facility, and request context required for access and audit.
3. The SEHR uses a supported search, read, or vread interaction to request relevant information from SDHR.
4. SDHR authorises and audits the request and applies applicable participation, privacy, confidentiality, security, and access controls.
5. SDHR retrieves permitted information from the SDHR Primary Care Collection or an applicable national health information source.
6. SDHR returns authorised FHIR resources, an empty or filtered result, or an error outcome as applicable.
7. The SEHR retains required local audit and traceability information.
8. The SEHR presents source, date, status, and relevant limitations in a clinically safe and usable way.

#### Key behaviour

- The healthcare professional uses an SEHR.
- The SEHR identifies the patient and requests relevant information from SDHR.
- SDHR applies applicable privacy, participation, confidentiality, security, and access controls.
- SDHR returns information the requester is authorised to access.
- The SEHR presents the information to the healthcare professional in a clinically safe and usable way.

SDHR is not the system of record for the information it shares. Source systems remain responsible for creating, maintaining and correcting information. SDHR provides trusted access to governed health information across care settings.

#### Response and error handling

- A successful search returns a FHIR `Bundle`; a successful read or vread returns the requested resource.
- An empty result may mean that SDHR has no matching information available to the requester. It must not be presented as proof that the clinical information does not exist.
- A filtered result may contain metadata indicating that confidentiality controls removed information from the response.
- Invalid, unauthorised, or prohibited requests return an error outcome that the SEHR must handle explicitly.
- Detailed response behaviour, status codes, payloads, and errors are documented in the [API documentation](./api.html).

### Audit and user context
{: .underlined}

Access to SDHR information must be attributable to an authenticated healthcare professional or other authorised user and an authorised organisation or facility. Access must occur in the context of a specific patient. Accessing systems must provide sufficient user and request context to support audit, monitoring, privacy investigation, appropriate-use review, and assurance activities.

#### Audit access records workflow

The access-verification workflow is draft and subject to change.

<!-- Generated from `input/images-source/verification-workflow-overview.plantuml` -->
{% include verification-workflow-overview.svg %}

#### Audit processing steps

1. The SEHR records the user action and the context associated with each request to access SDHR information.
2. The SEHR sends the request to SDHR with the required access context.
3. SDHR authorises and audits the request and records the resulting access event.
4. The SEHR correlates the response with its local audit record.
5. Periodically, the SEHR retrieves sampled SDHR access events that require verification.
6. The SEHR reviews each sampled `AuditEvent` using an automated or manual process to determine whether the access was valid.
7. The SEHR submits the verification decisions to SDHR and receives the processing results.
8. The SEHR repeats the verification workflow so newly sampled access events continue to be reviewed.

The SEHR is responsible for maintaining appropriate local audit and traceability where required. See the [API Capability Statement](./CapabilityStatement-SDHRCapabilityStatement.html) for request-context mechanics, the API documentation for [access verification operations](./api.html#access-verification-operations), and the [compliance requirements for systems reading data](./compliance-requirements-reading.html).

### Related API interactions
{: .underlined}

<table class="grid">
  <thead>
    <tr>
      <th>Interaction</th>
      <th>Use in this workflow</th>
      <th>API documentation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Search and read — contributed information</td>
      <td>Retrieve information stored in the SDHR Primary Care Collection.</td>
      <td><a href="./api.html#contributed-resource-interactions">Contributed resource interactions</a></td>
    </tr>
    <tr>
      <td>Search, read, and vread — national information</td>
      <td>Retrieve information made available from supported national health information sources.</td>
      <td><a href="./api.html#national-source-resource-interactions">National source resource interactions</a></td>
    </tr>
    <tr>
      <td>Request context</td>
      <td>Attribute access to the user, organisation, facility, and patient context.</td>
      <td><a href="./api.html#authentication-and-request-context">Authentication and request context</a></td>
    </tr>
    <tr>
      <td>Access verification</td>
      <td>Review sampled access events and submit verification decisions.</td>
      <td><a href="./api.html#access-verification-operations">Access verification operations</a></td>
    </tr>
    <tr>
      <td>Filtered and empty results</td>
      <td>Handle confidentiality filtering without inferring that no clinical information exists.</td>
      <td><a href="./api.html#sdhr-confidential-record-api-behaviour">Confidential record API behaviour</a></td>
    </tr>
    <tr>
      <td>Errors</td>
      <td>Handle authentication, validation, access, and request errors.</td>
      <td><a href="./OperationOutcome-APIError-Unauthorised.html">Authentication and request-context error example</a></td>
    </tr>
  </tbody>
</table>
