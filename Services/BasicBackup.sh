#!/usr/bin/env sh

local_path="/Backups/$3/$1/"
tmpdir=$(mktemp -d)

mkdir -p "$local_path"
rsync --compress-level=9 -taze "ssh -o StrictHostKeyChecking=no" "$1":"$2" "$tmpdir/"
tar cf "$local_path$(date +%s).tar.gz" -C "$tmpdir" "." && rm -r "$tmpdir"