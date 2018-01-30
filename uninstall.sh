﻿#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

#Stop ShadowsocksR
bash /usr/local/simplessr/ss/stop.sh

#Delete Files
rm -rf /usr/local/simplessr
rm -rf /usr/local/bin/ssr