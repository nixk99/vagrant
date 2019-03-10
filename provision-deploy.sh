#!/bin/bash

# Save settings
sudoservice iptables stop
sudo chkconfig iptables off

#Add Account Server deploy.server
sudo adduser testing
echo testing | passwd testing --stdin
usermod -aG wheel testing

#SSH to api.server
echo testing | sudo -S su testing
sudo echo "172.20.10.16 api.server" >> /etc/hosts
cat ~/.ssh/id_rsa.pub ssh testing@api.server 'cat >> .ssh/authrozed_key'

