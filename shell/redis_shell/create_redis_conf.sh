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

mkdir /etc/redis/
is_master=1
case "${1}" in
    master)
	if [ $# != 2 ] ; then
	echo -e "$RED USAGE: $0 master port."
	echo -e " e.g.: $0 master 6379 $RESET" 
	exit 1; 
	fi 
	port=$2
	;;
    slave)
	if [ $# != 4 ] ; then
	echo -e "$RED USAGE: $0 slave port master_ip master_port."
	echo -e " e.g.: $0 slave 6380 127.0.0.1 6379 $RESET" 
	exit 1; 
	fi 
	is_master=0
	port=$2
	master_ip=$3
	master_port=$4
	;;
	*)
	echo -e "$RED USAGE: $0 master port | slave port master_ip master_port ."
	echo -e " e.g.: $0 master 6379 | $0 slave 6380 127.0.0.1 6379 $RESET" 
	exit 1; 
	;;
	esac

mkdir -p /mnt/sdc/codis/$port/ 1>/dev/null 2>&1
mkdir -p /mnt/sdc/codis/$port/ 1>/dev/null 2>&1

echo -e "$DARKBLUE create codis server config ,port : $port $RESET"

cp -fp codis.conf codis_$port.conf
sed -i "s/pidfile \/mnt\/sdc\/codis\/codis.pid/pidfile \/mnt\/sdc\/codis\/$port\/codis_$port.pid/g" codis_$port.conf
sed -i "s/port 6379/port $port/g" codis_$port.conf
sed -i "s/logfile \"\/mnt\/sdc\/codis\/codis.log\"/logfile \"\/mnt\/sdc\/codis\/$port\/codis_$port.log\"/g" codis_$port.conf
sed -i "s/dbfilename dump.rdb/dbfilename dump_$port.rdb/g" codis_$port.conf
sed -i "s/dir \/mnt\/sdc/dir \/mnt\/sdc\/codis\/$port\//g" codis_$port.conf

if [ $is_master = 1 ]; then
sed -i "s/save 900 1/#save 900 1/g" codis_$port.conf
sed -i "s/save 300 10/#save 300 10/g" codis_$port.conf
sed -i "s/save 60 10000/#save 60 10000/g" codis_$port.conf
else
sed -i "s/# slaveof <masterip> <masterport>/slaveof $master_ip $master_port/g" codis_$port.conf
fi
