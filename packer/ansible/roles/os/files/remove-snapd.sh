#!/usr/bin/env bash
_snaps=( $(snap list | tail -n +2 | awk '{print $1}') )
while [[ -n ${_snaps[@]} ]] ; do
  for s in ${_snaps[@]} ; do
    if snap remove "${s}"; then
    _snaps=( ${_snaps[@]/${s}} )
    else
      :
    fi
  done
done
systemctl stop snapd.service snapd.socket snapd.apparmor.service
apt purge snapd --assume-yes
rm -rf /var/lib/snapd /root/snap /lib/snapd
