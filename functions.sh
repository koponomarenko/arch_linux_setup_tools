#!/bin/bash

# include guard
if declare -f -F cmd_do >/dev/null; then
    return
fi

default_cmd_die() {
    echo $@
    exit 1
}

verbose_cmd_die() {
    echo "  ERROR: [$(basename -- "${0}")] cmd failed '$@'" >&2
    exit 1
}

cmd_die() {
    #default_cmd_die "$@"
    verbose_cmd_die "$@"
}

default_cmd_do_nonfatal() {
    echo ">> $@"
    eval "$@"
}

cmd_do_nonfatal() {
    default_cmd_do_nonfatal "$@"
}

cmd_do() {
    cmd_do_nonfatal "$@" || cmd_die "$@"
}

log_err() {
    echo "  ERROR: [$(basename -- "${0}")] $@" >&2
}
