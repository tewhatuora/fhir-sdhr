### Import the collection
{: .underlined}

Download the <a href="postman/UAT-SDHR.postman_collection.json" download="UAT-SDHR.postman_collection.json">UAT SDHR Postman collection</a> and <a href="postman/UAT-SDHR-example.postman_environment.json" download="UAT-SDHR-example.postman_environment.json">example environment</a>, then import both files into Postman. Select **UAT SDHR Example** as the active environment and make a local copy for your own settings.

The collection contains 73 requests based on the SDHR Bruno collection: resource reads and searches, contribution examples, participation operations, audit event verification, and ordered workflows. Version reads (`vread`, with `/_history/{version}` in the URL) are excluded from this collection for now.

The environment contains dummy identifiers and blank credentials. Its UAT API and authentication URLs are populated; replace the dummy values with test identities and client details supplied during onboarding. Dummy identifiers are illustrative and do not establish that a patient, practitioner, or facility exists or is available to your client.

### Configure the environment
{: .underlined}

| Variable | What to set |
| --- | --- |
| `BASE_URL` | SDHR API base URL. The example uses `https://api.uat.sdhr.digital.health.nz/s2s`. Omit a trailing slash. |
| `AUTH_URL` | Token endpoint for your client. The UAT example uses `https://api.ppd.auth.digital.health.nz/realms/hnz-integration/protocol/openid-connect/token`. Confirm this against your onboarding details. |
| `CLIENT_ID`, `CLIENT_SECRET` | Your OAuth client credentials. Keep the secret in your local environment and exclude it from shared exports. |
| `SCOPE` | Space-separated scopes to request for normal API calls. Remove scopes your client has not been granted; see below. |
| `READ_SCOPE` | Read-only scopes used by the under-scoped negative test. Remove any resource scopes your client does not have, and keep participation operation scopes out of this value. |
| `REQUEST_CONTEXT` | Base64-encoded Request-Context JSON for the test user, organisation, facility, and purpose of use. Obtain the appropriate context during onboarding and use the [Request-Context schema](https://github.com/tewhatuora/schemas/blob/main/Request-Context.json). This value is sent as supplied; the collection does not build or encode it. |
| `TEST_NHI`, `TEST_PATIENT_NAME` | A synthetic test patient's NHI and display name. Use a patient appropriate to the scenario. |
| `TEST_FACILITY` | An onboarded test HPI facility identifier. This is used in contribution and facility participation requests. |
| `TEST_PRACTITIONER`, `TEST_PRACTITIONER_NAME` | Test practitioner HPI identifier and display name for examples that use a practitioner. |
| `TEST_RECORDER`, `TEST_RECORDER_NAME` | Test recorder HPI identifier and display name for contributed resources. |
| `TEST_RECORD_SYSTEM` | Identifier system URI used by your test source for contributed records. Replace the `example.invalid` URI with your test source's identifier system. |
| `NHI_REFERENCE_BASE`, `HPI_REFERENCE_BASE` | Reference bases used when building Patient, Practitioner, and Location references. Defaults match the references used by this guide; change only if your test setup requires it. |
| `CONDITION_ID`, `OBSERVATION_ID`, `ALLERGY_INTOLERANCE_ID`, `IMMUNIZATION_ID`, `MEDICATION_REQUEST_ID`, `MEDICATION_DISPENSE_ID` | Logical resource IDs returned by an earlier create or search, for individual read/update requests. Set only those needed for the requests you intend to use. |
| `CONDITION_IDENTIFIER` | Source identifier value for the Condition search-by-identifier example. This differs from the resource's logical ID. |
| `AUDIT_EVENT_ID` | Local SDHR ID of a pending audit sample you have reviewed. Set this before submitting a verification result. |
| `DEPLOYMENT` | Environment label, initially `uat`; changing the label alone does not change either URL. |
{: .grid}

`ACCESS_TOKEN`, `ACCESS_TOKEN_EXPIRES_AT`, and `ACCESS_TOKEN_CONTEXT` start blank and are managed by scripts. Leave them blank when importing or sharing an environment. The expiry value is an epoch timestamp in milliseconds. Clear these three values after replacing credentials, or when you want to force a fresh token.

The [test data page](./test-data.html) describes UAT patients and facilities with particular consent and onboarding states. Keep the identities in `REQUEST_CONTEXT` consistent with your test setup and the requests you send. API scopes do not bypass consent, facility, or request-context checks.

### Choose scopes for your client
{: .underlined}

`SCOPE` is a space-separated list. It contains a broad set of examples so that one suitably authorised client can run the collection. Your client may have only a subset. **Remove any scope your client has not been granted before authenticating.** For example, a read-only client should remove contribution and administrative operation scopes and use only its granted read/search scopes.

For resource scopes, `system/Condition.rs` permits system-level read (`r`) and search (`s`) access to Condition. The letters in `.crus` mean create (`c`), read (`r`), update (`u`), and search (`s`). A resource scope applies to that resource type; it does not grant access to every SDHR resource or custom operation.

| Scope in the example | Purpose |
| --- | --- |
| `system/Condition.crus` | Contribute, update, read, and search Conditions. Use `system/Condition.rs` if your client only has read/search access. |
| `system/Observation.crus` | Contribute, update, read, and search Observations. Use `.rs` for read/search-only access. |
| `system/AllergyIntolerance.crus` | Contribute, update, read, and search allergies/intolerances. Use `.rs` for read/search-only access. |
| `system/Immunization.rs` | Read and search immunisations. |
| `system/MedicationRequest.rs` | Read and search medication requests. |
| `system/MedicationDispense.rs` | Read and search medication dispenses. |
{: .grid}

Custom operation scopes use the full OperationDefinition URL, starting with `https://fhir-ig.digital.health.nz/sdhr/OperationDefinition/`. These are separate permissions:

| OperationDefinition suffix | Request it authorises |
| --- | --- |
| `SDHRParticipationStatusOperation` | `POST /$participation-status`: check participation status. |
| `SDHRParticipateOperation` | `POST /$participate`: record facility participation. |
| `SDHRHNZParticipateOperation` | `POST /$hnz-participate`: record global participation through authorised Health NZ channels. |
| `SDHRHNZParticipationStatusOperation` | `POST /$hnz-participation-status`: retrieve Health NZ participation status. |
| `SDHRVerificationSamplesOperation` | `GET /AuditEvent/$verification-samples`: retrieve pending access verification samples for the authenticated client. |
| `SDHRVerificationSubmissionsOperation` | `POST /AuditEvent/$verification-submissions`: submit verification results for reviewed samples. |
{: .grid}

Use the full URL in `SCOPE`, not just the suffix shown in the table. Requesting a scope does not grant it. The token service may reject an ungranted scope, or return a token with fewer permissions. The collection detects a reduced granted scope when the token response supplies a `scope` field and stops the request. If that field is omitted, the API still enforces the token's permissions.

The **Under-scoped token cannot read participation status** probe deliberately requests `READ_SCOPE` rather than `SCOPE` and expects HTTP 403 from the participation operation. This is a negative test; do not add the missing operation permission to make that probe succeed.

### Send a first request
{: .underlined}

1. Select your configured environment and check its URLs, credentials, `SCOPE`, and `REQUEST_CONTEXT`.
2. Send **Auth / Authenticate - master** to check authentication explicitly. A successful response stores the master token and its expiry in the selected environment.
3. Send **Api / Read / Get CapabilityStatement**, then a resource search such as **Search Conditions by patient** using your synthetic `TEST_NHI`.
4. Inspect the response and the Postman test results. For individual reads or updates, copy the relevant resource ID from a successful response into the matching environment variable.

You can also send a normal API request directly: the collection obtains a token automatically when needed. Keep request authentication set to **No Auth** as supplied; scripts add the bearer header. Adding a separate OAuth or bearer-token configuration can conflict with those scripts and with the intentional negative tests.

### Scripts included in the collection
{: .underlined}

The collection uses Postman's pre-request and post-response scripts. [Postman's scripting documentation](https://learning.postman.com/docs/tests-and-scripts/write-scripts/pre-request-scripts/) explains where these scripts run.

| Script location | Behaviour |
| --- | --- |
| Collection pre-request | Obtains a client-credentials token using `CLIENT_ID`, `CLIENT_SECRET`, and `SCOPE`; adds the bearer token, `Accept`, and `Request-Context` headers to API requests. It reuses the token until it expires or has fewer than 30 seconds left. Changing the authentication URL, API base URL, client ID, or scope invalidates the cached token context. |
| Explicit authentication post-response | Validates the token response and saves `ACCESS_TOKEN`, `ACCESS_TOKEN_EXPIRES_AT`, and `ACCESS_TOKEN_CONTEXT` in the selected environment. |
| Request pre-request | Checks required inputs and generates timestamps and unique identifiers for contribution examples. Workflow requests also check that earlier steps have supplied the required state. |
| Request post-response | Checks expected HTTP statuses and FHIR response content. Some workflow requests save created resource IDs, source identifiers, baseline totals, or participation summaries for later steps. |
| Participation polling post-response | Some global participation checks make up to five additional status requests, three seconds apart, while waiting for the expected indicator. They log a final summary; this is not proof of archive-store persistence. |
| Negative authentication probes | One request deliberately sends no bearer token. Another obtains a separate token using `READ_SCOPE`, without replacing the master token. Each asserts its expected rejection. |
{: .grid}

Generated workflow values use names beginning with `RUN_`. They are saved in the active environment so later requests can use them when sent individually. Run a workflow from its first step when starting a new scenario; do not reuse an incomplete run's state with a different patient or facility. Inspect scripts and logs in Postman when a prerequisite check fails.

### Run workflows deliberately
{: .underlined}

The collection includes writes and changes to participation. Start with individual reads and searches. Run only the workflow folder you intend to exercise, in its displayed order, using disposable synthetic test data. Request labels such as `manual`, `mutation`, and `destructive` are descriptions; they do not stop Postman from running a request.

- **Record Lifecycle** creates and updates clinical records and submits a batch Bundle. Configure contribution permissions and facility participation first.
- **Global Participation** and **Facility Participation** include opt-out steps that archive active contributed records. Opting back in does not restore those archived records. Facility workflow setup also depends on the global workflow's run identifiers; read the folder instructions before running it.
- **Negative Probes** intentionally send invalid or unauthorised requests. Passing tests can therefore accompany HTTP 4xx responses.
- **Record Visibility** changes whether contributed records are withheld from disclosure.
- **Audit event sampling** retrieves pending samples and submits your verification decision. Review a sample before setting `AUDIT_EVENT_ID` and submitting a result.

### Troubleshooting
{: .underlined}

| Symptom | Check |
| --- | --- |
| Authentication fails or a reduced-scope error appears | Confirm the token URL and credentials, then remove ungranted scopes from `SCOPE` or `READ_SCOPE`. Clear the cached token fields after replacing credentials. |
| HTTP 401 or 403 from an API request | Inspect the OperationOutcome. Check token permissions, Request-Context, patient participation, and facility onboarding. Expected negative probes assert these failures deliberately. |
| A required variable or earlier-step error appears | Populate the named variable in the active environment, or run the prerequisite workflow step. |
| A read returns HTTP 404 | Check the logical resource ID and resource type, and whether the record is active and available to the caller. Version reads are not supported. |
| A workflow assertion fails | Stop and inspect the response, selected patient, facility, and earlier steps before continuing. |
{: .grid}
