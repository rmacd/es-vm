#!/bin/bash

set -x
set -e

ip=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
./generate-etc_issue.sh
PKR_VAR_build_ip=$ip packer build .

