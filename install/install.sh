#!/bin/bash
INSTALL_PATH="/opt/opsbt"

yum install -y supervisor

cp -r ../src $INSTALL_PATH 
cp ./supervisord.d/*.ini /etc/supervisord.d/
