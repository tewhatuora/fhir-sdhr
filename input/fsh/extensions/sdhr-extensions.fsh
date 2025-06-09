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