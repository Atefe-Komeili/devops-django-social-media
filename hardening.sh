#! /bin/bash

# time variable section
HOUR ='date +%H'
WEEK='date +%A'
MONTH='date +%Y-%d'
DAY='date +%Y-%m-%d'
NOW="$(date +"%Y-%m-%d_%H-%M-%S")"

#variables
DOMAIN_NAME=atefekomeili.ir
HOSTNAME=$DOMAIN_NAME
SSH_PORT=9011
BAC_DIR=/opt/backup/file_$NOW

# docker config destination
DOCKER_DEST=/etc/systemd/system/docker.service.d/
MIRROR_REGISTERY=https://docker.jamko.ir


if [-z $BAC_DIR]; then
	echo "Backup Directory is exist"
else
	mkdir -p $BAC_DIR
fi

#update OS
apt update && apt upgrade -y

#remove unuse package
apt remove -y snapd && apt purge -y snapd

#host config
hostnamectl set-hostname $HOSTNAME

#timeout config
cat /etc/profile.d/timeout-setting.sh

#config sysctl.conf
cp /etc/sysctl.conf $BAC_DIR

#decrease time wait second
#net.ipv4.tcp_fin_timeout=30

#apt install curl nano fail2ban

#disable and mask ufw
#systemctl stop ufw
#systemctl disable ufw
#system mask ufw


#cp /etc/fail2ban/fail2ban.conf /etc/fail2ban.local
#sed -i 's/ssh port/ ssh port=''$$SSH_PORT/g' /etc/fail2ban.local

#systemctl restart fail2ban
#systemctl enable fail2ban
#file2ban-client status

