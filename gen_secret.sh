#!/bin/sh
# Simple script to generate secrets
TO_GENERATE="database user password"

generatePassword() {
    openssl rand -hex 64
}

echo "Initialize database access"
echo "Do you want random access ? [Y/n]"
read ANSWER


if [ -z $ANSWER ] || [ $ANSWER = 'Y' ]
then
	for VARIABLE in $TO_GENERATE ; do
        	echo $(generatePassword) > $(dirname "$0")/secrets/mysql-${VARIABLE}.txt
	done
	echo "Database secrets initialized whit random data"
else 
	echo "What is your database name ?"
	read DATABASE
	echo $DATABASE > $(dirname "$0")/secrets/mysql-database.txt
	echo "What is your database user ?"
	read USER
	echo $USER > $(dirname "$0")/secrets/mysql-user.txt
	echo "User password ?"
	read PASSWORD
	echo $PASSWORD > $(dirname "$0")/secrets/mysql-password.txt
	echo "Database secrets initialized whit your access"
fi

JICOFO_COMPONENT_SECRET=$(generatePassword)
JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
JIGASI_XMPP_PASSWORD=$(generatePassword)
JIBRI_RECORDER_PASSWORD=$(generatePassword)
JIBRI_XMPP_PASSWORD=$(generatePassword)

sed -i.bak \
    -e "s#JICOFO_COMPONENT_SECRET=.*#JICOFO_COMPONENT_SECRET=${JICOFO_COMPONENT_SECRET}#g" \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}#g" \
    "$(dirname "$0")/.env"
