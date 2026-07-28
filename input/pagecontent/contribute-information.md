### Purpose and scope
{: .underlined}

To write patient health information from a participating Practice Management System (PMS) to the SDHR Primary Care Collection.

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
      <td>Participating primary care provider</td>
      <td>Participates in SDHR and is responsible for the care setting from which information is written.</td>
    </tr>
    <tr>
      <td>PMS</td>
      <td>Determines whether source information is eligible for sharing and writes eligible information to SDHR.</td>
    </tr>
    <tr>
      <td>SDHR</td>
      <td>Validates writes, applies relevant controls, and stores an accepted copy.</td>
    </tr>
    <tr>
      <td>Healthcare professional</td>
      <td>Records or updates information in the PMS, where relevant to the source workflow.</td>
    </tr>
  </tbody>
</table>

#### Scope

This use case currently applies to information written to the SDHR Primary Care Collection:

- [Allergies and intolerances](./data-domains.html#allergies-and-intolerances)
- [Health conditions](./data-domains.html#conditions)
- [Observations](./data-domains.html#observations)

The corresponding FHIR representations are described in [Data Models](./data-models.html) and [FHIR Artifacts](./artifacts.html).

#### Preconditions

- The provider participates in SDHR.
- The PMS has completed the required onboarding and compliance process.
- The PMS is authorised to write information to SDHR.
- Patients participate in SDHR by default unless they have opted out globally or at the relevant facility.
- Before the first resource can be successfully created for a patient at a facility, the API caller has recorded that patient's facility participation preference.
- Information excluded from sharing will not be written.

### Write information
{: .underlined}

#### Write workflow

{% include contribute-write-workflow.svg %}

#### Processing steps

1. A healthcare professional records or updates clinical information in the PMS.
2. The PMS determines whether the information is eligible to be written, including whether the patient has opted out and whether source confidentiality controls permit sharing.
3. Before the first resource can be successfully created for the patient at a facility, the PMS uses the [`$participate` operation](./api.html#participation-operations) to record the facility participation preference. As shown in the sequence diagram, this may occur after SDHR rejects an initial write because the preference is unknown, followed by a retry of the write. The same operation records a later opt-out, restores participation after an earlier opt-out, and manages record-level confidentiality.
4. The PMS determines whether to create a new SDHR resource or update an existing resource. Existing resources are located and retrieved before update.
5. The PMS writes the eligible FHIR resource to SDHR.
6. SDHR validates the request and resource and applies applicable participation and privacy controls.
7. A successful create returns `201 Created` with the created resource; a successful update returns `200 OK` with the updated resource.
8. A rejected write returns an `OperationOutcome`, which the PMS records and handles as a failed write.

#### Key behaviour

- Clinical information is recorded and maintained in the PMS.
- The PMS determines whether information is eligible to be written to SDHR.
- The PMS writes eligible information to the SDHR Primary Care Collection.
- SDHR applies validation and relevant privacy and participation controls.
- SDHR stores a copy of accepted information.
- The PMS remains the source system for information written to the SDHR Primary Care Collection.

#### Response and error handling

- A successful `$participate` request returns an `OperationOutcome` containing a success result.
- A successful create normally returns `201 Created` with the created resource.
- A successful update normally returns `200 OK` with the updated resource.
- A batch write returns a `batch-response` Bundle containing the outcome of each entry.
- A rejected single-resource write returns an `OperationOutcome`.
- A failed entry in a batch is represented in that entry's batch response and may contain an `OperationOutcome`.
- The PMS must not mark a write as successful when SDHR rejects the request or resource.
- Detailed status codes, response payloads, validation rules, and errors are documented in the [API documentation](./api.html).

### Manage participation
{: .underlined}

Patients participate in SDHR by default. A patient who has not opted out does not need to take a specific action to opt in.

The API still requires an explicit participation preference before the first resource can be successfully created for that patient at a given facility. The PMS records the default preference on the patient's behalf through `$participate`; this is technical initialisation and does not represent a separate opt-in decision by the patient.

The PMS must also respect global and facility-level opt-outs and record-level confidentiality choices. These choices, and any later restoration of participation, are managed through SDHR participation capabilities, including the `$participate` operation where applicable. `$participate` returns an `OperationOutcome` indicating whether the participation preference was accepted or why it failed. Detailed parameters, examples, and outcome definitions are documented in the [`$participate` OperationDefinition](./OperationDefinition-SDHRParticipateOperation.html).

#### Facility participation

The following diagram covers the facility participation scenarios:

1. The first write for a patient at a facility establishes the default participation preference if SDHR reports that the preference is unknown.
2. A facility opt-out records `participationIndicator` as `false` and prevents subsequent resources from being shared from that facility.
3. A facility opt-back-in records `participationIndicator` as `true`, allows routine writes to resume, and can trigger the assigned historical-load process for an enrolled patient.

{% include participate-sequence-pmsoptoff.svg %}

The PMS must immediately prevent new or changed local records for the patient from being written after a facility opt-out is recorded. See [Reload after a patient opts back in](#reload-after-a-patient-opts-back-in) for the historical information process that follows an opt-back-in.

#### Set record-level confidentiality

{% include participate-sequence-pmsrecordwithheld.svg %}

A new confidential `Condition` or `Observation` record must not be written to SDHR. If a copy already exists when the source record becomes confidential, the PMS must follow the documented update and confidentiality process. `AllergyIntolerance` records cannot be withheld at record level. See the [confidential record API behaviour](./api.html#sdhr-confidential-record-api-behaviour) and [compliance requirements for systems sharing data](./compliance-requirements.html).

### Load historical information
{: .underlined}

Historical loads populate the SDHR Primary Care Collection with eligible information recorded before routine SDHR writes began. Historical information remains subject to provider onboarding, patient participation, enrolment, confidentiality, and source-quality requirements.

#### Initial facility historical load

SDHR supports two acquisition designs. Each PMS implementation uses the design assigned during onboarding:

- **Pull-based:** SDHR performs the initial load on behalf of the application.
- **Push-based:** the application initiates and controls the load through the bulk API.

{% include initial-facility-historical-load.svg %}

The initial load:

- includes only patients enrolled at the participating facility who have not opted out;
- applies existing source opt-out choices before information is loaded;
- includes all eligible historical depth rather than imposing an arbitrary time limit;
- excludes confidential `Condition` and `Observation` records and records already deleted in the source system; and
- must not overwrite a newer resource written through the routine API.

For pull-based acquisition, SDHR temporarily locks the facility against routine writes while it performs the historical load; a write attempted during this period receives the [Facility Locked `OperationOutcome`](./OperationOutcome-OperationOutcomeFacilityLocked.html). For push-based acquisition, the PMS Orchestrator is responsible for coordinating historical and real-time writes so that older history does not overwrite newer data.

Detailed assurance requirements are documented under [Concurrent historical and real-time data](./compliance-requirements.html#SSD-8) and [Facility onboarding and historical data load](./compliance-requirements.html#SSD-17).

#### Reload after a patient opts back in

When a patient opts back in at a facility, their eligible history must be reloaded for that facility. For pull-based acquisition, SDHR initiates the individual load. For push-based acquisition, the application initiates the load.

When a patient opts back in through a Health NZ channel after a global opt-out, the application must be able to receive a notification and trigger a load of the enrolled patient's history. An API-triggered process is preferred; a controlled manual process may be used where agreed during onboarding.

{% include patient-historical-reload.svg %}

For pull-based acquisition, SDHR temporarily locks the patient against routine writes while it performs the reload; a write attempted during this period receives the [Patient Locked `OperationOutcome`](./OperationOutcome-OperationOutcomePatientLocked.html). For push-based acquisition, the PMS Orchestrator is responsible for coordinating historical and real-time writes so that older history does not overwrite newer data.

The application must resume writing eligible new and changed information at the earliest practical time once the applicable load coordination permits. See [Concurrent historical and real-time data](./compliance-requirements.html#SSD-8), the [facility opt-back-in requirements](./compliance-requirements.html#SSD-14), and the [global opt-back-in requirements](./compliance-requirements.html#SSD-16).

### Business rules
{: .underlined}

- Information must not be written where patient participation choices prevent sharing.
- A patient who has not opted out must not be required to make a separate opt-in decision, although the API caller must initialise the facility participation preference before successfully creating the first resource for that patient at that facility.
- Information marked confidential, sensitive, or otherwise excluded from sharing in the source system must not be written, except where the documented confidentiality process requires an existing SDHR copy to be restricted.
- Historical information must only be loaded where permitted by SDHR participation, onboarding, and implementation requirements.
- The PMS is responsible for ensuring that information written to SDHR accurately reflects the information held in the PMS.
- The PMS remains responsible for source-system correction and update processes.
- SDHR stores a copy of accepted information for authorised access, but does not replace the PMS as the source system.

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
      <td><code>$participate</code></td>
      <td>Initialise a facility preference, record opt-outs, restore participation after an opt-out, and manage record-level withholding or release.</td>
      <td><a href="./api.html#participation-operations">Participation operations</a></td>
    </tr>
    <tr>
      <td>Search and read</td>
      <td>Locate and retrieve an existing resource before update.</td>
      <td><a href="./api.html#contributed-resource-interactions">Contributed resource interactions</a></td>
    </tr>
    <tr>
      <td>Create</td>
      <td>Write a new eligible resource.</td>
      <td><a href="./api.html#contributed-resource-interactions">Contributed resource interactions</a></td>
    </tr>
    <tr>
      <td>Update</td>
      <td>Reconcile an existing SDHR copy with the source PMS.</td>
      <td><a href="./api.html#sdhr-resource-updates">Resource update behaviour</a></td>
    </tr>
    <tr>
      <td>Batch</td>
      <td>Write multiple eligible resources in a FHIR batch.</td>
      <td><a href="./api.html#batch-interaction">Batch interaction</a></td>
    </tr>
    <tr>
      <td>Errors and confidentiality</td>
      <td>Handle validation, participation, and confidentiality outcomes.</td>
      <td><a href="./api.html#sdhr-confidential-record-api-behaviour">Confidential record API behaviour</a></td>
    </tr>
  </tbody>
</table>
