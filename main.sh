#!/bin/bash
dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source $dir/io.sh

clockspeed=1
backupTimer=7200

counter=0
whitelist="whitelist"

maybeBackup () {
	if ((counter%backupTimer==0))
	then
		$dir/backup.sh
	fi
}

maybeCmd () {
	message=$(io_read)
	cmd=${message% *}
	usr=${message#* }
	# checks to whitelist
	if [ "$cmd" = '!whitelist' ]
	then
		io_write "whitelist add $usr"
		sleep 0.2s
		io_write "say $(io_read)"
	# checks to backup
	elif [ "$cmd" = '!backup' ]
	then
		echo "test3"
		$dir/backup.sh
	fi
}

while true
do
	echo $counter

	maybeBackup
	maybeCmd

	sleep $clockspeed
	counter=$((counter+1))

done
