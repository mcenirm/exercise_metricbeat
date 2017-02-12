#!/bin/bash

set -e
set -u

sudo yum -y install lsof strace
sudo yum -y install epel-release
sudo yum -y install jq

mkdir -p ~/try1
cp -v -p /vagrant/try1/metricbeat.yml ~/try1/
