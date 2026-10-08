#!/usr/bin/env bash
# Deploys the Oracle Engine Labs site to GitHub Pages.
# Prereq: the "oracle-engine-labs" org must already exist.
set -euo pipefail
ORG=oracle-engine-labs
REPO="$ORG.github.io"

gh repo create "$ORG/$REPO" --public \
  --description "Oracle Engine Labs — interpretability and machine cognition research" \
  --homepage "https://$ORG.github.io" || true

git init -b main 2>/dev/null || true
git add -A
git commit -m "Launch Oracle Engine Labs site

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>" || true
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$ORG/$REPO.git"
git push -u origin main --force

gh api -X POST "repos/$ORG/$REPO/pages" \
  -f "source[branch]=main" -f "source[path]=/" 2>/dev/null \
  || echo "Pages may already be enabled; check Settings -> Pages."

echo "Done -> https://$ORG.github.io"
