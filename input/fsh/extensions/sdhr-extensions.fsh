Extension: ClientLastUpdatedExtension
Id: hnz-sdhr-client-last-updated-extension
Title: "Client Last Updated"
Context: Condition, Observation, AllergyIntolerance, Encounter
Description: "Extension to record the last time a resource was updated by the source system. When consuming applications are writing data to the SDHR API they can use this extension to record the `LastUpdated` timestamp in their system"
* value[x] only dateTime

Extension: HNZSDHRHighlightedExtension
Id: hnz-sdhr-highlighted-extension
Title: "HNZ SDHR Highlighted"
Context: Condition
Description: "Extension to indicate that a resource should be highlighted in the user interface. This is used to indicate that the resource is important and should be highlighted in a user interface."
* value[x] only boolean

Extension: FacilityParticipationExtension
Id: facility-participation-extension
Title: "Facility Participation"
Description: "Indicates whether the patient has opted out or opted in to participation at the facility. If opted out, no records will be shared from that facility."
* valueCodeableConcept 1..1
* valueCodeableConcept from SDHRParticipationReasonValueSet (required)
* valueCodeableConcept ^short = "Use sdhr-facility-opt-out if the patient has opted out, sdhr-facility-opt-in if the patient has opted in"