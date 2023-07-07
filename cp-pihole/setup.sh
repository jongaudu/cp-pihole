#!/bin/bash

mv /var/www/html/admin/* /cp-pihole/html/
rm -r /var/www/html/admin
mv /cp-pihole/html/* /var/www/html/
mv /cp-pihole/15-pihole-admin.conf /etc/lighttpd/conf-enabled/15-pihole-admin.conf
service lighttpd restart
