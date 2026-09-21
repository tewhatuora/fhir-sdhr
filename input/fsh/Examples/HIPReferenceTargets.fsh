/*
  Technical stubs so that absolute references to the HIP FHIR server
  (NHI Patient, HPI Practitioner/Location at https://api.hip.digital.health.nz)
  resolve during IG validation.

  The IG Publisher resolves an absolute Reference against Bundle entry.fullUrl
  values across the IG. Each entry below has the exact fullUrl used by the
  examples, with a minimal resource of the matching type, so the examples
  validate without "Unable to resolve resource with reference" errors.

  If example resources start referencing new HIP URLs, add a matching entry here.
*/

Instance: HIPReferenceTargets
InstanceOf: Bundle
Usage: #example
Title: "HIP external reference targets (technical stubs)"
Description: "Technical stub resources so absolute references to the HIP FHIR server (NHI/HPI) resolve during IG validation. Not real API payloads used by SDHR."
* type = #collection
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC7284"
* entry[=].resource = HIPStubPatientZKC7284
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKC9999"
* entry[=].resource = HIPStubPatientZKC9999
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZMW6002"
* entry[=].resource = HIPStubPatientZMW6002
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZMW6003"
* entry[=].resource = HIPStubPatientZMW6003
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZQW5496"
* entry[=].resource = HIPStubPatientZQW5496
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZXK9000"
* entry[=].resource = HIPStubPatientZXK9000
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/91ZZXN"
* entry[=].resource = HIPStubPractitioner91ZZXN
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/99ZZZZ"
* entry[=].resource = HIPStubPractitioner99ZZZZ
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/91ZZXZ"
* entry[=].resource = HIPStubPractitioner91ZZXZ
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FXX222-B"
* entry[=].resource = HIPStubLocationFXX222B
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ111-A"
* entry[=].resource = HIPStubLocationFZZ111A
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ998-C"
* entry[=].resource = HIPStubLocationFZZ998C
* entry[+].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ999-B"
* entry[=].resource = HIPStubLocationFZZ999B

Instance: HIPStubPatientZKC7284
InstanceOf: Patient
Usage: #inline
* id = "ZKC7284"

Instance: HIPStubPatientZKC9999
InstanceOf: Patient
Usage: #inline
* id = "ZKC9999"

Instance: HIPStubPatientZMW6002
InstanceOf: Patient
Usage: #inline
* id = "ZMW6002"

Instance: HIPStubPatientZMW6003
InstanceOf: Patient
Usage: #inline
* id = "ZMW6003"

Instance: HIPStubPatientZQW5496
InstanceOf: Patient
Usage: #inline
* id = "ZQW5496"

Instance: HIPStubPatientZXK9000
InstanceOf: Patient
Usage: #inline
* id = "ZXK9000"

Instance: HIPStubPractitioner91ZZXN
InstanceOf: Practitioner
Usage: #inline
* id = "91ZZXN"

Instance: HIPStubPractitioner99ZZZZ
InstanceOf: Practitioner
Usage: #inline
* id = "99ZZZZ"

Instance: HIPStubPractitioner91ZZXZ
InstanceOf: Practitioner
Usage: #inline
* id = "91ZZXZ"

Instance: HIPStubLocationFXX222B
InstanceOf: Location
Usage: #inline
* id = "FXX222-B"

Instance: HIPStubLocationFZZ111A
InstanceOf: Location
Usage: #inline
* id = "FZZ111-A"

Instance: HIPStubLocationFZZ998C
InstanceOf: Location
Usage: #inline
* id = "FZZ998-C"

Instance: HIPStubLocationFZZ999B
InstanceOf: Location
Usage: #inline
* id = "FZZ999-B"
