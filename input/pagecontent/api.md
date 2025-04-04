# API Documentation

The SDHR API is comprised of multiple FHIR resources.

## Logical View

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/api-logical-overview.plantuml` -->
{% include api-logical-overview.svg %}
</div>
<br clear="all">

## SDHR Resource updates

This section describes the process of SDHR API Consumer system interacting with the SDHR FHIR server to update existing resources.

### GET before PUT

To maintain data integrity, API Consumers authorized to make updates to resources must use a "GET before PUT" approach. By always fetching the current state of a resource before attempting an update, you ensure that the modifications reflect the most accurate and recent information, without overwriting updates which may have been made by other API Consumers.

<div width="100%">
<!-- Generated from `input/images-source/get-before-put.plantuml` -->
{% include get-before-put.svg %}
</div>
<br clear="all">

### Searching for resources before update

The SDHR API reflects the FHIR Search parameters which are documented in the [Server Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html) and well as a direct HTTP GET for a resource.

#### Case 1: The SDHR Server assigned resource ID is known by the API Consumer:

In this scenario, an HTTP GET for the resource can be made to retrieve the resource: `GET /Condition/{serverResourceId}`.

Once the update has been made, the resource can be updated in the SDHR Server by using an HTTP PUT to the resource: `PUT /Condition/{serverResourceId}`

#### Case 2: The SDHR Server assigned resource ID is unknown by the API Consumer:

In this scenario, a FHIR Search must be used with search parameters available to the API Consumer, as the server resource ID cannot be used for a direct HTTP GET.

<b>Option 1: FHIR Search by local PMS identifier, stored as a FHIR Identifier</b>

To improve accuracy in this process, API Consumers who submit or update records may append an identifier known to them to the shared record. This may be a representation or a copy of a local identifier used within the local PMS system. When a local identifier is stored, a FHIR Search using an identifier search parameter can be used to retrieve a record.

<div width="100%">
<!-- Generated from `input/images-source/search-by-identifier.plantuml` -->
{% include search-by-identifier.svg %}
</div>
<br clear="all">

<b>Option 2: FHIR Search using resource search parameters</b>

When a local identifier is not submitted to a resource, the search parameters for each resource must be used, which are documented in the [Server Capability Statement](./CapabilityStatement-SDHRCapabliityStatement.html). This will return a FHIR Bundle which may contain multiple records which must be handled by the API Consumer.

<div width="100%">
<!-- Generated from `input/images-source/search-by-parameters.plantuml` -->
{% include search-by-parameters.svg %}
</div>
<br clear="all">
