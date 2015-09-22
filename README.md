# email
Email application for IndieHosters network

## Features

 - opendkim
 - opendmarc
 - smtp/imap (no pop)
 - admin interface for people managing their email account (based on [vimbadmin](http://vimbadmin.net/))
 - autoconfig on thunderbird
 - autoconfig for iOS devices
 - not marked as spam on major provider (gmail, hotmail)
 - already used in production

## Prerequistes

 - docker
 - docker-compose

Modify the following files:
 - env
 - docker-compose.yml (hostname)

Add the following files:
 - TLS/ssl_certificate.pem
 - TLS/ssl_private_key.pem

## Run

```
docker-compose up
```

Check go to the web interface, get the salts, and put them in the `salts` file.

Everything should be up and running.

## Backup

To backup, just run the `BACKUP` in your folder and you should be good!

## OpenDKIM

Run the `add_domain.sh` script inside the postix container, and configure your DNS, you should be fine!

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
 - documentation for autoconfig in thunderbird
 - documentation for TLS for the web (reverse proxy FTW!)
 - separate processes in postfix (one process/container! damn!)
 - postfix/dovecot - try to sync install instructions with mailinabox

Heavily inspired by [mail-in-a-box](https://mailinabox.email/)! Thanks to the amazing work they produced. It is the best up to date `how to` for email hosting out there :)

