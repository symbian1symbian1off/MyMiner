#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth.2miners.com:2020
WALLET=0x75c87bB33435AaE56116DF4937b340924a980a74.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
