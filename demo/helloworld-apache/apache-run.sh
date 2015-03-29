#!/bin/sh

. /etc/apache2/envvars
mkdir -p /var/lock/apache2

exec /usr/sbin/apache2 -X