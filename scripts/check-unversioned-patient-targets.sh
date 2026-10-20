#!/usr/bin/env bash

set -euo pipefail

package_path="${1:-output/package.tgz}"

if [[ ! -f "$package_path" ]]; then
  echo "FHIR package not found: $package_path" >&2
  exit 2
fi

consent_profile="package/StructureDefinition-SDHRConsent.json"

if ! tar -tf "$package_path" 2>/dev/null | grep -Fxq "$consent_profile"; then
  echo "$consent_profile not found in $package_path" >&2
  exit 2
fi

if tar -xOf "$package_path" "$consent_profile" 2>/dev/null \
  | jq -e '
      .snapshot.element[]
      | select(.path == "Consent.patient")
      | .type[]?.targetProfile[]?
      | select(startswith("http://hl7.org/fhir/StructureDefinition/Patient|"))
    ' >/dev/null; then
  echo "Version-pinned Consent.patient targetProfile found in $package_path" >&2
  exit 1
fi

echo "Consent.patient targetProfile is unversioned in $package_path"
