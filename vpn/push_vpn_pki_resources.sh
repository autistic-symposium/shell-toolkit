#!/bin/bash
# This script pushes PKI certs to AWS ACM.
# Author: Mia von Steinkirch

ACM_ENV=
DOMAIN=
AWS_REGION=

ACM_DIR=~/.acm_secrets

CLIENT_KEY="$ACM_DIR"/client"$DOMAIN".key
CLIENT_CERT="$ACM_DIR"/client"$DOMAIN".crt
SERVER_KEY="$ACM_DIR"/server"$DOMAIN".key
SERVER_CERT="$ACM_DIR"/server"$DOMAIN".crt
CA_CERTIFICATE="$ACM_DIR"/"$ACM_ENV"_ca.crt


echo "Pushing client certificate and key to ACM..."

CLIENT_CERT_ARN=`aws acm import-certificate --certificate file://"$CLIENT_CERT" --private-key file://"$CLIENT_KEY" --certificate-chain file://"$CA_CERTIFICATE" --region "$AWS_REGION" | jq '.CertificateArn' 

echo "Successfully pushed client certificate with ARN "$CLIENT_CERT_ARN 


echo "Pushing server certificate and key to ACM..."

SERVER_CERT_ARN=`aws acm import-certificate --certificate file://"$SERVER_CERT" --private-key file://"$SERVER_KEY" --certificate-chain file://"$CA_CERTIFICATE" --region "$AWS_REGION" | jq '.CertificateArn' 

echo "Successfully pushed client certificate with ARN "$SERVER_CERT_ARN

