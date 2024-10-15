#!/bin/bash
# This scripts creates PKI secrets
# Author: Mia Stein

DOMAIN=
ACM_ENV=
ACM_DIR=~/.acm_secrets

LOCAL_DIR=$(pwd)
git clone https://github.com/OpenVPN/easy-rsa.git && cd easy-rsa/easyrsa3

# Create PKI
./easyrsa init-pki

# Generates the CA certificate without a password
yes | ./easyrsa build-ca nopass  

# Build server certificate without a password
./easyrsa build-server-full server"$DOMAIN" nopass 

# Build client certificate without a password
./easyrsa build-client-full client"$DOMAIN" nopass 

# Copy certificate files to a new directory
if [ -d "$ACM_DIR" ]
then
    echo Info: directory "$ACM_DIR" exists.
else
    mkdir "$ACM_DIR"
fi

cp "$LOCAL_DIR"/easy-rsa/easyrsa3/pki/ca.crt "$ACM_DIR"/"$ACM_ENV"_ca.crt
cp "$LOCAL_DIR"/easy-rsa/easyrsa3/pki/issued/*.crt "$ACM_DIR"
cp "$LOCAL_DIR"/easy-rsa/easyrsa3/pki/private/*.key "$ACM_DIR"

echo Info: Certificates and keys were generate in "$ACM_DIR"

# Clean up
cd "$LOCAL_DIR"
rm -rf "$LOCAL_DIR"/easy-rsa

