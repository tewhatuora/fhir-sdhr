Like any NZ organisation collecting/sharing patient health information, Te Whatu Ora Health New Zealand has to abide by the requirements of the NZ Health Information Privacy Code.

In support of this, the *NZ Shared Digital Health Record API* has implemented the following measures:

1. Client applications **MUST** record the patient's consent to Te Whatu Ora Health New Zealand collecting their health information using instances of the [SDHRConsent](./StructureDefinition-SDHRConsent.html) resource on this server, and
2. For all FHIR resource types that may contain patient health information, the FHIR API controls access to resource instances based on presence of a valid referencing Consent resource

It is up to the each health organisation storing/sharing health information through this FHIR API to
- Operate a process which obtains patient consent, and
- Arrange for their FHIR-integrated application to call the FHIR API to create appropriate FHIR Consent resources representing the state of patients' consents with the resources they have created referenced from `.provision.data`.

An [example consent resource](./Consent-SDHRConsentExample.html) is included to show what this should look like. 

## Overview


<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/consent-sequence.plantuml` -->
{% include consent-sequence.svg %}
</div>
<br clear="all">

### Consent-based protection measures

#### Access control measure
When a client application, authorized by TWO to access the FHIR API, tries to access an instance of  
  a FHIR resource X of an **access-controlled type** at a Url like:  
  
```
  FHIR_API_URL/{resource-type}/X (where X is a resource instance identifier)
```  

- This API permits access to X only when a valid Consent instance is found that references X - this allows all FHIR client applications authorized by Te Whatu Ora to access the resource instance.  
- If the API finds no valid Consent instance that references X, access is denied to all FHIR client applications (including the application that created the resource instance).




