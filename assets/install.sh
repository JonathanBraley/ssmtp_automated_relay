#!/bin/bash

#we set the file we are going to work on in a variable
file="/etc/ssmtp/ssmtp.conf"

if [ -f $file ]
then
	sed -i -e "s/RELAY_USER/"${RELAY_USER}"/g" $file
	sed -i -e "s/RELAY_PASSWORD/"${RELAY_PASSWORD}"/g" $file
	sed -i -e "s/RELAY_SERVER/"${RELAY_SERVER}"/g" $file
	sed -i -e "s/RELAY_HOSTNAME/"${RELAY_HOSTNAME}"/g" $file
	
	if [ -z ${IDENTITY} ]
	then
		sed -i -e "s/IDENTITY/"${IDENTITY}"/g" $file

		sed -i '/root=/s/^#//' file
	fi

	if [ -z ${RELAY_DOMAIN} ]
	then
		sed -i -e "s/RELAY_DOMAIN/"${RELAY_DOMAIN}"/g" $file

		sed -i '/rewriteDomain=/s/^#//' file
	fi

	if [ -z ${FROM_OVERRIDE} ]
	then
		sed -i '/FromLineOverride=/s/^#//' file
	fi

	if [ -z ${RELAY_TLS} ]
	then
		sed -i '/UseSTARTTLS=/s/^#//' file
	fi
fi

exec "$@"
