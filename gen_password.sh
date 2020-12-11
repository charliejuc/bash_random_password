#!/bin/bash

LEN=$1

if [ ! $LEN ]; then
	>&2 echo "Length parameter is required."
	exit 1
fi

UR_LEN=$(($LEN/2))
R_LEN=$UR_LEN

PASSWORD=$(echo -n "$(head -c $UR_LEN /dev/urandom)$(head -c $R_LEN /dev/random)" | base64 | tr -d "=" | tr -d "\n" | cut -c -$LEN)

echo $PASSWORD
