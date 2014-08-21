#!/bin/sh

HOME=/home/vagrant
NODEPATH=$HOME/local/node/bin
PATH=$NODEPATH:$PATH

export PATH

cd $HOME/isucon3/qualifier/webapp/nodejs

exec "$@"
