#!bin/bash
dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

io_write () {
	screen -S mbi_console -X stuff "$1"
}

io_read () {
	msg=$(tail -1 $dir/console.log)
	msg=${msg#*>}
	echo $msg
}

