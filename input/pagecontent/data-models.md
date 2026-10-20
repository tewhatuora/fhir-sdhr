### FHIR data models

This section provides an overview of the design of the FHIR data representations that authorised applications can use to record and interchange shared digital health record information.

MedicationRequest and MedicationDispense use MDR resource IDs rather than the UUIDs assigned to the Primary Care Collection. See [medication resource IDs](./data-overview.html#medication-resource-ids) for their composition and the distinction between a resource `id` and prescription-item `identifier`.

#### Overview

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/fhir-sdhr-resource-model.plantuml` -->
{% include fhir-sdhr-resource-model.svg %}
</div>
<br clear="all">
