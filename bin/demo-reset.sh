#!/bin/sh
# Reset to a clean demo baseline before each recording take.
# Re-creates the local branch "demo-run" from origin/demo-baseline and removes the app
# from the booted simulator. Refuses to run if you have uncommitted changes.
set -e
cd "$(dirname "$0")/.."

if [ -n "$(git status --porcelain)" ]; then
  echo "You have uncommitted changes. Commit or 'git stash' them first." >&2
  exit 1
fi

git fetch origin demo-baseline
git checkout -B demo-run origin/demo-baseline

xcrun simctl uninstall booted com.bornneet.Edhita 2>/dev/null || true

if [ -f CustomerIO.local.xcconfig ]; then
  echo "Key file: found."
else
  echo "Key file: MISSING - create CustomerIO.local.xcconfig before the take (see DEMO.md)." >&2
fi
echo "Ready: branch demo-run is at the demo baseline."
