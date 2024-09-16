#!/bin/sh

function getPort {
	while true; do
		PORT1=$(( (1 + $RANDOM % 10000) + 40000 ))
		PORT2=$(($PORT1+1))
		ss -lnt | grep "^LISTEN.*:$PORT1[[:space:]]" >/dev/null
		PORT1OK=$?
		ss -lnt | grep "^LISTEN.*:$PORT2[[:space:]]" >/dev/null
		PORT2OK=$?

		if test $PORT1OK -ne 0 -a $PORT2OK -ne 0; then
			echo $PORT1
			break
		else
			echo "port taken $PORT1, $PORT2" 1>&2
		fi
	done
}

PORT=$(getPort)
exec autossh -f -N -M $PORT "$1"
