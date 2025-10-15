### Overview

The SDHR UAT environment contains some fixed data to support specific testing use cases, which are detailed below.

## Patients

| Identifiers | Description | OperationOutcome |
| -------- | ------- | ------- |
| ZMW9001 - ZMW9009  |  This set of Patients are opted out globally with HNZ. | [Global Deny OperationOutcome](./OperationOutcome-OperationOutcomeGlobalDenyExample.json.html) |
|ZMW8001- ZMW8010 | This set of Patients are locked due to a background load process. | [Patient Locked OperationOutcome](./OperationOutcome-OperationOutcomePatientLocked.json.html) |

## Facilities

| Identifiers | Description | OperationOutcome |
| -------- | ------- | ------- |
| FXX999-K, FZZ775-B, FZZ773-J, FZZ772-G, FZZ771-E, FZZ770-C, FZZ769-G, FZZ761-B, FZZ759-D, FZZ758-B, FZZ756-J | These facilities are temporarily locked due to a background load process. | [Facility Locked OperationOutcome](./OperationOutcome-OperationOutcomeFacilityLocked.json.html) |
| FZZ755-G, FZZ754-E, FZZ753-C, FZZ751-K, FZZ750-H, FZZ749-A, FZZ748-K, FZZ739-J, FZZ738-G, FZZ737-E | These facilities are not yet onboarded to SDHR. | [Facility Not Onboarded OperationOutcome](./OperationOutcome-OperationOutcomeFacilityUnknown.json.html) |
