#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/helpers.sh"

# shellcheck disable=1090
THEME_PATH="${CURRENT_DIR}/scripts/dark-mode.sh"

main() {
	"${CURRENT_DIR}/scripts/dark-mode.swift" "${THEME_PATH}" &
}

main
