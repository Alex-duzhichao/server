#!/bin/bash
#install zookeeper
	cd /opt/
	wget http://apache.fayea.com/zookeeper/stable/zookeeper-3.4.8.tar.gz
	tar -zxf zookeeper-3.4.8.tar.gz
	cd zookeeper-3.4.8
	mkdir data
	cp -fp /opt/zookeeper-3.4.8/conf/zoo_sample.cfg /opt/zookeeper-3.4.8/conf/zoo.cfg 
	sed -i 's/\/tmp\/zookeeper/\/opt\/zookeeper-3.4.8\/data/g' /opt/zookeeper-3.4.8/conf/zoo.cfg
	cd /opt/zookeeper-3.4.8; bin/zkServer.sh start 