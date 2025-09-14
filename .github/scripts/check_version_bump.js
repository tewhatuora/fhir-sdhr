#!/usr/bin/env node
const { execSync } = require('node:child_process');
const { readFileSync } = require('node:fs');

function parseArgs() {
  const args = process.argv.slice(2);
  const out = {};
  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a === '--base-sha') out.baseSha = args[++i];
    else if (a === '--file') out.file = args[++i];
    else if (a === '--help' || a === '-h') out.help = true;
  }
  return out;
}

function usage() {
  console.log('Usage: node check_version_bump.js --base-sha <sha> --file <path>');
}

function readAtSha(sha, file) {
  try {
    return execSync(`git show ${sha}:${file}`, { encoding: 'utf8' });
  } catch (e) {
    return null;
  }
}

function parseVersionFromYaml(text) {
  if (!text) return null;
  // Look for a simple YAML key: version: x.y.z (optionally quoted)
  const lines = text.split(/\r?\n/);
  for (const line of lines) {
    const m = line.match(/^\s*version\s*:\s*["']?([^\s"'#]+)["']?/i);
    if (m) return m[1].trim();
  }
  return null;
}

function semverToParts(v) {
  // Strip any pre-release/build metadata for numeric compare
  const core = v.split('-')[0].split('+')[0];
  return core.split('.').map((x) => Number.parseInt(x, 10) || 0);
}

function compareSemver(a, b) {
  const pa = semverToParts(a);
  const pb = semverToParts(b);
  const len = Math.max(pa.length, pb.length);
  for (let i = 0; i < len; i++) {
    const da = pa[i] || 0;
    const db = pb[i] || 0;
    if (da > db) return 1;
    if (da < db) return -1;
  }
  return 0;
}

(function main() {
  const { baseSha, file, help } = parseArgs();
  if (help || !baseSha || !file) {
    usage();
    process.exit(help ? 0 : 2);
  }

  const baseContent = readAtSha(baseSha, file);
  if (!baseContent) {
    console.error(`Could not read ${file} at base SHA ${baseSha}.`);
    process.exit(1);
  }

  let prContent;
  try {
    prContent = readFileSync(file, 'utf8');
  } catch (e) {
    console.error(`Could not read ${file} from PR workspace.`);
    process.exit(1);
  }

  const baseVersion = parseVersionFromYaml(baseContent);
  const prVersion = parseVersionFromYaml(prContent);

  if (!baseVersion) {
    console.error(`Base version not found in ${file}.`);
    process.exit(1);
  }
  if (!prVersion) {
    console.error(`PR version not found in ${file}.`);
    process.exit(1);
  }

  console.log(`Base version: ${baseVersion}`);
  console.log(`PR version:   ${prVersion}`);

  const cmp = compareSemver(prVersion, baseVersion);
  if (cmp <= 0) {
    console.error(`Version must be increased for UAT merges: ${prVersion} <= ${baseVersion}`);
    process.exit(1);
  }

  console.log('Version bump check passed.');
})();

