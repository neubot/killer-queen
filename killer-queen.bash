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
    'sudo rm ./neubot/bin/linux_386/botticelli && sudo ./init/start.sh'
  if [ $? -ne 0 ]; then
    echo $1 | tee -a BAD.txt
  else
    echo $1 | tee -a GOOD.txt
  fi
}

function enumerate() {
  curl -fsSL 'https://mlab-ns.appspot.com/neubot?policy=all' \
      | jq '.[]|.fqdn' | tr -d '"' | sed 's/^neubot.mlab.//g'
}

for host in `enumerate`; do
  killerqueen $host
done
