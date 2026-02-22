#!/usr/bin/env bash
set -euo pipefail

EXPECTED_REMOTE="${1:-}"

echo "=== Session Pre-Flight ==="
echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S %z')"
echo "PWD: $(pwd)"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  BRANCH="$(git branch --show-current)"
  REMOTE_URL="$(git remote get-url origin 2>/dev/null || true)"
  STATUS="$(git status --short --branch)"

  echo "Git branch: ${BRANCH:-<none>}"
  echo "Git origin: ${REMOTE_URL:-<none>}"
  echo "Git status:"
  echo "${STATUS}"

  if [[ -n "${EXPECTED_REMOTE}" ]] && [[ "${REMOTE_URL}" != *"${EXPECTED_REMOTE}"* ]]; then
    echo "ERROR: origin does not match expected pattern: ${EXPECTED_REMOTE}" >&2
    exit 2
  fi
else
  echo "ERROR: not inside a git repository" >&2
  exit 2
fi

echo "Pre-flight: OK"
