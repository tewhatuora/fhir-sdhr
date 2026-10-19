CodeSystem: SDHRDomains
Id: sdhr-domains
Title: "SDHR Data Domains"
Description: "National data domains supporting independent SDHR participation choices."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #SDHRMedications "Medications" "Medication requests and dispenses are one participation domain."
* #SDHRImmunisations "Immunisations" "Immunisation records."

ValueSet: SDHRDomainValues
Id: sdhr-domains
Title: "SDHR Data Domains"
Description: "Supported SDHR domain participation identifiers."
* ^status = #active
* ^experimental = false
* include codes from system SDHRDomains
