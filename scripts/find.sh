#!/bin/bash

PROJ_ROOT="$(git rev-parse --show-toplevel)"
[ -z "$PROJ_ROOT" ] && echo "Not in a git repository" && exit 1

[ -z "$1" ] && echo "Usage: $0 <text>" && exit 1
echo "The string '$1' is found in the following files:"
grep -ri "$1" "$PROJ_ROOT" | cut -d: -f1 | sort | uniq
