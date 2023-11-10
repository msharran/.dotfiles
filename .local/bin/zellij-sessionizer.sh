#!/usr/bin/env bash

source "$(dirname "$0")/functions.sh"
if [[ $? -ne 0 ]]; then
    exit 1
fi

SESSION_CWD=$(select_project_or_default $1)
if [[ $? -ne 0 ]]; then
    exit 1
fi

SESSION_NAME=$(basename "${SESSION_CWD}" | tr . _)
if [[ $? -ne 0 ]]; then
    exit 1
fi

zellij options \
    --attach-to-session true \
    --default-cwd "${SESSION_CWD}" \
    --session-name "${SESSION_NAME}"
