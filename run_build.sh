#!/bin/bash

set -x
set -e

./generate-etc_issue.sh
packer build .

