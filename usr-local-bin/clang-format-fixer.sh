#!/bin/bash

clang_format_bin="$(which clang-format)"

if [ ! -f "${clang_format_bin}" ]; then
    echo "clang-format not found!" >&2
    exit 1
fi

#clang_format_version="7.0.1"
#if ! ${clang_format_bin} -version | grep -q "version ${clang_format_version}"; then
#    echo "clang-format must be version ${clang_format_version}!" >&2
#    echo "current version is:" >&2
#    ${clang_format_bin} -version >&2
#    exit 1
#fi

find . -name .repo -prune -o -name .git -prune -o -type f \( \
    -iname '*.cpp' -o \
    -iname '*.h' -o \
    -iname '*.hpp' -o \
    -iname '*.c' -o \
    -iname '*.c++' -o \
    -iname '*.cc' -o \
    -iname '*.hh' -o \
    -iname '*.cxx' -o \
    -iname '*.hxx' -o \
    -iname '*.C' -o \
    -iname '*.H' \
    \) \
    -exec $clang_format_bin -i -style=file -fallback-style=none {} \;
