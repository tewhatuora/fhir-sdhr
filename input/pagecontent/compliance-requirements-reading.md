### Important information about Compliance requirements

#### Use cases

These compliance requirements are for any user interface that can access and display Shared Digital Health Record information to a clinical user.

#### Data Access Verification

API Consumers accessing and displaying records to clinical users need to periodically retrieve their verification samples from the verification sample endpoint. The samples are represented as FHIR `AuditEvent` resources in accordance with the [SDHR AuditEvent profile](./StructureDefinition-SDHRAuditEvent.html).

Once retrieved, those samples need to be verified by the API Consumer using either an automated or manual process. Once access has been reviewed, the results must be submitted back to the Shared Digital Health Record to advise of the result.

##### Workflow

The following sequence diagram provides a basic overview of the verification workflow between the API Consumer and the Shared Digital Health Record server.

This workflow is not a one off onboarding activity. API Consumers need to perform this retrieval and verification process periodically on an ongoing basis so that sampled access events continue to be reviewed and verified over time.

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/verification-workflow-overview.plantuml` -->
{% include verification-workflow-overview.svg %}
</div>
<br clear="all">

1. Retrieve verification samples: The Data Viewer Application calls `GET /AuditEvent/$verification-samples` to retrieve a `Bundle` of sampled `AuditEvent` resources that require verification. See [SDHRVerificationSamplesOperation](./OperationDefinition-SDHRVerificationSamplesOperation.html).

    <details>
    <summary><b><u>Click to view verification samples Bundle example</u></b></summary>

    {% fragment Bundle/BundleVerificationSamplesResponseExample JSON %}

    </details>

2. Review sampled access events: The API Consumer reviews the returned sampled `AuditEvent` resources using either an automated process or a manual workflow to determine whether the recorded access was valid.

3. Submit verification decisions: The Data Viewer Application calls `POST /AuditEvent/$verification-submissions` with the defined `Parameters` payload to submit one or more verification decisions for the sampled `AuditEvent` resources. See [SDHRVerificationSubmissionsOperation](./OperationDefinition-SDHRVerificationSubmissionsOperation.html), the [SDHRVerificationSubmissionParameters profile](./StructureDefinition-SDHRVerificationSubmissionParameters.html), and the [SDHRVerificationSubmissionResponseParameters profile](./StructureDefinition-SDHRVerificationSubmissionResponseParameters.html).

    <details>
    <summary><b><u>Click to view verification submission request example</u></b></summary>

    {% fragment Parameters/ParametersVerificationSubmissionRequestExample JSON %}

    </details>

    <details>
    <summary><b><u>Click to view verification submission response example</u></b></summary>

    {% fragment Parameters/ParametersVerificationSubmissionResponseExample JSON %}

    </details>

4. Repeat periodically: This process needs to be repeated periodically so that newly sampled access events continue to be reviewed and verified over time.
