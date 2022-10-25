#!/bin/bash

set -x
set -e

## test bins
which vboxmanage

test_vboxnet=$(vboxmanage list hostonlyifs | grep "^Name" | grep vboxnet0 | wc -l)
if [[ $test_vboxnet -ne "1" ]] ; then
    echo "vboxnet0 must exist"
    exit 1
fi

ip=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
./generate-etc_issue.sh
PKR_VAR_build_ip=$ip packer build .

