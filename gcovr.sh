#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

export COVERAGE_FOLDER=${TOP_DIR}/.coverage
export HTML_RESULT_PATH="${COVERAGE_FOLDER}/html_result"

if [[ -z "$(which gcovr)" ]]; then
    echo "need gcovr"
    exit 1
fi

if [[ -d "${COVERAGE_FOLDER}" ]]; then
    rm -rf "${COVERAGE_FOLDER}"
fi

mkdir "${COVERAGE_FOLDER}"
mkdir "${HTML_RESULT_PATH}"

gcovr -r . \
    --branches \
    --filter=".*/starter-cpp/.*" \
    --html-details "${HTML_RESULT_PATH}"/index.html \
    --xml-pretty -o "${COVERAGE_FOLDER}"/coverage.xml \
    --gcov-executable="llvm-cov gcov"
