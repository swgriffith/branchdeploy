#!/bin/bash

# Start Functions
############################
# Show Params
show_params() {
echo "Parameters"
echo "------------------------------------------------"
echo "ARM_DEPLOYMENT_NAME: $ARM_DEPLOYMENT_NAME"
echo "SUBSCRIPTION: $SUBSCRIPTION_ID"
echo "TENANT_ID: $TENANT_ID"
echo "K3S_TOKEN: $K3S_TOKEN"
echo "ADMIN_USER_NAME: $ADMIN_USER_NAME"
echo "SSH_KEY_PATH: $SSH_KEY_PATH"
echo "USER_ASSIGNED_MI_ID: $USER_ASSIGNED_MI_ID"
echo "------------------------------------------------"
}
# end Functions
############################

echo 'Starting branch delpoyment!!!'

# Set Variables from var.sh
if [[ $1 != 'bicep' ]]
then
echo "Loading Parameters from var.sh"
source ./var.sh
else
echo "Bicep deployment!"
echo "Parameters loaded from environment variables"
fi

# Set the Subscription
az login --identity
az account set --subscription $SUBSCRIPTION_ID
az account show -o yaml

# Call Show Params Function
show_params

