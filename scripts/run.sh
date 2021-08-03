#!/bin/bash

echo 'Starting branch delpoyment!!!'

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

# Set the Subscription
az login --identity
az account set --subscription $SUBSCRIPTION_ID
az account show -o yaml

