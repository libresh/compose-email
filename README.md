# email
Email application for IndieHosters network

## Features

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | -----------
[x] SMTP (postfix) | [x] SMTP (postfix) | :white_check_mark: 
[x] IMAP (dovecot) | [x] IMAP (dovecot) | :white_check_mark: 
[x] POP  (dovecot) | [x] POP  (dovecot) | :white_check_mark: 
[ ] search (dovecot-lucene) | [x] search (dovecot-lucene) | [planned](https://github.com/indiehosters/email/issues/5)
[ ] CardDAV/CalDAV (ownCloud) | [x] CardDAV/CalDAV (ownCloud) | part of [ownCloud](https://github.com/indiehosters/ownCloud) package
[ ] Exchange ActiveSync (z-push) | [x] Exchange ActiveSync (z-push) | [planned](https://github.com/indiehosters/email/issues/3)
[ ] Webmail (Roundcube) | [x] Webmail (Roundcube) | [planned](https://github.com/indiehosters/email/issues/4)
[ ] static website hosting (nginx) | [x] static website hosting (nginx) | part of other package
[x] Spam filtering (spamassassin) | [x] Spam filtering (spamassassin) | :white_check_mark:
[x] greylisting (postgrey) | [x] greylisting (postgrey) | :white_check_mark: 
[ ] Backups (duplicity) | [x] Backups (duplicity) | part of [backup](https://github.com/IndiePaaS/IndiePaaS/blob/master/unit-files/b-u%40.service) package
[ ] firewall (ufw) | [x] firewall (ufw) | planned, as part of [firewall](https://github.com/IndiePaaS/IndiePaaS/issues/108) package
[ ] intrusion protection (fail2ban) | [x] intrusion protection (fail2ban) | ? (difficult in docker)
[ ] system monitoring (munin) | [x] system monitoring (munin) | planned, as part of other package

DNS (nsd4):

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | ----
[x] DKIM (OpenDKIM) | [x] DKIM (OpenDKIM) | :white_check_mark: 
[x] DMARC | [x] DMARC (postgrey) | :white_check_mark: 
[ ] SPF | [x] SPF | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] DNSSEC | [x] DNSSEC | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] DANE TLSA | [x] DANE TLSA | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] SSHFP records | [x] SSHFP records | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)

control panel and API:

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | ----------
[x] vimbadmin | [x] custom coded | :white_check_mark: 
[x] Add/Remove mail User | [x] Add/Remove mail User | :white_check_mark: 
[x] Add/Remove Aliases | [x] Add/Remove Aliases | :white_check_mark: 
[ ] custom DNS records | [x] custom DNS records | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[x] multiadmin | [ ] mutliadmin | :white_check_mark: 

## Prerequistes

 - docker
 - docker-compose

Modify the following files:
 - env.template (and rename to env)

Add the following files:
 - TLS/chain.pem
 - TLS/cert.pem
 - TLS/ssl_certificate.pem
 - TLS/ssl_private_key.pem

## Run

```
./install
VIRTUAL_HOST=example.org docker-compose up
```

Check go to the web interface (http://conainer_ip:80), get the salts, and put them in the `salts` file.

Everything should be up and running.

## Backup

To backup, just run the `./scripts/pre-backup` in your folder and you should be good!

## OpenDKIM

Run the `add_domain.sh` script inside the postix container, and configure your DNS, you should be fine!

## Add a mailbox

You can find a script [here](https://github.com/IndiePaaS/IndiePaaS/blob/master/utils/add_mailbox.sh)

## Contributing

If you have any issue (something not working, mail marked as spam, missing doc), please do report an issue here! Thanks

This system is used in production at [IndieHosters](https://indiehosters.net/) so it is maintained. If you use it, please tell us, and we'll be really happy to update this README!

You can help us by:
 - starring this project
 - sending us a thanks email
 - reporting bugs
 - writing documentation/blog on how you got up and running in 5mins
 - writing more documentation
 - sending us cake :) We loove cake!

## TODO
 - documentation for TLS for the web (reverse proxy FTW!)
 - separate processes in postfix (one process/container! damn!)
 - postfix/dovecot - try to sync install instructions with mailinabox

Heavily inspired by [mail-in-a-box](https://mailinabox.email/)! Thanks to the amazing work they produced. It is the best up to date `how to` for email hosting out there :)
