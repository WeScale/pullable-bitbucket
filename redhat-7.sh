#!/usr/bin/env bash

set -e
set -x

#
# Getting orientation
#
SELF=$(readlink -f $0)
SELF_DIR=$(dirname $SELF)

#
# Warming up
#
yum makecache -y
yum update -y

#
# Install mandatory packages
#
yum install \
  python-setuptools \
  python-devel \
  openssl-devel \
  sudo \
  libffi-devel \
  git \
  gcc \
  gcc-c++ \
  make \
  openssl-devel \
  libxml2 \
  libxml2-devel \
  libxslt \
  libxslt-devel \
  perl-devel \
  automake \
  gdisk \
  -y

#
# Latest Ansible install
#
for i in 1 2 3 4 5; do easy_install pip && break || sleep 2; done

pip install -U \
  pyopenssl \
  ndg-httpsclient \
  httplib2 \
  pyasn1 \
  boto \
  boto3 \
  pip \
  ansible

ansible-playbook $SELF_DIR/init.yml
