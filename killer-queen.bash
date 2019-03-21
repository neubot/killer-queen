#!/bin/bash

function mlabssh() {
  ssh -l mlab_neubot -o 'BatchMode no' \
      -o 'StrictHostKeyChecking no' \
      -o 'UserKnownHostsFile /dev/null' \
      -o 'ConnectTimeout 10' \
      -o 'ServerAliveInterval 10' \
      -v -p 806 $@
}

function killerqueen() {
  mlabssh $1 'sudo ./init/stop.sh && sleep 3 && ' \
    'sudo rm -f ./neubot/bin/linux_386/botticelli && sudo ./init/start.sh'
  if [ $? -ne 0 ]; then
    echo $1 | tee -a BAD.txt
  else
    echo $1 | tee -a GOOD.txt
  fi
}

function enumerate() {
  curl -fsSL https://storage.googleapis.com/operator-mlab-oti/metadata/v0/current/mlab-host-ips.json \
      | jq '.[]|.hostname' | tr -d '"' | grep neubot | sed 's/^neubot.mlab.//g'
}

if [ $# -eq 0 ]; then
  set -- `enumerate`
fi
for host in "$@"; do
  killerqueen $host
done
