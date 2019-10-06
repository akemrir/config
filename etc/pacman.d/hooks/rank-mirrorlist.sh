#!/bin/sh -e -u

COUNTRIES='.*'

MIRRORLIST="${1-}"

if [ -z "$MIRRORLIST" ]; then
	exit 2
fi

if [ -f "$MIRRORLIST.pacnew" ]; then
	mv -f -- "$MIRRORLIST.pacnew" "$MIRRORLIST.bak"
elif [ -f "$MIRRORLIST" ]; then
	mv -f -- "$MIRRORLIST" "$MIRRORLIST.bak"
fi

rank-mirrorlist -c "${COUNTRIES-}" -- "$MIRRORLIST.bak" > "$MIRRORLIST"
