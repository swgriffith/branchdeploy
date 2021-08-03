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
  --parameters resourceGroupName=$RG_NAME \
  --parameters location=$LOC \
  --parameters armDeploymentName=$ARM_DEPLOYMENT_NAME \
  --parameters k3sToken="$K3S_TOKEN" \
  --parameters adminUserName="$ADMIN_USER_NAME" \
  --parameters sshKeyPath="$SSH_KEY_PATH"
