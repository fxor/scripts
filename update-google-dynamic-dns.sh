#!/bin/bash
# Script to update my dynamic DNS from google domains
CREDENTIALS_PATH="$HOME/googledomains.credentials"

IP=$(curl https://ipinfo.io/ip)
[ $? -ne 0 ] && echo "Error fetching IP" && exit 1

DOMAIN=$(cat $CREDENTIALS_PATH | grep -i fqdn | sed 's/fqdn=//')
[ $? -ne 0 ] && echo "Error reading fqdn from credentials file" && exit 1

CREDENTIALS=$(cat $CREDENTIALS_PATH | grep -i credentials | sed 's/credentials=//')
[ $? -ne 0 ] && echo "Error reading credentials from credentials file" && exit 1

curl https://$CREDENTIALS@domains.google.com/nic/update\?hostname\=$DOMAIN\&myip\=$IP

#######################################################################
# Example of googledomains.credentials (mostly for myself to remember):
# fqdn=asd.example.com
# credentials=username:password

################
# Run at startup
# echo "@reboot /path/to/script" | crontab -