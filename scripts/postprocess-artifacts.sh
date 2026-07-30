#!/bin/bash

set -euo pipefail

artifacts_file="${1:-output/artifacts.html}"

if [ ! -f "$artifacts_file" ]; then
  echo "Artifacts page not found: $artifacts_file" >&2
  exit 1
fi

echo "Post-processing artifacts page: $artifacts_file"

python3 - "$artifacts_file" <<'PY'
import re
import sys
import shutil
from pathlib import Path

artifacts_path = Path(sys.argv[1])
html = artifacts_path.read_text(encoding="utf-8")
internal_path = artifacts_path.with_name("artifacts-internal.html")

# Save the unmodified artifacts page
shutil.copy2(artifacts_path, internal_path)

# Remove the internal HNZ Participate operation row from the artifacts page, since it is not intended for public consumption.
row_pattern = re.compile(
    r'\s*<tr>\s*<td style="column-width:30%">\s*<a href="OperationDefinition-SDHRHNZParticipateOperation\.html".*?</tr>',
    re.DOTALL,
)

# Remove the internal HNZ Participation status operation row from the artifacts page, since it is not intended for public consumption.
row_pattern2 = re.compile(
    r'\s*<tr>\s*<td style="column-width:30%">\s*<a href="OperationDefinition-SDHRHNZParticipationStatusOperation\.html".*?</tr>',
    re.DOTALL,
)

updated_html, replacements = row_pattern.subn("", html, count=1)
updated_html2, replacements2 = row_pattern2.subn("", updated_html, count=1)

artifacts_path.write_text(updated_html2, encoding="utf-8")
PY
