#!/bin/bash

# Set file names and directories
KEY_DIR="./certs"
ROOT_KEY="$KEY_DIR/rootCA.key"
ROOT_CERT="$KEY_DIR/rootCA.crt"

# Create the directory if it doesn't exist
mkdir -p $KEY_DIR

# Generate the Root CA private key
echo "Generating Root CA private key..."
openssl genrsa -out $ROOT_KEY 4096

# Generate the Root CA certificate
echo "Generating Root CA certificate..."
openssl req -x509 -new -nodes -key $ROOT_KEY -sha256 -days 3650 -out $ROOT_CERT -subj "/C=US/ST=State/L=City/O=YourOrganization/OU=YourUnit/CN=RootCA"

echo "Root CA key and certificate generated:"
echo "Private Key: $ROOT_KEY"
echo "Certificate: $ROOT_CERT"
