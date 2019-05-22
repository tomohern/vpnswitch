#!/bin/bash

#Determine Default NIC
defaultnic=$(ip r | grep default | awk '{print $5}')
echo 'Your Default Network interface is $defaultnic'


#Stop VPN
sudo systemctl stop openvpn

#Bring down Default NIC
sudo ifconfig $defaultnic down

#Stop VPN
sudo systemctl start openvpn

sleep 60

nc -vz app01-clydesdale.csats.com 4435 | awk '{print $7}'
