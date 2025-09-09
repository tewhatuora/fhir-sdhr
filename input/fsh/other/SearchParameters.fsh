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
