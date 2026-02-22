#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  scripts/bootstrap_project.sh <project-name> [--target-root <path>] [--remote <git-url>]

Examples:
  scripts/bootstrap_project.sh my-new-app
  scripts/bootstrap_project.sh my-new-app --target-root "/Users/pjdn/Documents/Codex projects"
  scripts/bootstrap_project.sh my-new-app --remote "git@github.com:pjdamnielsen/my-new-app.git"
USAGE
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

PROJECT_NAME="$1"
shift || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_ROOT="$(cd "${SOURCE_DIR}/.." && pwd)"
REMOTE_URL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target-root)
      TARGET_ROOT="$2"
      shift 2
      ;;
    --remote)
      REMOTE_URL="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

DEST_DIR="${TARGET_ROOT}/${PROJECT_NAME}"
if [[ -e "${DEST_DIR}" ]]; then
  echo "Destination already exists: ${DEST_DIR}" >&2
  exit 1
fi

mkdir -p "${DEST_DIR}"

INCLUDE_PATHS=(
  ".github"
  "docs"
  "scripts"
  "templates"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "VERSION"
  ".gitignore"
  "README.md"
)

copy_path() {
  local src="$1"
  local dst="$2"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a "${src}" "${dst}"
  else
    cp -R "${src}" "${dst}"
  fi
}

for rel in "${INCLUDE_PATHS[@]}"; do
  if [[ -e "${SOURCE_DIR}/${rel}" ]]; then
    copy_path "${SOURCE_DIR}/${rel}" "${DEST_DIR}/"
  fi
done

# Remove files that should never be copied into new projects.
rm -f "${DEST_DIR}/.github.env" "${DEST_DIR}/.confluence.env"
rm -rf "${DEST_DIR}/.auth"

# Replace hardcoded repository identifiers with project placeholders.
replace_text() {
  local file="$1"
  local from="$2"
  local to="$3"
  if [[ -f "${file}" ]]; then
    perl -0pi -e "s|\Q${from}\E|${to}|g" "${file}"
  fi
}

replace_text "${DEST_DIR}/README.md" "codex-sdlc-test" "${PROJECT_NAME}"
replace_text "${DEST_DIR}/CHANGELOG.md" "codex-sdlc-test" "${PROJECT_NAME}"
replace_text "${DEST_DIR}/docs/confluence/00-SPACE-HOME.md" "codex-sdlc-test" "${PROJECT_NAME}"
replace_text "${DEST_DIR}/docs/CONFLUENCE_SYNC.md" "pjdamnielsen/codex-sdlc-test" "<owner>/${PROJECT_NAME}"
replace_text "${DEST_DIR}/docs/TICKETS.md" "pjdamnielsen/codex-sdlc-test" "<owner>/${PROJECT_NAME}"

if [[ -d "${DEST_DIR}/.git" ]]; then
  rm -rf "${DEST_DIR}/.git"
fi

git -C "${DEST_DIR}" init -b main >/dev/null

if [[ -n "${REMOTE_URL}" ]]; then
  git -C "${DEST_DIR}" remote add origin "${REMOTE_URL}"
fi

echo "Project bootstrap created: ${DEST_DIR}"
echo "Next steps:"
echo "  1) cd \"${DEST_DIR}\""
echo "  2) Review docs and set project-specific values"
echo "  3) git add . && git commit -m \"Initialize SDLC baseline\""
if [[ -n "${REMOTE_URL}" ]]; then
  echo "  4) git push -u origin main"
fi
