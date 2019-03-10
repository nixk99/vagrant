#!/bin/bash

# Save settings
sudoservice iptables stop
sudo chkconfig iptables off

#Add Account Server API.server
sudo adduser testing
echo testing | passwd testing --stdin
usermod -aG wheel testing

#SSH to deploy.server
echo testing | sudo -S su testing
sudo echo "172.20.10.15 deploy.server" >> /etc/hosts
cat ~/.ssh/id_rsa.pub ssh testing@deploy.server 'cat >> .ssh/authrozed_key'
ssh -l testing deploy.server wget http://releases.ubuntu.com/cosmic/ubuntu-18.10-live-server-amd64.iso | tar -cvzf ubuntu.tar.gz | echo y |scp ~/ubuntu.iso testing@172.20.10.16:/~
