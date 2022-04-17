#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

if [[ -z "$(which python)" ]]; then
    echo "need python."
    exit 1
fi

REPORT_FOLDER="${TOP_DIR}/.coverage/html_result"

if [[ ! -d "${REPORT_FOLDER}" ]]; then
    echo "report not exist"
    exit 1
fi

cd "${REPORT_FOLDER}" || exit 1

PORT=8081

if [[ -n "${1}" ]]; then
    PORT="${1}"
fi

exec python3 -m http.server "${PORT}"
