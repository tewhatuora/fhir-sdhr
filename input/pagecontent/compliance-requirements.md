### Important information about Compliance requirements

#### Use cases & the two step accreditation process.

These compliance requirements are for data source systems integrating with the Shared Digital Health Record to share data. In the first instance this is limited to Practice Management Systems (PMS). They do not cover the compliance tests for systems (including PMSs) that use SDHR APIs to fetch and display data for a clinical user to view. Requirements for those systems are covered separately.

<img src="flow.png" width="100%"/>

Fig 1: Applications are assessed separately for their compliance with requirements to share and view SDHR information.

#### Bulk acquisition design

There are two designs for the initial bulk acquisition of historical data from a facility when it first is connected to SDHR. These are referred to as either the Push-based or the Pull-based;

- **Pull-based** is where SHDR performs and initial bulk data load for a facility on the behalf of an application
- **Push-based** is where the application is in control of the request and uses a bulk API

Each digital subscriber will only use one of these. If a requirement is intended to apply specifically to either Push-based or Pull-based, then this will be denoted in the requirements table. It is not intended that an application need comply with both designs.

There may be some requirements that are not appropriate for every application. In this situation, provide a **written statement** for why the requirement does apply and/or a justification for an alternative outcome.

<img src="components.png" width="100%"/>

Fig 2. Data acquisition solution components

#### Types of Evidence

For each requirement, please provide appropriate evidence as per the guidance below.

<style>
/* Styles for the "Types of Evidence" table */
.joplin-table-wrapper.evidence-table table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto; /* allow columns to size to content */
}
.joplin-table-wrapper.evidence-table th,
.joplin-table-wrapper.evidence-table td {
  border: 1px solid #4a5568; /* subtle gray border */
  padding: 8px;
  vertical-align: top;
  word-break: break-word;
  overflow-wrap: anywhere;
  white-space: normal;
}
.joplin-table-wrapper.evidence-table thead th {
  background-color: #008080;
  color: #ffffff;
}

/* Styles for the Compliance Requirements table */
.joplin-table-wrapper.ssd-ref-table {
  overflow-x: auto; /* prevent the table from overflowing the page, adds horizontal scroll only if needed */
}
.joplin-table-wrapper.ssd-ref-table table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto; /* let browser auto-size columns, but respect width hints */
  counter-reset: ssd-counter;
}

/* border + basic cell styling */
.joplin-table-wrapper.ssd-ref-table th,
.joplin-table-wrapper.ssd-ref-table td {
  border: 1px solid #0e6655;
  padding: 8px;
  vertical-align: top;
  /* word-break: break-word;       break long words/URLs */
  overflow-wrap: break-word;     /* ensure text wraps instead of spilling out */
  white-space: normal;         /* allow wrapping */
}

/* teal header */
.joplin-table-wrapper.ssd-ref-table thead th {
  background-color: #008080;
  color: #ffffff;
}

/* hide existing ordered-list marker in first column */
.joplin-table-wrapper.ssd-ref-table td:first-child ol {
  list-style: none;
  margin: 0;
  padding: 0;
}

/* Only increment the SSD counter for rows that contain the first-column ol. */
.joplin-table-wrapper.ssd-ref-table tbody tr:has(td:first-child ol) {
  counter-increment: ssd-counter;
}

/* Only render the auto-number on the first-column cell that actually contains the ol */
.joplin-table-wrapper.ssd-ref-table td:first-child::before {
  content: none;
}
.joplin-table-wrapper.ssd-ref-table td:first-child:has(ol)::before {
  content: "SSD-" counter(ssd-counter);
  font-weight: 600;
  color: #0e6655;
  display: inline-block;
  margin-right: 0.5rem;
}

/* keep layout predictable when rows use rowspan/split cells */
.joplin-table-wrapper.ssd-ref-table table td,
.joplin-table-wrapper.ssd-ref-table table th {
  box-sizing: border-box;
}
</style>

