Instance: condition-highlighted
InstanceOf: SearchParameter
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/SearchParameter/condition-highlighted"
* version = "1.0.0"
* name = "ConditionHighlighted"
* status = #active
* description = "Search for conditions flagged as highlighted in the SDHRCondition profile"
* code = #highlighted
* base = #Condition
* type = #token
* expression = "Condition.extension('https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-highlighted-extension')"
* xpathUsage = #normal

Instance: condition-long-term-condition
InstanceOf: SearchParameter
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/SearchParameter/condition-long-term-condition"
* version = "1.0.0"
* name = "ConditionLongTermCondition"
* status = #active
* description = "Search for conditions marked as long term in the SDHRCondition profile"
* code = #long-term-condition
* base = #Condition
* type = #token
* expression = "Condition.extension('http://hl7.org.nz/fhir/StructureDefinition/long-term-condition')"
* xpathUsage = #normal

Instance: allergyintolerance-clientlastupdated
InstanceOf: SearchParameter
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/SearchParameter/allergyintolerance-clientlastupdated"
* version = "1.0.0"
* name = "AllergyIntoleranceClientLastUpdated"
* status = #active
* description = "Search by the ClientLastUpdated extension on SDHR AllergyIntolerance resources"
* code = #clientlastupdated
* base = #AllergyIntolerance
* type = #date
* expression = "AllergyIntolerance.extension('https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension').value"
* xpathUsage = #normal

Instance: condition-clientlastupdated
InstanceOf: SearchParameter
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/SearchParameter/condition-clientlastupdated"
* version = "1.0.0"
* name = "ConditionClientLastUpdated"
* status = #active
* description = "Search by the ClientLastUpdated extension on SDHR Condition resources"
* code = #clientlastupdated
* base = #Condition
* type = #date
* expression = "Condition.extension('https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension').value"
* xpathUsage = #normal

Instance: observation-clientlastupdated
InstanceOf: SearchParameter
Usage: #definition
* url = "https://fhir-ig.digital.health.nz/sdhr/SearchParameter/observation-clientlastupdated"
* version = "1.0.0"
* name = "ObservationClientLastUpdated"
* status = #active
* description = "Search by the ClientLastUpdated extension on SDHR Observation resources"
* code = #clientlastupdated
* base = #Observation
* type = #date
* expression = "Observation.extension('https://fhir-ig.digital.health.nz/sdhr/StructureDefinition/hnz-sdhr-client-last-updated-extension').value"
* xpathUsage = #normal
