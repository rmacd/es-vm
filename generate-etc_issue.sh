#!/bin/bash

set -e
set -x

## check bins
which packer
which figlet
which git

file="http/issue_net.pkrtpl"
echo "es/kib  demo" | figlet > $file
cat >> $file << EOF

Up and running! Now just open a web browser and go to http://\4:5601/

--- info ---

Elastic / Kibana demo VM is set up to provide an isolated environment for
getting to know Kibana. Further info is available in the project source.

      Source : https://github.com/rmacd/es-vm
  Maintainer : <ronald@rmacd.com>

--- note ---
 
You can log in to this VM with the credentials \${ssh_user}:\${ssh_pass}

EOF
