#!/bin/bash

set -e
set -u


check_and_install_package () {
  local name
  local missing=()

  for name in "$@" ; do
    if ! rpm --quiet -q "$name" ; then
      missing+=( "$name" )
    fi
  done

  if [ "${#missing[@]}" -gt 0 ] ; then
    sudo yum -y install "${missing[@]}"
  fi
}


check_and_install_package lsof strace
check_and_install_package epel-release
check_and_install_package jq

mkdir -p ~/try1
cp -v -p /vagrant/try1/metricbeat.yml ~/try1/
