> **Draft**: These compliance requirements are currently in draft and should be treated as draft content.

### Important information about Compliance requirements

#### Use cases

These compliance requirements are for any user interface that can access and display Shared Digital Health Record information to a clinical user.

#### Data Access Verification

API Consumers accessing and displaying records to clinical users need to periodically retrieve their verification samples from the verification sample endpoint. The samples are represented as FHIR `AuditEvent` resources in accordance with the [SDHR AuditEvent profile](./StructureDefinition-SDHRAuditEvent.html).

Once retrieved, those samples need to be verified by the API Consumer using either an automated or manual process. Once access has been reviewed, the results must be submitted back to the Shared Digital Health Record to advise of the result.

##### Workflow

The following sequence diagram provides a basic overview of the verification workflow between the API Consumer and the Shared Digital Health Record server.

These verification operations and examples are currently draft and should be treated as draft interface content.

This workflow is not a one off onboarding activity. API Consumers need to perform this retrieval and verification process periodically on an ongoing basis so that sampled access events continue to be reviewed and verified over time.

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/verification-workflow-overview.plantuml` -->
{% include verification-workflow-overview.svg %}
</div>
<br clear="all">

1. Retrieve verification samples: The Data Viewer Application calls the draft `GET /AuditEvent/$verification-samples` operation to retrieve a `Bundle` of sampled `AuditEvent` resources that require verification. The operation also supports `_count` and `_offset` query parameters for paging, for example `GET /AuditEvent/$verification-samples?_count=1&_offset=0`. See [SDHRVerificationSamplesOperation](./OperationDefinition-SDHRVerificationSamplesOperation.html).

    <details>
    <summary><b><u>Click to view verification samples Bundle example</u></b></summary>

    {% fragment Bundle/BundleVerificationSamplesResponseExample JSON %}

    </details>

2. Review sampled access events: The API Consumer reviews the returned sampled `AuditEvent` resources using either an automated process or a manual workflow to determine whether the recorded access was valid.

3. Submit verification decisions: The Data Viewer Application calls the draft `POST /AuditEvent/$verification-submissions` operation with the defined `Parameters` payload to submit one or more verification decisions for the sampled `AuditEvent` resources. See [SDHRVerificationSubmissionsOperation](./OperationDefinition-SDHRVerificationSubmissionsOperation.html), the [SDHRVerificationSubmissionParameters profile](./StructureDefinition-SDHRVerificationSubmissionParameters.html), and the [SDHRVerificationSubmissionResponseParameters profile](./StructureDefinition-SDHRVerificationSubmissionResponseParameters.html).

    <details>
    <summary><b><u>Click to view verification submission request example</u></b></summary>

    {% fragment Parameters/ParametersVerificationSubmissionRequestExample JSON %}

    </details>

    <details>
    <summary><b><u>Click to view verification submission response example</u></b></summary>

    {% fragment Parameters/ParametersVerificationSubmissionResponseExample JSON %}

    </details>

4. Repeat periodically: This process needs to be repeated periodically so that newly sampled access events continue to be reviewed and verified over time.

### Compliance requirements

<style>
.joplin-table-wrapper.ssd-ref-table {
  overflow-x: auto;
}
.joplin-table-wrapper.ssd-ref-table table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto;
  counter-reset: ssd-counter;
}
.joplin-table-wrapper.ssd-ref-table th,
.joplin-table-wrapper.ssd-ref-table td {
  border: 1px solid #0e6655;
  padding: 8px;
  vertical-align: top;
  overflow-wrap: break-word;
  white-space: normal;
}
.joplin-table-wrapper.ssd-ref-table thead th {
  background-color: #008080;
  color: #ffffff;
}
.joplin-table-wrapper.ssd-ref-table td:first-child ol {
  list-style: none;
  margin: 0;
  padding: 0;
}
.joplin-table-wrapper.ssd-ref-table tbody tr:has(td:first-child ol) {
  counter-increment: ssd-counter;
}
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
.joplin-table-wrapper.ssd-ref-table table td,
.joplin-table-wrapper.ssd-ref-table table th {
  box-sizing: border-box;
}
</style>

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
                <td colspan="6">
                    <p><strong>Security</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Securely storage of authentication credentials used for SDHR</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Authentication Credentials for the SDHR API are stored securely, not available to users without appropriate controls in place.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Documentation of authentication credential storage solution and/or controls in place to prevent inappropriate access to the credential store</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>User logins to the SEHR system are performed securely</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Users of the SEHR system have secure user accounts that only they can access allowing for confidence that the user making a request to SDHR is who they say they are</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Documentation of user account controls, SSO, MFA etc.</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Accurate Requests</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>HPI-Facility and Org are accurately reported to SDHR</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Clinical users must only be able to select an HPI‑Facility or HPI‑Organisation with which they have a legitimate relationship. Where a user’s HPI‑Facility/Org is assigned directly to their account, appropriate controls must ensure its accuracy. The HPI‑Facility/Org submitted to SDHR in API requests must accurately represent the user on whose behalf the request is made.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Documentation of user onboarding and facility/org assignment processes, evidence of mapping from user account to request, test cases</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>HPI-CPN is accurately reported to SDHR</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Clinical users must have the correct HPI-CPN assigned to their user account so this can be submitted to SDHR. Users cannot "self-select" their HPI-CPN.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Documentation of user onboarding and CPN assignment process</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Capture purpose of use for every access</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>SDHR is informed of the correct clinical purpose for every request. This could be based on user selection or programatically set.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Purpose of Use selection or recording process details</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Enforce appropriate access restrictions to SDHR data</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Non-clinical users cannot see any SDHR data, clinical users can only see data appropriate for their role.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Role definitions, permission matrices</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>No local retention of SDHR clinical data</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>SDHR clinical content is not stored, cached, or logged within the SEHR system. Please Note: Clinicians can make reference to SDHR data while writing notes or documents.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Architecture diagrams, technical attestations</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Only make requests based on user action</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Requests for SDHR data should only be made for the purpose of displaying data to the clinical user. Non-user initiated requests should NOT be made.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Documentation of requests that are made, correlation of our audit events being linked to a user action in the SEHR?</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Data Display</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Ensure correct record is being viewed</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Clinical users have safe methods for ensuring the correct patient record is being viewed. This could include integration directly into the existing wider patient record within the same UI or via a launch with the patient context included, display of patient demographics from a local or nationwide source to allow patient identification. An unattached SEHR record without demographics displayed that was found based on a typed NHI is insufficient.</p>
                </td>
                <td>
                    <p></p>
                </td>
                <td>
                    <p>UI screenshots demonstrating record selection or launching process</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users are made aware of SDHR data completeness limits</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Clinical users are made aware that SDHR data may not present the full patient record.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots, terms of use, training material extracts</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Provide clear feedback when no data is found</p>
                </td>
                <td>
                    <p>Empty search results from SDHR</p>
                </td>
                <td>
                    <p>Informative message displayed when no records are returned.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed of withheld records</p>
                </td>
                <td>
                    <p>Information withheld outcome from SDHR</p>
                </td>
                <td>
                    <p>Users are informed when records are withheld (“information withheld” indicator shown).</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots demonstrating withheld indicators</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed of domain opt out</p>
                </td>
                <td>
                    <p>Domain level opt out outcome from SDHR</p>
                </td>
                <td>
                    <p>Users are informed when the patient has opted out of a health domain.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed of global opt out</p>
                </td>
                <td>
                    <p>Global level opt out outcome from SDHR</p>
                </td>
                <td>
                    <p>Users are informed when the patient has globally opted out of SDHR.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Handle SDHR API rate limiting gracefully</p>
                </td>
                <td>
                    <p>HTTP 429 response from SDHR</p>
                </td>
                <td>
                    <p>User receives meaningful message; system does not repeatedly retry during rate limit window.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots, test evidence showing correct handling of 429 errors</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed of deceased patients</p>
                </td>
                <td>
                    <p>Deceased patient indicator from SDHR</p>
                </td>
                <td>
                    <p>Users are alerted that a patient is deceased.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Support linked NHI viewing</p>
                </td>
                <td>
                    <p>SDHR response including multiple NHIs</p>
                </td>
                <td>
                    <p>Viewer can display records across all NHIs linked to a consumer.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots demonstrating display of linked NHI test patient</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed when there are more records</p>
                </td>
                <td>
                    <p>Large number of records returned from SDHR</p>
                </td>
                <td>
                    <p>Users are informed when there are more records than currently displayed. This could take the form of page counts, infinite scroll or other UI indicators.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Prevent data truncation</p>
                </td>
                <td>
                    <p>SDHR response including long text strings</p>
                </td>
                <td>
                    <p>SDHR data fields are displayed without truncation or loss of meaning.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots demonstrating full field rendering</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Users informed of appropriate statuses of records</p>
                </td>
                <td>
                    <p>SDHR response includes records with different statuses</p>
                </td>
                <td>
                    <p>Users are made aware of the status of records where appropriate to ensure they can differentiate between current and past conditions, allergies etc. This could take the form of status badges or some other indicator.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Avoid relying on unverified patient names</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Patient names from SDHR are either not displayed or clearly marked as non-authortative.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Appropriate clinical oversight of user interface</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p></p>
                </td>
                <td>
                    <p></p>
                </td>
                <td>
                    <p>Governance structure, clinical sign off</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Audit</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Maintain complete audit logs</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>Audit logs capture full traceability for every SDHR interaction in compliance with HIGG. This would include at a minimum: -SEHR User ID -HPI CPN or other identifier -Full name -IP address -Facility and Organisation user belongs to -PoU for access -The API call that was made -Timestamp of access</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Audit log extracts</p>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <p><strong>Monitoring</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Enable HNZ audit and investigation</p>
                </td>
                <td>
                    <p>Filtered audit datasets</p>
                </td>
                <td>
                    <p>SEHR can supply filtered audit logs on request (by NHI, user, org, time).</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Sample filtered audit extracts</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Retrieve access samples from SDHR</p>
                </td>
                <td>
                    <p>SDHR accesses have been performed</p>
                </td>
                <td>
                    <p>SEHR is capable of retrieving sampled SDHR data accesses via the sampling API.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Time of API calls so SDHR can verify call was received</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Submit proactive monitoring outcomes to SDHR</p>
                </td>
                <td>
                    <p>Access samples have been retrieved</p>
                </td>
                <td>
                    <p>The SEHR can determine the appropriateness of accesses to SDHR data by a clinician. SEHR can submit monitoring outcomes to SDHR via the Sampling API.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Time of API calls so SDHR can verify call was received. Business process/rules for determining appropriateness of SDHR data access</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Perform proactive monitoring of access</p>
                </td>
                <td>
                    <p>Monthly monitoring outputs</p>
                </td>
                <td>
                    <p>Regular monitoring detects inappropriate or anomalous access in compliance with HIGG.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>Monitoring reports; attestation</p>
                </td>
            </tr>
            <tr>
                <td>
                    <ol>
                        <li></li>
                    </ol>
                </td>
                <td>
                    <p>Support privacy investigations and corrective action</p>
                </td>
                <td>
                    <p>Incident records</p>
                </td>
                <td>
                    <p>Privacy breaches are investigated, recorded, and corrective action taken.</p>
                </td>
                <td>
                    <p>Yes</p>
                </td>
                <td>
                    <p>SOPs, incident register extracts - this is the content though</p>
                </td>
            </tr>
        </tbody>
    </table>
</div>
