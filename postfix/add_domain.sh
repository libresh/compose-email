#!/bin/bash -e

DOMAIN=$1

mkdir -p /etc/opendkim/keys/$DOMAIN

/usr/bin/opendkim-genkey -D /etc/opendkim/keys/$DOMAIN/ -d $DOMAIN -s mail

/bin/chown -R opendkim /etc/opendkim/keys

mv /etc/opendkim/keys/$DOMAIN/mail.private /etc/opendkim/keys/$DOMAIN/mail

echo mail._domainkey.$DOMAIN $DOMAIN:mail:/etc/opendkim/keys/$DOMAIN/mail >> /etc/opendkim/KeyTable

echo *@$DOMAIN mail._domainkey.$DOMAIN >> /etc/opendkim/SigningTable

echo $DOMAIN >> /etc/opendkim/TrustedHosts
echo galaxy.$DOMAIN >> /etc/opendkim/TrustedHosts

cat /etc/opendkim/keys/$DOMAIN/mail.txt
