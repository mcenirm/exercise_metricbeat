#!/bin/bash

set -e
set -u


looks_like_a_file_and_not_a_package_name () {
  ! [ "$1" = "${name##/}" ]
}


check_and_install_package () {
  local name
  local missing=()

  for name in "$@" ; do
    check_cmd=( rpm --quiet -q )
    if looks_like_a_file_and_not_a_package_name "$name" ; then
      check_cmd+=( --file )
    fi
    if ! "${check_cmd[@]}" "$name" ; then
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
check_and_install_package /usr/bin/xxd


mkdir -p ~/try1
cp -v -p /vagrant/try1/metricbeat.yml ~/try1/