<div class="joplin-table-wrapper evidence-table">
    <table>
        <thead>
            <tr>
                <th>
                    <p><strong>Types of Evidence</strong></p>
                </th>
                <th>
                    <p><strong>Guidance</strong></p>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <p><strong>HNZ test scenario</strong></p>
                </td>
                <td>
                    <p>A test scenario, and sample data, will be provided by an HNZ tester, run by vendor, and the
                        output will be provided. Please use the SDHR UAT environment to create the relevant test data to
                        complete each test.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p><strong>Design &amp; Test evidence from the Vendor</strong></p>
                </td>
                <td>
                    <p>Please provide suitable evidence of vendor design and testing, showing that the application meets
                        the expected outcome, including:</p>
                    <ul>
                        <li>Test output</li>
                        <li>Screenshots, or other evidence of input values within the application,</li>
                        <li>Screenshots or extracts of log files, or other evidence of the expected outcome values
                            within the application,</li>
                        <li>If appropriate, a video recording of the scenario may be provided instead of screenshots,
                        </li>
                        <li>Please the SDHR UAT environment to create the relevant test data to complete each scenario.
                        </li>
                    </ul>
                    <p></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p><strong>Attestation</strong></p>
                </td>
                <td>
                    <p>A statement and explanation for how the application meets the requirement. Please also supply
                        available evidence to support your statement such as</p>
                    <ul>
                        <li>A business process or SOP,</li>
                        <li>Screenshots, or other evidence of the inputs &amp; expected outcomes within the application,
                        </li>
                        <li>If appropriate, a video recording of the scenario may be provided instead of screenshots.
                        </li>
                    </ul>
                    <p></p>
                </td>
            </tr>
        </tbody>
    </table>
</div>

### Support for these compliance requirements

The SDHR team will assess your responses and discuss with you if any further clarification is needed.

### Compliance requirements

