#! /bin/sh
# NB: This file, and the Windows version, should be generated from common source.

HARNESS_ROOT_DIR="${HARNESS_ROOT_DIR:-.}"
LIBRARY="${HARNESS_ROOT_DIR}"/library

target=`echo "$1" | sed -e 's/\.nqp$//'`
rm -f "$target.pir" "$target.pbc" "$target.t.pbc"
parrot-nqp --target=pir --output="$target.pir" "$target.nqp"
parrot --output="$target.pbc" "$target.pir"
pbc_merge --output="$target.t.pbc" "${LIBRARY}"/krt0.pbc "$target.pbc"
parrot -L"${LIBRARY}" "$target.t.pbc"
