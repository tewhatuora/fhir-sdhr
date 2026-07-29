# fhir-sdhr

FHIR Implementation Guide Shared Digital Health Record API 

Health New Zealand | Te Whatu Ora Shared Digital Health Record FHIR API.

## Local development

> Note: Java must be installed and available on your PATH before running the build scripts.

`./_updatePublisher.sh -y` - Download the latest FHIR Publisher

`./_genonce.sh` - Build the IG using the latest FHIR Publisher

`./_genopenapi.sh` - Generate an HNZ OpenAPI specification. Run after `_genonce.sh` to avoid changes being lost

`http-server output` - To run a local server (install using `npm install --global http-server`)

## Updating Page Content for non-technical documenters

> **WARNING: ONLY change files in this folder. Other files interact with SDHR functionality and changing them may break behavior.**

1. Make the changes you need

    - To modify existing pages navigate to `input/pagecontent` and find the relevant page. These are written in Markdown, and online or AI formatting guides can help if needed.

    - To add a new page, create a new Markdown file (`.md`) in `input/pagecontent`, add your content, and save it. Then add it to the list of pages in sushi-config.yaml

2. View your changes locally

    - Run `./_genonce.sh` to build the IG.
    - Open the generated content from `output` by running `http-server output` or another local web server.
    - Confirm the page renders correctly and that links and formatting are intact.

3. Create a PR

    - Commit only the files in `input/pagecontent` that you changed.
    - Push your branch to the repository.
    - Create a pull request against `uat`, depending on the repo workflow.
    - In the PR description, include which page(s) were updated and any important notes.
    - Request a review from the SDHR tech team: add reviewers from the tech team or tag them in the PR comments.
    - If you need help, ask the tech team directly in the PR or in the project communication channel.

4. Verify your changes in UAT

    - Once the PR is merged or deployed to UAT, navigate to the UAT preview environment.
    - Confirm the updated page appears correctly and that the content displays as intended.
    - If there are layout or rendering issues, update the markdown in `input/pagecontent` and repeat the build preview process.
    - If you are unsure about any behavior or need extra validation, ask the tech team to review the UAT preview as well.



