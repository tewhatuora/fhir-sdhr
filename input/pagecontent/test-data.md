### Overview

The SDHR UAT environment contains some fixed data to support specific testing use cases, which are detailed below.

## Patients

| Identifiers | Description | OperationOutcome |
| -------- | ------- | ------- |
| ZMW9001 - ZMW9009  |  This set of Patients are opted out globally with HNZ. | [Global Deny OperationOutcome](./OperationOutcome-OperationOutcomeGlobalDenyExample.json.html) |
| ZMW8001 - ZMW8010 | This set of Patients are locked due to a background load process at each of these facilities: FZZ999-B, FZZ997-J, FZZ996-G, FZZ995-E, FZZ994-C. | [Patient Locked OperationOutcome](./OperationOutcome-OperationOutcomePatientLocked.json.html) |

## Facilities

| Identifiers | Description | OperationOutcome |
| -------- | ------- | ------- |
| FXX999-K, FZZ775-B, FZZ773-J, FZZ772-G, FZZ771-E, FZZ770-C, FZZ769-G, FZZ761-B, FZZ759-D, FZZ758-B, FZZ756-J | These facilities are temporarily locked due to a background load process. | [Facility Locked OperationOutcome](./OperationOutcome-OperationOutcomeFacilityLocked.json.html) |
| FZZ755-G, FZZ754-E, FZZ753-C, FZZ751-K, FZZ750-H, FZZ749-A, FZZ748-K, FZZ739-J, FZZ738-G, FZZ737-E | These facilities are not onboarded to SDHR. | [Facility Not Onboarded OperationOutcome](./OperationOutcome-OperationOutcomeFacilityUnknown.json.html) |

The below facilities are onboarded to SDHR UAT.
```
FZZ999-B, FZZ997-J, FZZ996-G, FZZ995-E, FZZ994-C, FZZ993-A, FZZ992-K, FZZ991-H, FZZ990-F, FZZ988-H
FZZ986-D, FZZ985-B, FZZ982-G, FZZ981-E, FZZ979-G, FZZ977-C, FZZ976-A, FZZ975-K, FZZ972-D, FZZ971-B
FZZ969-D, FZZ968-B, FZZ966-J, FZZ747-H, FZZ746-F, FZZ745-D, FZZ961-K, FZZ960-H, FZZ959-A, FZZ958-K
FZZ957-H, FZZ956-F, FZZ955-D, FZZ954-B, FZZ952-J, FZZ951-G, FZZ950-E, FZZ949-J, FZZ947-E, FZZ946-C
FZZ945-A, FZZ944-K, FZZ943-H, FZZ941-D, FZZ940-B, FZZ939-F, FZZ938-D, FZZ937-B, FZZ935-J, FZZ934-G
FZZ742-J, FZZ741-G, FZZ933-E, FZZ932-C, FZZ931-A, FZZ929-C, FZZ928-A, FZZ926-H, FZZ925-F, FZZ924-D
FZZ923-B, FZZ921-J, FZZ920-G, FZZ918-J, FZZ917-G, FZZ916-E, FZZ915-C, FZZ914-A, FZZ913-K, FZZ912-H
FZZ911-F, FZZ910-D, FZZ909-H, FZZ908-F, FZZ907-D, FZZ906-B, FZZ904-J, FZZ903-G, FZZ902-E, FZZ901-C
FZZ899-J, FZZ898-G, FZZ897-E, FZZ896-C, FZZ895-A, FZZ894-K, FZZ893-H, FZZ892-F, FZZ891-D, FZZ890-B
FZZ888-D, FZZ887-B, FZZ885-J, FZZ884-G, FZZ882-C, FZZ881-A, FZZ880-K, FZZ879-C, FZZ878-A, FZZ877-K
FZZ876-H, FZZ875-F, FZZ874-D, FZZ873-B, FZZ871-J, FZZ870-G, FZZ868-J, FZZ867-G, FZZ866-E, FZZ865-C
FZZ864-A, FZZ863-K, FZZ862-H, FZZ861-F, FZZ860-D, FZZ859-H, FZZ858-F, FZZ857-D, FZZ856-B, FZZ854-J
FZZ853-G, FZZ852-E, FZZ851-C, FZZ850-A, FZZ849-E, FZZ848-C, FZZ847-A, FZZ846-K, FZZ845-H, FZZ844-F
FZZ843-D, FZZ842-B, FZZ840-J, FZZ839-B, FZZ837-J, FZZ836-G, FZZ835-E, FZZ834-C, FZZ833-A, FZZ832-K
FZZ831-H, FZZ830-F, FZZ829-K, FZZ828-H, FZZ827-F, FZZ826-D, FZZ825-B, FZZ823-J, FZZ822-G, FZZ821-E
FZZ820-C, FZZ819-G, FZZ818-E, FZZ817-C, FZZ816-A, FZZ815-K, FZZ814-H, FZZ813-F, FZZ812-D, FZZ811-B
FZZ809-D, FZZ808-B, FZZ806-J, FZZ805-G, FZZ804-E, FZZ803-C, FZZ802-A, FZZ801-K, FZZ800-H, FZZ799-E
FZZ798-C, FZZ797-A, FZZ796-K, FZZ795-H, FZZ794-F, FZZ793-D, FZZ792-B, FZZ790-J, FZZ789-B, FZZ787-J
FZZ786-G, FZZ785-E, FZZ784-C, FZZ783-A, FZZ782-K, FZZ781-H, FZZ779-K, FZZ778-H, FZZ777-F, FZZ776-D
```
