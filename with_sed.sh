#!/bin/sh

if [ $# -ne 2 ]; then
    exit 1
fi
if [ ! -f "$1" ]; then
    exit 1
fi
[ "$2" -eq "$2" ] 2>/dev/null
if [ $? -ne 0 ]; then
    exit 1
fi

line=$(wc -l < "$1")

if [ "$2" -lt 0 ]; then
    exit 1
fi
if [ "$2" -gt "$line" ]; then
    exit 1
fi

sed -n "$2"p "$1" | sed -E "s/^[^;]*;([^;]*);([^;]*);.*/\1 is \2/g"

exit 0
