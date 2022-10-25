ES VM
=====

This is the packer source for creating a clean VirtualBox VM with Elasticsearch
and Kibana pre-installed.

The OVF file can be installed on Windows / MacOS / Linux.

Once it's up and running, Kibana will listen on the VM http://<public_ip>:5601/

Running the build
=================

Assuming packer etc is in $PATH, it's just a case of running `./run_build.sh`.
