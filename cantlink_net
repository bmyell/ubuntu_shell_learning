#!/bin/bash
#------------------------------------------------
echo iface eth0 inet static>>/etc/network/interfaces
echo address 202.117.132.41 //ip地址>>/etc/network/interfaces                 
echo netmask 255.255.255.0  //网掩码>>/etc/network/interfaces
echo gateway 202.117.132.1  //网关>>/etc/network/interfaces
echo auto eth0>>/etc/network/interfaces

#--------------------------------------------------

echo nameserver 114.114.114.114>>/etc/resolv.conf

#--------------------------------------------------

sudo /etc/init.d/networking restart

