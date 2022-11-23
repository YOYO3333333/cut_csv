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

echo -n "$(cut -f2 -d";" "$1"| head -n "$2" | tail -n 1)"
echo -n " "
echo -n "is"
echo -n " "
echo -n "$(cut -f3 -d";" "$1" | head -n "$2" | tail -n 1)"

echo ""

exit 0
