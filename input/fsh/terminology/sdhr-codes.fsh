CodeSystem: SDHRCodeSystem
Id: nz-sdhr-codesystem
Title: "NZ-specific terminology for Shared Digital Health Records"
Description:  "This system defines standard codes used throughout this Implementation Guide for New Zealand Shared Digital Health Records"
* ^publisher = "Te Whatu Ora / Health New Zealand"
* ^experimental = false
* ^caseSensitive = true
* ^version = "1.0.0"
* ^purpose = """
The codes defined in this CodeSystem are used throughout the SDHR IG, including in resource profiles.

Note: When available these codes will be sourced from the NZHTS Implementation Guide

"""

* ^status = #active

// condition diagnosis summary concepts
* #condition-summary-codes "These codes are used in NZ to summarise the condition diagnosis" "These code values originate in SNOMED CT but are defined only in the SNOMED NZ Edition" 
  * #302471000210100 "Rheumatic heart disease with absence of signs and symptoms of acute rheumatic fever (situation)" "Can be used to summarise the diagnosis of a patient with a rheumatic fever condition"
  * #299171000210109 "History of acute rheumatic fever without heart disease" "Can be used to summarise the diagnosis of a patient with a rheumatic fever condition"
