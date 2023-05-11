#!/bin/sh
# Simple script to generate secrets

# Variables

DBName="NextcloudDB"

# Fonctions

# Password Generation
generatePassword() {
    openssl rand -hex 64
}

# User Generation
generateUser(){
	openssl rand -hex 8
}

# User and Password Generation for DataBase
echo $(generatePassword) > $(dirname "$0")/.secrets/postgres_password.txt
echo $(generateUser) > $(dirname "$0")/.secrets/postgres_user.txt

# Database name input in file
echo $DBName > $(dirname "$0")/.secrets/postgres_db.txt

# Secret generation for .env

JICOFO_COMPONENT_SECRET=$(generatePassword)
JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
JIGASI_XMPP_PASSWORD=$(generatePassword)
JIBRI_RECORDER_PASSWORD=$(generatePassword)
JIBRI_XMPP_PASSWORD=$(generatePassword)

# Replacement values from previous setup variable

sed -i.bak \
    -e "s#JICOFO_COMPONENT_SECRET=.*#JICOFO_COMPONENT_SECRET=${JICOFO_COMPONENT_SECRET}#g" \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}#g" \
    "$(dirname "$0")/.env"
