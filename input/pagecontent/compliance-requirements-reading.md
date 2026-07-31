> **Draft**: These compliance requirements are currently in draft and should be treated as draft content.

### Important information about compliance requirements

#### Scope and accreditation

These compliance requirements apply to **SEHR systems** that retrieve information from SDHR and display it to clinical users. An SEHR is an API consumer acting on behalf of an authenticated clinical user.

The requirements cover secure access, accurate request context, safe presentation of clinical information, auditability, and ongoing monitoring of access. They do not cover creating or updating source data in SDHR. Systems that share data with SDHR must separately meet the [compliance requirements for systems sharing data](./compliance-requirements.html). Systems that perform both roles are assessed against both sets of requirements.

Technical integration behaviour is documented in the [API documentation](./api.html) and the linked FHIR conformance resources. Meeting the requirements on this page does not replace conformance with those technical specifications.

#### Ongoing access verification

SEHR systems must periodically retrieve sampled access events, review whether those accesses were valid using an automated or manual process, and submit the verification decisions to SDHR. This is an ongoing monitoring responsibility rather than a one-off onboarding activity.

The [audit access records workflow](./access-information.html#audit-access-records-workflow) contains the end-to-end sequence and processing steps. The [access verification operations](./api.html#access-verification-operations) section of the API documentation contains endpoint behaviour, paging guidance, payload examples, and links to the relevant FHIR definitions.

#### Types of evidence

For each requirement, please provide appropriate evidence as per the guidance below.

<style>
.joplin-table-wrapper {
  overflow-x: auto;
}
.joplin-table-wrapper.evidence-table table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto;
}
.joplin-table-wrapper.evidence-table th,
.joplin-table-wrapper.evidence-table td {
  border: 1px solid #4a5568;
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
.joplin-table-wrapper.compliance-ref-table table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto;
}
.joplin-table-wrapper.compliance-ref-table th,
.joplin-table-wrapper.compliance-ref-table td {
  border: 1px solid #0e6655;
  padding: 8px;
  vertical-align: top;
  overflow-wrap: break-word;
  white-space: normal;
}
.joplin-table-wrapper.compliance-ref-table thead th {
  background-color: #008080;
  color: #ffffff;
}
.joplin-table-wrapper.compliance-ref-table th:first-child,
.joplin-table-wrapper.compliance-ref-table td:first-child {
  width: 5.5rem;
  min-width: 5.5rem;
  white-space: nowrap;
}
.joplin-table-wrapper.compliance-ref-table .requirement-ref {
  margin: 0;
  font-weight: 600;
  color: #0e6655;
}
.joplin-table-wrapper.compliance-ref-table .category-row td {
  background-color: #e6f4f1;
  color: #0e6655;
  font-weight: 600;
}
.joplin-table-wrapper.compliance-ref-table table td,
.joplin-table-wrapper.compliance-ref-table table th {
  box-sizing: border-box;
}
</style>

<div class="joplin-table-wrapper evidence-table">
    <table>
        <thead>
            <tr>
                <th>
                    <p><strong>Types of evidence</strong></p>
                </th>
                <th>
                    <p><strong>Guidance</strong></p>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <p><strong>Health NZ test scenario</strong></p>
                </td>
                <td>
                    <p>A test scenario and sample data will be provided by a Health NZ tester. The vendor runs the scenario
                        in the SDHR UAT environment and provides the resulting output.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p><strong>Design and test evidence from the vendor</strong></p>
                </td>
                <td>
                    <p>Please provide suitable evidence of vendor design and testing, showing that the application meets
                        the expected outcome, including:</p>
                    <ul>
                        <li>Test output</li>
                        <li>Screenshots or other evidence of input values within the application</li>
                        <li>Screenshots, log extracts, or other evidence of the expected outcomes within the application</li>
                        <li>If appropriate, a video recording of the scenario instead of screenshots</li>
                        <li>Test data created in the SDHR UAT environment to complete the scenario</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <p><strong>Attestation</strong></p>
                </td>
                <td>
                    <p>A statement explaining how the application meets the requirement. Please also supply available
                        evidence to support the statement, such as:</p>
                    <ul>
                        <li>A business process or standard operating procedure (SOP)</li>
                        <li>Screenshots or other evidence of the inputs and expected outcomes within the application</li>
                        <li>If appropriate, a video recording of the scenario instead of screenshots</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
</div>

### Support for these compliance requirements

The SDHR team will assess your responses and discuss with you if any further clarification is needed.

### Compliance requirements

<div class="joplin-table-wrapper compliance-ref-table">
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
                    <p><strong>Types of evidence</strong></p>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr class="category-row">
                <td colspan="6">
                    <p><strong>Security</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-1">SRD-1</p>
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
                    <p class="requirement-ref" id="SRD-2">SRD-2</p>
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
            <tr class="category-row">
                <td colspan="6">
                    <p><strong>Accurate requests</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-3">SRD-3</p>
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
                    <p class="requirement-ref" id="SRD-4">SRD-4</p>
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
                    <p class="requirement-ref" id="SRD-5">SRD-5</p>
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
                    <p class="requirement-ref" id="SRD-6">SRD-6</p>
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
                    <p class="requirement-ref" id="SRD-7">SRD-7</p>
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
                    <p class="requirement-ref" id="SRD-8">SRD-8</p>
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
            <tr class="category-row">
                <td colspan="6">
                    <p><strong>Data display</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-9">SRD-9</p>
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
                    <p>Yes</p>
                </td>
                <td>
                    <p>UI screenshots demonstrating record selection or launching process</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-10">SRD-10</p>
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
                    <p class="requirement-ref" id="SRD-11">SRD-11</p>
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
                    <p class="requirement-ref" id="SRD-12">SRD-12</p>
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
                    <p class="requirement-ref" id="SRD-13">SRD-13</p>
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
                    <p class="requirement-ref" id="SRD-14">SRD-14</p>
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
                    <p class="requirement-ref" id="SRD-15">SRD-15</p>
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
                    <p class="requirement-ref" id="SRD-16">SRD-16</p>
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
                    <p class="requirement-ref" id="SRD-17">SRD-17</p>
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
                    <p class="requirement-ref" id="SRD-18">SRD-18</p>
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
                    <p class="requirement-ref" id="SRD-19">SRD-19</p>
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
                    <p class="requirement-ref" id="SRD-20">SRD-20</p>
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
                    <p class="requirement-ref" id="SRD-21">SRD-21</p>
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
                    <p class="requirement-ref" id="SRD-22">SRD-22</p>
                </td>
                <td>
                    <p>Appropriate clinical oversight of user interface</p>
                </td>
                <td>
                    <p>N/A</p>
                </td>
                <td>
                    <p>The user experience for clinicians accessing SDHR data must be designed with appropriate clinical oversight in place to avoid risk of misinterpretation or harm.</p>
                </td>
                <td>
                    <p></p>
                </td>
                <td>
                    <p>Governance structure, clinical sign off</p>
                </td>
            </tr>
            <tr class="category-row">
                <td colspan="6">
                    <p><strong>Audit</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-23">SRD-23</p>
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
            <tr class="category-row">
                <td colspan="6">
                    <p><strong>Monitoring</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="requirement-ref" id="SRD-24">SRD-24</p>
                </td>
                <td>
                    <p>Enable Health NZ audit and investigation</p>
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
                    <p class="requirement-ref" id="SRD-25">SRD-25</p>
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
                    <p class="requirement-ref" id="SRD-26">SRD-26</p>
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
                    <p class="requirement-ref" id="SRD-27">SRD-27</p>
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
                    <p class="requirement-ref" id="SRD-28">SRD-28</p>
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
