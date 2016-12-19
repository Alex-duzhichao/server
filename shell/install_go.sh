#!/usr/bin/env bash
wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.7.linux-amd64.tar.gz go/
rm -rf go1.7.linux-amd64.tar.gz
echo '\n# go' >> /etc/profile ;echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

mkdir -p /usr/local/go/path
echo 'export GOPATH=/usr/local/go/path' >> /etc/profile
go get -u -d github.com/CodisLabs/codis
cd $GOPATH/src/github.com/CodisLabs/codis
make
