#!/bin/bash

RED=\\e[1m\\e[31m
DARKRED=\\e[31m
GREEN=\\e[1m\\e[32m
DARKGREEN=\\e[32m
BLUE=\\e[1m\\e[34m
DARKBLUE=\\e[34m
YELLOW=\\e[1m\\e[33m
DARKYELLOW=\\e[33m
MAGENTA=\\e[1m\\e[35m
DARKMAGENTA=\\e[35m
CYAN=\\e[1m\\e[36m
DARKCYAN=\\e[36m
RESET=\\e[m

if [ $# != 1 ] ; then
echo -e "$RED USAGE: $0 port. e.g.: $0 6379 $RESET"
exit 1;
fi

echo -e "$DARKBLUE stoping codis server on port : $1 ... $RESET"

redis-cli -p $1 shutdown

