#!/bin/bash
jarname="server.jar"
dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

touch console.log
mkdir world_backups

# starts the server.jar in a new screen
screen -dm -L -Logfile $dir/console.log -S mbi_console bash -c 'cd $HOME/minecraft_server && java -Xms1G -Xmx3G -jar server.jar'
screen -r mbi_console -X colon "logfile flush 1 "
# starts the main loop script
screen -dmS mbi_main bash -c $dir/main.sh
