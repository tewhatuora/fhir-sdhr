CodeSystem: SDHRDomains
Id: sdhr-domains
Title: "SDHR Domains"
Description: "Domains supported by the SDHR domain participation operation."
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #SDHRMedications "SDHR Medications"
* #SDHRImmunisations "SDHR Immunisations"

ValueSet: SDHRDomainValueSet
Id: sdhr-domain-valueset
Title: "SDHR Domains"
Description: "Supported SDHR domain participation choices."
* ^status = #active
* include codes from system SDHRDomains