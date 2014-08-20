#!/bin/sh

cd /vagrant/webapp/nodejs

HOME=/home/vagrant
NODEPATH=$HOME/local/node/bin
PATH=$NODEPATH:$PATH

export PATH

exec "$@"
