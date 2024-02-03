#!/bin/bash

# Variables
USERNAME="alejo"
FIRSTNAME="Alejandro"
LASTNAME="Varela"
CREDENTIAL_TYPE="keyauth"

# Create user
eg users create -p "username=$USERNAME" -p "firstName=$FIRSTNAME" -p "lastName=$LASTNAME" -q

# Create credentials
eg credentials create -c "$USERNAME" -t "$CREDENTIAL_TYPE" -q

# Get credentials
CREDENTIALS=$(eg credentials list -q)

# Export credentials
echo "$CREDENTIALS" > credentials.txt

# Log
echo "Credentials for user $USERNAME created and exported to credentials.txt file."