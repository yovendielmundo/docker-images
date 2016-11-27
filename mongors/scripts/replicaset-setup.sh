#!/bin/bash

RS1=`ping -c 1 rs1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
RS2=`ping -c 1 rs2 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
RS3=`ping -c 1 rs3 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

echo "Waiting for startup.."
until curl http://${RS1}:28017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done

echo curl http://${RS1}:28017/serverStatus\?text\=1 2>&1 | grep uptime | head -1
echo "Started.."


echo SETUP.sh time now: `date +"%Y%m%d %H:%M:%S" `

mongo --host ${RS1}:27017 <<EOF
    var cfg = {
        "_id": "rs",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "${RS1}:27017",
                "priority": 2
            },
            {
                "_id": 1,
                "host": "${RS2}:27017",
                "priority": 0
            },
            {
                "_id": 2,
                "host": "${RS3}:27017",
                "priority": 0
            }
        ]
    };

    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });

EOF
