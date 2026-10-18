# MedicationDispense extension contexts

The published 1.1.4 `SDHRMedicationDispense` profile requires both
`nzeps-medication-modified` and `nzeps-instructions-modified`, but the two extension
definitions allow only `MedicationRequest` as their context. As a result, no
MedicationDispense can satisfy the published profile: omitting the extensions
violates required slices, and including them violates their context constraints.

The definitions in `input/resources/StructureDefinition-nzeps-medication-modified.json`
and `input/resources/StructureDefinition-nzeps-instructions-modified.json` now allow
both `MedicationRequest` and `MedicationDispense`. No cardinalities change.

The SDHR runtime repository carries this correction as a documented local patch to
its pinned 1.1.4 bundle. Republish the IG with this source correction, then update
the runtime's bundle and remove its local patch record once the published artifact
includes the same contexts. The source correction has not been published by this
change.
