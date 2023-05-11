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
echo $(generateUser) > $(dirname "$0")/secrets/postgres_user.txt
echo $(generatePassword) > $(dirname "$0")/secrets/postgres_password.txt
echo $(generatePassword) > $(dirname "$0")/secrets/nextcloud_admin_password.txt

# Database name input in file
echo $DBName > $(dirname "$0")/secrets/postgres_db.txt