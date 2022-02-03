#!/bin/sh

[ -f "${ssh_config}" ] || echo "Warning: No OpenSSH config not found." > /dev/stderr

chown root:root ~/.ssh/config;

#ruby /backup.rb

chown 1000:1000 -R /Backups;chmod 700 -R /Backups