<div class="joplin-table-wrapper ssd-ref-table">
    <table>
        <thead>
            <tr>
                <th>
                    <p><strong>Ref</strong></p>
                </th>
                <th>
                    <p><strong>Purpose</strong></p>
                </th>
                <th>
                    <p><strong>Input value(s)</strong></p>
                </th>
                <th>
                    <p><strong>Expected Outcome(s)</strong></p>
                </th>
                <th>
                    <p><strong>Mandatory</strong></p>
                </th>
                <th>
                    <p><strong>Types of Evidence</strong></p>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application<strong> </strong>does not implement the ability to browse or persist data from
                        SDHR that it does not already hold locally (this capability requires separate compliance
                        testing)</p>
                    <p></p>
                    <p><strong>Please Note</strong>: HNZ expects to use monitoring-based controls to ensure that the
                        applications that are only accredited for sharing data to SDHR are not accessing data for
                        reasons other than record management.</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>The vendor confirms this requirement is met</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Attestation from vendor that they are not using the application to surface SDHR data to end users
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application does not modify records in SDHR that it does not already hold locally (for
                        example, only records created in the application, or imported as part of a patient transfer,
                        should be modified).</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>The vendor confirms this requirement is met</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Attestation from vendor that they are not using the application to change records that are not
                        mastered at that practice</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application adequately handles rate limits enforced by the SDHR API, and implements queuing,
                        exponential backoff, and retries if the limit is breached.</p>
                </td>
                <td>
                    <p>The application receives a HTTP 429 error code when calling the SDHR API</p>
                </td>
                <td>
                    <p>Subsequent requests to SDHR are delayed until the rate limit expires.</p>
                </td>
                <td>
                    <p>Recommended</p>
                </td>
                <td>
                    <p>Design and test output from vendor showing that they are adhering to the prescribed rate limits
                        and handling retries</p>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="3">
                    <p>The application adequately handles error codes and responses from the SDHR API</p>
                    <p></p>
                    <p><a
                            href="https://fhir-ig.digital.health.nz/sdhr/CapabilityStatement-SDHRCapabilityStatement.html#update-or-create-post-or-put-operation-statuses">See
                            here for the list of error codes for Update or Create (POST or PUT) Operation Statuses</a>
                    </p>
                    <p></p>
                </td>
                <td rowspan="3">
                    <p>The application receives a HTTP 4XX error code when calling the SDHR API</p>
                    <p></p>
                </td>
                <td>
                    <p>The error is logged and there is monitoring &amp; alerting in place for elevated or unusual error
                        rates.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Design and test output from vendor showing error handling</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>It is possible to distinguish errors that require investigation from errors that are expected due
                        to known factors.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor showing error handling</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>Information can be provided to HNZ on request to support diagnostics, including the
                        x-correlation-id header</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor showing error handling</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application ensures requests are delivered if a transient error message is received from the
                        SDHR API</p>
                    <p></p>
                    <p><a
                            href="https://fhir-ig.digital.health.nz/sdhr/CapabilityStatement-SDHRCapabilityStatement.html#update-or-create-post-or-put-operation-statuses">See
                            here for the list of error codes for Update or Create (POST or PUT) Operation Statuses</a>
                    </p>
                    <p></p>
                </td>
                <td rowspan="2">
                    <p>The application receives a HTTP 5XX response that indicates a transient error has occurred (for
                        example, the request was well formed but the server was unable to process it).</p>
                </td>
                <td>
                    <p>The request is retried if the response indicates the error is transient.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Design and test output from vendor showing error handling</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>Information can be provided to HNZ on request to support diagnostics, including the
                        x-correlation-id header</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor showing error handling</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application ensures that requests to create or update records are re-attempted as soon as
                        SDHR is available after facility load is complete.</p>
                </td>
                <td>
                    <p>The application receives a HTTP “sdhr-facility-locked" operation outcome error when calling the
                        SDHR API informing the application that the facility FHIR resources are in-use by SDHR</p>
                </td>
                <td>
                    <p>Subsequent attempts to create or update SDHR resources for the facility are queued and re-tried.
                    </p>
                    <p></p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application ensures that requests to create or update records for a patient are re-attempted
                        after<strong> </strong>SDHR has re-loaded history for that patient who has re-opted to share
                        history</p>
                </td>
                <td>
                    <p>The application receives a HTTP “sdhr-patient-locked" operation outcome error when calling the
                        SDHR API informing the application that the facility FHIR Resources are in-use by SDHR</p>
                </td>
                <td>
                    <p>Subsequent attempts to create or update SDHR resources for the patient are queued and re-tried
                    </p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Where an application loads patient history and real time data concurrently, the application
                        ensures that real time latest data is not overwritten by historical data</p>
                </td>
                <td>
                    <p>History for the patient is loaded for the first time or when patient re-opting is recorded in the
                        PMS AND at the same time the same records are being updated in SDHR in real time</p>
                </td>
                <td>
                    <p>Real time data is not superseded by earlier history records</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Where the application batches records for creation or updating in SDHR, the application ensures
                        that only the records that are rejected by SDHR are resent (and not the whole batch). This is to
                        avoid the creation of duplicates.</p>
                </td>
                <td>
                    <p>SDHR rejects some records in a batch</p>
                </td>
                <td>
                    <p>Only the rejected records are resent and received by SDHR</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application supports the user to correctly identify and associate the appropriate NHI for the
                        patient before information is sent to SDHR.</p>
                    <p></p>
                    <p>Please note: HNZ have process controls to ensure practices are correctly using NHIs to identify
                        patients.</p>
                </td>
                <td>
                    <p>The end user is entering or locating an NHI for a patient</p>
                </td>
                <td>
                    <p>Demonstrate user interface workflow / validation for NHI inputs.</p>
                    <p></p>
                    <p>All records have a valid NHI.</p>
                    <p></p>
                    <p>It is not possible to associate a non-existent or invalid NHI to a patient.</p>
                    <p></p>
                    <p>NHI numbers are not shared by more than one person.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Attestation and business process from vendor, e.g. system controls, screenshots, NHI lookup, etc
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application subscribes to the outcome of NHI linking operations and applies the results to
                        any applicable NHI held in the local patient record.</p>
                </td>
                <td>
                    <p>The existing NHI on a patient record is linked to another NHI by HNZ (e.g. HNZ identify the
                        person has two NHI numbers).</p>
                </td>
                <td>
                    <p>The application subscribes to the results of the linking operation and updates the patient to use
                        the Master NHI number.</p>
                </td>
                <td>
                    <p>Recommended</p>
                </td>
                <td>
                    <p>Attestation and business process from vendor, e.g. system controls, screenshots, NHI lookup, etc
                    </p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application correctly specifies the system-context request header with appropriate values</p>
                </td>
                <td rowspan="2">
                    <p>The application makes a request to the SDHR API</p>
                </td>
                <td>
                    <p>The request includes the system-context header.</p>
                    <p>The header properties are set according to the values specified in the FHIR IG, including the HPI
                        Facility ID of the physical location where the record was sourced from.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The request does not include the user-context header.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td rowspan="4">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="4">
                    <p>The application correctly manages <em>Condition</em> and <em>Observation</em> resources if they
                        are marked as <strong>confidential</strong>/sensitive.</p>
                </td>
                <td rowspan="2">
                    <p>A local record that maps to a <em>Condition</em> or <em>Observation</em> resource that has been
                        marked as confidential is created.</p>
                </td>
                <td>
                    <p>The application does not create the corresponding <em>Condition</em> or <em>Observation</em>
                        resource in SDHR.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application calls the $participate operation with the NHI, Facility ID, resource type, local
                        record ID, and reason code “sdhr-record-withheld”.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <p>A local record that maps to a <em>Condition</em> or <em>Observation</em> resource that has
                        previously been shared with SDHR is marked as confidential.</p>
                </td>
                <td>
                    <p>The application updates the record in SDHR to set the meta.security attribute to RESTRICTED.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application calls the $participate operation with the NHI, Facility ID, resource type, local
                        record ID, and reason code “sdhr-record-withheld”.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td rowspan="7">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="7">
                    <p>When accommodating<strong> Facility level participation</strong>, the application correctly
                        manages the patient non-participation preference for a given facility</p>
                    <p></p>
                </td>
                <td rowspan="3">
                    <p>A patient has chosen to not participate in SDHR data sharing at a given facility</p>
                </td>
                <td>
                    <p>The application has a setting to record this preference for that all enrolled patients at that
                        facility</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Attestation and business process from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>For applications using<strong> pull-based </strong>bulk upload, SDHR internally calls the
                        $participate operation with the NHI, Facility ID and sets the participationIndicator of false
                    </p>
                </td>
                <td rowspan="2">
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td rowspan="2">
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application immediately prevents any local records for that patient being sent to SDHR.</p>
                    <p></p>
                    <p>For <strong>push-based</strong> bulk uploads, and all other types of changes to local records,
                        the application calls the $participate operation with the NHI, Facility ID and a
                        participationIndicator of false</p>
                </td>
            </tr>
            <tr>
                <td rowspan="4">
                    <p>A patient who has previously opted out decides to opt back in to SDHR data sharing at a given
                        facility</p>
                </td>
                <td>
                    <p>The application calls the $participate operation with the NHI, Facility ID and a
                        participationIndicator of true.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                    <p></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>For applications using a <strong>pull-based</strong> uploads, SDHR initiates a load of the
                        individuals history.</p>
                    <p></p>
                    <p></p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                    <p></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>For applications using <strong>push-based</strong> uploads, the application triggers a historic
                        load of local records for the given patient at that facility.</p>
                    <p></p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application, at the earliest practical time*, resumes sending new and changed local records
                        to SDHR for that patient.<br><br>*Please note resumption should be in line with the outcomes of
                        SSD-7 and SSD-8.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                    <p></p>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="3">
                    <p>When accommodating<strong> Global participation (opt out),</strong> the application correctly
                        handles patient non-participation choices, for patients who choose to opt out of SDHR entirely
                        (via HNZ opt out channel)</p>
                </td>
                <td rowspan="3">
                    <p>A patient has chosen to not participate in SDHR data sharing at a national level</p>
                    <p></p>
                    <p>ZMW9001 or ZMW9009 can be used as the NHI in UAT for this scenario.</p>
                </td>
                <td>
                    <p>The application does not interpret the Global Deny OperationOutcome as applying to the facility
                        opt out preference (i.e. the facility opt out setting is not changed as a result)</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application does not cache or otherwise retain the result of a Global Deny OperationOutcome
                        and use it to prevent future Resources being sent to SDHR</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application does not attempt to retry sending a Resource to SDHR after receiving a Global
                        Deny OperationOutcome for that Resource</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>When accommodating<strong> Global participation (opt back in),</strong> the application has a
                        mechanism to receive a notification from HNZ when a patient chooses to opt back into SDHR, to
                        initiate a bulk load of that patient’s information from their enrolled practice</p>
                </td>
                <td>
                    <p>A patient who has previously chosen to opt-out via the HNZ opt out channel, chooses to opt back
                        in again via HNZ.</p>
                </td>
                <td>
                    <p>The application implements an API endpoint to trigger a bulk historic load for an enrolled
                        patient (preferred)</p>
                    <p></p>
                    <p>OR</p>
                    <p></p>
                    <p>The application provider has a manual process (e.g. via email or service desk) to trigger a bulk
                        historic load for an enrolled patient (not preferred)</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Test scenarios from HNZ tester run by vendor and output provided</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Onboarding facilities and historic bulk load</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application does not send any information to SDHR until formal authorisation is received via
                        a signed Information Sharing Agreement, and the facility has had adequate time to notify
                        patients.</p>
                </td>
                <td>
                    <p>A facility has not yet opted in to participate in SDHR data sharing.</p>
                    <p>A facility has not yet completed the notification process for enrolled patients.</p>
                </td>
                <td>
                    <p>No information from that facility will be shared with SDHR.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application supports sending a historic bulk load of information for only enrolled patients
                        who have not opted out as part of the initial onboarding process.</p>
                </td>
                <td>
                    <p>A facility has chosen to participate in SDHR data sharing.</p>
                    <p>An ISA and Acquisition Schedule has been signed that includes that facility</p>
                </td>
                <td>
                    <p>The application allows local records from that facility to be sent to SDHR.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application restricts the historic bulk load of information to only those patients that are
                        enrolled at that facility.</p>
                </td>
                <td>
                    <p>Notification to commence the historic load of information from that facility has been given</p>
                </td>
                <td>
                    <p>The application restricts the historic load to only patients who are enrolled at that facility.
                    </p>
                    <p>Unenrolled patient history is not loaded.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application does not apply time limits for which local records are included in the historic
                        bulk load.</p>
                </td>
                <td>
                    <p>The historic bulk load for a given facility has been triggered</p>
                </td>
                <td>
                    <p>The application shares all local records that map to the <em>AllergyIntolerance</em>,
                        <em>Condition,</em> and <em>Observation</em> resources in SDHR</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application excludes Condition and Observation resources marked as confidential from the
                        historic bulk load</p>
                </td>
                <td>
                    <p>The historic bulk load for a given facility has been triggered, and a local record that maps to a
                        Condition or Observation has been marked as confidential</p>
                </td>
                <td>
                    <p>The application does not create a Condition or Observation resource in SDHR for that local
                        record.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application ensures the correct HPI Facility ID is used in the meta.source attribute on each
                        resource</p>
                </td>
                <td>
                    <p>A record is created for a patient visiting a given physical practice/clinic with a HPI Facility
                        ID</p>
                </td>
                <td>
                    <p>The meta.source attribute in the SDHR resource is the Facility ID that represents the HPI
                        Facility identifier for the facility where the record is being sourced.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application creates or updates records in SDHR as close to real-time as practical</p>
                </td>
                <td>
                    <p>A new local record is created in the application</p>
                </td>
                <td>
                    <p>The new record is available in SDHR promptly, 95<sup>th</sup> percentile are received within 5
                        minutes</p>
                </td>
                <td>
                    <p>Recommended</p>
                    <p></p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>An existing local record is changed in the application</p>
                <td>
                    <p>The updated record is available in SDHR promptly, 95<sup>th</sup> percentile are received within
                        5 minutes, or sooner, as close to real time as possible.</p>
                </td>
                <td>
                    <p>Recommended</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="3">
                    <p>The application only sends records to SDHR if the patient has a valid and active NHI</p>
                </td>
                <td>
                    <p>A new local record is created in the application for a patient without an NHI associated</p>
                </td>
                <td>
                    <p>The application does not send the record to SDHR as the NHI is missing</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Attestation and business process from vendor, e.g. system controls, screenshots, NHI lookup, etc
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>A new local record is created in the application for a patient with an invalid NHI (e.g. invalid
                        check digit)</p>
                </td>
                <td>
                    <p>The application does not send the record to SDHR as the NHI is not in the valid format.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Attestation and business process from vendor, e.g. system controls, screenshots, NHI lookup, etc
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>A new local record is created in the application for a patient with a correctly formatted NHI
                        that does not exist in the NHI system (e.g. valid check digit but is unassigned)</p>
                </td>
                <td>
                    <p>The application does not send the record to SDHR as the NHI does not exist.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                    <p></p>
                </td>
                <td>
                    <p>Attestation and business process from vendor, e.g. system controls, screenshots, NHI lookup, etc
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application ensures that if a patient NHI changes, all records in SDHR for that patient at
                        that facility are updated to the new NHI</p>
                </td>
                <td>
                    <p>A patient has a given NHI</p>
                    <p>Records for that patient have been created in SDHR with that NHI.</p>
                    <p>The NHI on the patient record changes.</p>
                </td>
                <td>
                    <p>The application updates the NHI on every previously shared record for that patient at that
                        facility.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application ensures that if a practitioner HPI identifier changes, all records in SDHR for
                        that practitioner at that facility are updated to the new identifier</p>
                </td>
                <td>
                    <p>A practitioner has a given CPN</p>
                    <p>Resources that reference that practitioner CPN have been shared with SDHR</p>
                    <p>The CPN on the practitioner record changes.</p>
                </td>
                <td>
                    <p>The application updates the CPN on every previously shared record for that practitioner at that
                        facility.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <ol>
                        <li><a id="_Ref208256530"></a></li>
                    </ol>
                </td>
                <td rowspan="3">
                    <p>The application can create a new <em>Resource</em> in SDHR from a local record</p>
                </td>
                <td rowspan="3">
                    <p>A local record that maps to the <em>Resource</em> created in the application.</p>
                </td>
                <td>
                    <p>The application does a POST to create the <em>Resource</em> in SDHR.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test evidence from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The attributes from the local record map to the SDHR <em>Resource </em>definition</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and test evidence from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The attributes use the preferred bindings outlined in the FHIR IG</p>
                </td>
                <td>
                    <p>Recommended</p>
                </td>
                <td>
                    <p>Design and Test evidence from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="3">
                    <p>The application can update an existing SDHR <em>Resource</em> from a local record, including
                        merging any changes made to the SDHR record with the local record</p>
                </td>
                <td>
                    <p>A local record that has previously been created in SDHR is modified in the application.</p>
                    <p></p>
                </td>
                <td>
                    <p>The application does a GET for the <em>Resource</em> using the SDHR_ID of the record (preferred)
                    </p>
                    <p>OR</p>
                    <p>The application does a SEARCH for the <em>Resource</em> using the local identifier(s) for the
                        record to obtain the SDHR_ID</p>
                </td>
                <td rowspan="2">
                    <p>Recommended</p>
                </td>
                <td rowspan="2">
                    <p>Design and Test evidence from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <p><em>Optional</em></p>
                    <p>The SDHR copy of the record also has modifications that do not exist in the local record.</p>
                    <p></p>
                </td>
                <td>
                    <p>The application merges</p>
                    <p>any changed attributes of the SDHR <em>Resource</em> with the local record.</p>
                    <p>The local record is updated with these changes.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application PUTs a new version of the <em>Resource</em> based on the local record.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test evidence from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application retains the SDHR_ID provided by SDHR when a local record is created or updated.
                    </p>
                </td>
                <td rowspan="2">
                    <p>A new record is created in SDHR and a SDHR_ID is generated for that resource</p>
                </td>
                <td>
                    <p>The application retains the SDHR_ID provided in the SDHR API response and maintains it locally.
                    </p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test Output showing “SDHR Resource_ID” is recorded in the PMS</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>The application is able to supply the SDHR_ID for subsequent reads or writes to that record.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test Output showing “SDHR_Resource_ID” remains constant</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application takes all practical steps to avoid creating system-generated duplicate records
                    </p>
                </td>
                <td>
                    <p>A local record is created in the application from a source that is not user input</p>
                </td>
                <td>
                    <p>The application uses identifying attributes of the local record (e.g., the Facility ID, local
                        record IDs, patient NHI, and resource type) to SEARCH if the record already exists in SDHR.</p>
                    <p></p>
                    <p>If the record already exists in SDHR, the application retains the SDHR_ID (per SSD-25).</p>
                    <p></p>
                    <p>If no matches are found the application creates the record (per SSD-23)</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Attestation to ensure duplicates are not created as part of an edit/update</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application includes the SDHR_ID in exports of local records to another system (e.g. a
                        patient transfer to another practice)</p>
                </td>
                <td>
                    <p>Local records that have previously been shared with SDHR are being transferred to another system
                    </p>
                </td>
                <td>
                    <p>The SDHR_ID for each record is included in the exported file or data structure in a way that
                        allows the receiving system to determine which records have been sent to SDHR previously.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test output showing the SDHR ID is transferred as part of the GP2GP transfer</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application uses the SDHR_ID, if present, to identify existing records that are imported from
                        another system (e.g. a patient transfer from another practice).</p>
                </td>
                <td>
                    <p>Records are being imported from an export provided by an external system, and some of those
                        records include a SDHR_ID</p>
                </td>
                <td>
                    <p>The application imports the SDHR_ID and stores it alongside the local records per SSD-25.</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Desing and Test output showing the SDHR ID is accepted</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can create a new <em>Condition</em> resource in SDHR from a local record</p>
                </td>
                <td>
                    <p>A local record that maps to the Condition <em>Resource</em> is created in the application.</p>
                </td>
                <td>
                    <p>As Per SSD-27</p>
                </td>
                <td>
                    <p>Mandatory<br></p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can update an existing <em>Condition </em>resource and the resulting SDHR record
                        reflects the changes made in the PMS</p>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p>
                </td>
                <td>
                    <p>A local record that has previously been created in SDHR is modified in the application.</p>
                    <p></p>
                </td>
                <td>
                    <p>As Per SSD-28</p>
                </td>
                <td>
                    <p>Mandatory<br></p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application creates and updates active and inactive <em>Condition</em> resources in SDHR.</p>
                    <p></p>
                    <p>The bulk historic load should not include records that are already hard or soft deleted.</p>
                </td>
                <td>
                    <p>A local record that maps to the <em>Condition</em> resource with a status of active is created or
                        updated</p>
                </td>
                <td rowspan="2">
                    <p>The application creates a new <em>Condition</em> resource or updates the corresponding
                        <em>Condition</em> resource in SDHR.</p>
                </td>
                <td rowspan="2">
                    <p>Mandatory</p>
                </td>
                <td rowspan="2">
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>A local record that maps to the Condition resource with a status of inactive is created or
                        updated</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Observation Resources</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can create a new <em>Observation</em> resource in SDHR from a local record</p>
                </td>
                <td>
                    <p>A local record that maps to the Observation <em>Resource</em> is created in the application.</p>
                </td>
                <td>
                    <p>As Per SSD-27</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can update an existing <em>Observation </em>resource and the resulting SDHR
                        record reflects the changes made in the PMS</p>
                <td>
                    <p>A local record that has previously been created in SDHR is modified in the application.</p>
                    <p></p>
                </td>
                <td>
                    <p>As Per SSD-28</p>
                </td>
                <td>
                    <p>Mandatory</p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Allergies &amp; Intolerances Resources</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can create a new <em>AllergyIntolerance</em> resource in SDHR from a local record
                    </p>
                </td>
                <td>
                    <p>A local record that maps to the A&amp;I <em>Resource</em> is created in the application.</p>
                </td>
                <td>
                    <p>As Per SSD-27</p>
                </td>
                <td>
                    <p>Mandatory<br></p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>The application can update an existing <em>AllergyIntolerance </em>resource and the resulting
                        SDHR record reflects the changes made in the PMS</p>
                </td>
                <td>
                    <p>A local record that has previously been created in SDHR is modified in the application.</p>
                    <p></p>
                </td>
                <td>
                    <p>As Per SSD-28</p>
                </td>
                <td>
                    <p>Mandatory<br></p>
                </td>
                <td>
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td rowspan="2">
                    <p>The application creates and updates active and inactive <em>AllergyIntolerance</em> resources in
                        SDHR.</p>
                    <p></p>
                    <p>The bulk historic load should not include records that are already hard or soft deleted.</p>
                </td>
                <td>
                    <p>A local record that maps to the <em>AllergyIntolerance</em> resource with a status of active is
                        created or updated</p>
                </td>
                <td rowspan="2">
                    <p>The application creates a new <em>AllergyIntolerance</em> resource or updates the corresponding
                        <em>AllergyIntolerance</em> resource in SDHR.</p>
                </td>
                <td rowspan="2">
                    <p>Mandatory</p>
                </td>
                <td rowspan="2">
                    <p>Design and Test output from vendor</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>A local record that maps to the <em>AllergyIntolerance</em> resource with a status of inactive is
                        created or updated</p>
                </td>
            </tr>
        </tbody>
    </table>
</div>