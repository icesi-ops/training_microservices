#!/bin/sh

# Variables
USERNAME="alejo"
FIRSTNAME="Alejandro"
LASTNAME="Varela"
CREDENTIAL_TYPE="key-auth"

# Create user
eg users create -p "username=$USERNAME" -p "firstname=$FIRSTNAME" -p "lastname=$LASTNAME" -q

# Create credentials
eg credentials create -c "$USERNAME" -t "$CREDENTIAL_TYPE" -q

# Get credentials
CREDENTIALS=$(eg credentials list -q)

# Export credentials
echo "$CREDENTIALS" > credentials.txt

# Log
echo "Credentials for user $USERNAME created and exported to credentials.txt file."