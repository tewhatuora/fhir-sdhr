import fs from 'node:fs';
import path from 'node:path';

const artifactsPath = process.argv[2] ?? 'output/artifacts.html';
if (!fs.existsSync(artifactsPath)) {
  console.error(`Artifacts page not found: ${artifactsPath}`);
  process.exit(1);
}

console.log(`Post-processing artifacts page: ${artifactsPath}`);
const html = fs.readFileSync(artifactsPath, 'utf8');
fs.copyFileSync(artifactsPath, path.join(path.dirname(artifactsPath), 'artifacts-internal.html'));
const internalArtifacts = [
  'OperationDefinition-SDHRHNZParticipateOperation',
  'OperationDefinition-SDHRHNZDomainParticipateOperation',
  'OperationDefinition-SDHRHNZParticipationStatusOperation',
  'Bundle-HIPReferenceTargets'
];
let publicHtml = html;
for (const artifact of internalArtifacts) {
  const row = new RegExp(`\\s*<tr>\\s*<td style="column-width:30%">\\s*<a href="${artifact}\\.html"[\\s\\S]*?</tr>`);
  publicHtml = publicHtml.replace(row, '');
}
fs.writeFileSync(artifactsPath, publicHtml);
