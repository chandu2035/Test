#!/bin/bash

#### Script to start AppDyanmics Machine Agent ###########

MACHINE_AGENT_HOME=/appd/machineagent
CURRENT_DIR=.
JAVA_PATH=$CURRENT_DIR/jre/bin
MACHINE_AGENT_USER=appduser

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CLR_RESET='\033[0m' 

if [ "$USER" != "$MACHINE_AGENT_USER" ]; then
   echo -e "\n$RED[ERROR]: Script execution is allowed by user:$GREEN $MACHINE_AGENT_USER\n"
   exit 0
fi

function progress {
    bar=''
    for (( x=0; x <= 100; x++ )); do
        sleep 0.05
        bar="${bar} "

        echo -ne "\r"
        echo -ne "\e[43m$bar\e[0m"

        local left="$(( 100 - $x ))"
        printf " %${left}s"
        echo -n "${x}%"
    done
    echo -e "\n"
}

echo -e "\nStarting AppDynamcis Machine Agent\n"
nohup $JAVA_PATH/java -jar $CURRENT_DIR/machineagent.jar & > /dev/null 2>&1
progress



ls -lrt #CURRENT_DIR

