#!/bin/bash

# include guard
if declare -f -F cmd_do >/dev/null; then
    return
fi

cmd_do() {
    eval "$@" || { echo "$(realpath -s "${BASH_SOURCE[0]}"): cmd failed '$@'" >&2; exit 1; }
}

log_err() {
    echo "$(realpath -s "${BASH_SOURCE[0]}"): $@" >&2
}
