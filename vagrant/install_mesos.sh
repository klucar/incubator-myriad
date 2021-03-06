#!/bin/bash -v
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

# $1 = mesos version number to install (e.g. 0.21.1)

PREFIX="Mesos Provisioner: "
set -e

echo "${PREFIX} Installing pre-reqs..."
# For Mesos
apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
apt-get -y update

apt-get -y install libcurl3
apt-get -y install zookeeperd
apt-get -y install aria2
apt-get -y install ssh
apt-get -y install rsync


export MESOS_VERSION=$1
echo "${PREFIX}Installing mesos version: ${MESOS_VERSION}..."
apt-get -y install mesos
