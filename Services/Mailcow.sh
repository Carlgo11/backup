#!/usr/bin/env sh

local_path="/Backups/Mailcow/$1/"

mkdir -p "$local_path"
rsync --compress-level=9 -taze "ssh -o StrictHostKeyChecking=no" "$1":"$2" "$local_path"
