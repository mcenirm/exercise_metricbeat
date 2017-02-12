#!/bin/bash

set -e
set -u

sudo yum -y install lsof strace

mkdir ~/try1
cp -v -p /vagrant/try1/metricbeat.yml ~/try1/
