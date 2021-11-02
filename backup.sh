#!/bin/bash
dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $dir/io.sh
date=$(date "+%y%m%d_%H%M%S")

io_write "say WORLD BACKIMG UP..."
cp -r $dir/../world $dir/world_backups/$date
io_write "say BACKUP COMPLETE"
