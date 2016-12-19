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

mkdir -p /mnt/sdc/redis/$port/ 1>/dev/null 2>&1
mkdir -p /mnt/sdc/redis/$port/ 1>/dev/null 2>&1

echo -e "$DARKBLUE create redis server config ,port : $port $RESET"
mkdir -p /etc/redis/redis_$port/conf/
mkdir -p /etc/redis/redis_$port/log/
mkdir -p /etc/redis/redis_$port/run/
mkdir -p /etc/redis/redis_$port/lib/
cp -fp ~/server/doc/redis.conf /etc/redis/redis_$port/conf/redis.conf
sed -i "s/daemonize no/daemonize yes/g" /etc/redis/redis_$port/conf/redis.conf
sed -i "s/port 6379/port $port/g" /etc/redis/redis_$port/conf/redis.conf
sed -i "s/pidfile \/var\/run\/redis\/redis.pid/pidfile \/etc\/redis\/redis_$port\/run\/redis.pid/g" /etc/redis/redis_$port/conf/redis.conf
sed -i "s/logfile \/var\/log\/redis\/redis.log/logfile \/etc\/redis\/redis_$port\/log\/redis.log/g" /etc/redis/redis_$port/conf/redis.conf
#sed -i "s/dbfilename dump.rdb/dbfilename dump_$port.rdb/g" /etc/redis/redis_$port/conf/redis.conf
sed -i "s/dir \/var\/lib\/redis\//dir \/etc\/redis\/redis_$port\/lib\//g" /etc/redis/redis_$port/conf/redis.conf

if [ $is_master = 1 ]; then
# sed -i "s/save 900 1/#save 900 1/g" /etc/redis/redis_$port/conf/redis.conf
# sed -i "s/save 300 10/#save 300 10/g" /etc/redis/redis_$port/conf/redis.conf
# sed -i "s/save 60 10000/#save 60 10000/g" /etc/redis/redis_$port/conf/redis.conf
echo "master...."
else
sed -i "s/# slaveof <masterip> <masterport>/slaveof $master_ip $master_port/g" /etc/redis/redis_$port/conf/redis.conf
fi
