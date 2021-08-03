# Using Deployment Script in Bicep with Manage Identity

The following demonstrates an approach for running a subscription level deployment to create a managed identity, and the use that managed identity in an Azure CLI deploymentScript resource to create several Azure resources.

```bash
export RG_NAME=""
export LOC=""
export ARM_DEPLOYMENT_NAME="reddogbicep"
export SUBSCRIPTION_ID=""
export TENANT_ID=""
export K3S_TOKEN=''
export ADMIN_USER_NAME=''
export SSH_KEY_PATH="./ssh_keys"

az deployment sub create \
  --name $ARM_DEPLOYMENT_NAME \
  --template-file ../run.bicep \
  --location $LOC \
  --parameters subscriptionID=$SUBSCRIPTION_ID \
  --parameters tenantID=$TENANT_ID \
  --parameters resourceGroupName=$RG_NAME \
  --parameters location=$LOC \
  --parameters armDeploymentName=$ARM_DEPLOYMENT_NAME \
  --parameters k3sToken="$K3S_TOKEN" \
  --parameters adminUserName="$ADMIN_USER_NAME" \
  --parameters sshKeyPath="$SSH_KEY_PATH"
```