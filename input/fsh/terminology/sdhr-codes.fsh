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

* #sdhr-usability-flags "These codes are intended to be applied as `Meta.tag` indicators so that API Consumers are able apply local visibility or usability rules."
  * #highlighted "Highlighted" "This code indicates that the resource is important and, for example, should be highlighted in a user interface."