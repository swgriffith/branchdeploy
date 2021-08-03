targetScope = 'subscription'

param subscriptionID string
param tenantID string
param resourceGroupName string
param location string
param armDeploymentName string
param k3sToken string
param adminUserName string
param sshKeyPath string

var contributorDefId = 'b24988ac-6180-42a0-ab88-20f7382dd24c'
var userAccessAdminDefId = '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location  
}

module managedIdentity 'managedidentity.bicep' = {
  scope: resourceGroup
  name: 'managedIdentity'  
}

resource contribroleassignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(contributorDefId, 'contributor')
  scope: subscription()
  properties: {
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', contributorDefId)
    principalId: managedIdentity.outputs.userAssignedMIAppprincipalId
  }
}

resource useraccessroleassignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(contributorDefId, 'useraccessadmin')
  scope: subscription()
  properties: {
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', userAccessAdminDefId)
    principalId: managedIdentity.outputs.userAssignedMIAppprincipalId
  }
}

module deploymentScript 'deploymentscript.bicep' = {
  scope: resourceGroup
  name: 'deploymentscript'
  params: {
    adminUserName: adminUserName
    armDeploymentName: armDeploymentName
    k3sToken: k3sToken
    sshKeyPath: sshKeyPath
    subscriptionId: subscriptionID
    tenantId: tenantID
    userAssignedMIID: managedIdentity.outputs.userAssignedMIID
  }
  
}
