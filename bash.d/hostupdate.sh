#!/bin/bash
# SSH autocompleter hosts
# P. Baart 05-07-2016
# version : 0.1.0

#credentials and servers
source hostupdate.cfg
#required commands
CMDS="curl jq"
CWD=${pwd}

for i in $CMDS
do
    # command -v will return >0 when the $i is not found
    command -v $i >/dev/null && continue || { echo -e " $i command not found.\n please install: sudo apt install $i"; exit 1; }
done

for SERVER in "${SERVERS[@]}"
do
    curl --silent --user $USER:$PASS 'https://'$SERVER'/cgi-bin/icinga/status.cgi?style=hostdetail&limit=0&start=1&jsonoutput' > $SERVER.json
done
#jq .status.host_status[].host_name *.json
jq .status.host_status[].host_name *.json | sort -u > ~/.ssh/hxshosts.txt
if [ -f custom.hosts ];
then
    cat custom.hosts >> ~/.ssh/hxshosts.txt
fi

rm *.json
