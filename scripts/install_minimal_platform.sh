#!/usr/bin/env bash
set -eo pipefail

SCRIPTS_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
SUBMODULE_SCRIPTS_DIR="${SCRIPTS_DIR}/submodule-scripts"
source "${SCRIPTS_DIR}/formats.sh"

stage "Install ostis-web-platform"

git submodule update --init --recursive --progress
"${SCRIPTS_DIR}/install_sc_machine_dependencies.sh" --dev
"${SCRIPTS_DIR}/build_sc_machine.sh"
"${SCRIPTS_DIR}/build_scp_machine.sh"
"${SCRIPTS_DIR}/build_sc_component_manager.sh"
"${SCRIPTS_DIR}/build_kb.sh"

stage "ostis-web-platform is installed successfully"
