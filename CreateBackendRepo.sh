adminph@Azure:~$ az ad sp create-for-rbac --name AzureDevOps --role="Contributor"
Changing "AzureDevOps" to a valid URI of "http://AzureDevOps", which is the required format used for service principal names
Creating a role assignment under the scope of "/subscriptions/67d97890-89f4-4294-9de2-81f74a631242"
  Retrying role assignment creation: 1/36
{
  "appId": "d04933eb-0b23-44eb-9e23-3045de43a67f",
  "displayName": "AzureDevOps",
  "name": "http://AzureDevOps",
  "password": "AnngYK8sKduCA567ZjTivz5bbN-RCeKx1_",
  "tenant": "5a783410-682d-4564-b908-bb78d5afb2fe"
}

az group create --name ams-core-devops-p --location "West Europe"

adminph@Azure:~$ az storage account create --resource-group ams-core-devops-p --name sa01devops --sku Standard_LRS --encryption-services blob
{- Finished ..
  "accessTier": "Hot",
  "allowBlobPublicAccess": null,
  "azureFilesIdentityBasedAuthentication": null,
  "blobRestoreStatus": null,
  "creationTime": "2020-07-24T12:18:46.783553+00:00",
  "customDomain": null,
  "enableHttpsTrafficOnly": true,
  "encryption": {
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "requireInfrastructureEncryption": null,
    "services": {
      "blob": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2020-07-24T12:18:46.892938+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2020-07-24T12:18:46.892938+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/67d97890-89f4-4294-9de2-81f74a631242/resourceGroups/ams-core-devops-p/providers/Microsoft.Storage/storageAccounts/sa01devops",
  "identity": null,
  "isHnsEnabled": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "westeurope",
  "minimumTlsVersion": null,
  "name": "sa01devops",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://sa01devops.blob.core.windows.net/",
    "dfs": "https://sa01devops.dfs.core.windows.net/",
    "file": "https://sa01devops.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://sa01devops.queue.core.windows.net/",
    "table": "https://sa01devops.table.core.windows.net/",
    "web": "https://sa01devops.z6.web.core.windows.net/"
  },
  "primaryLocation": "westeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "ams-core-devops-p",
  "routingPreference": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": null,
  "tags": {},
  "type": "Microsoft.Storage/storageAccounts"
}

adminph@Azure:~$ az storage account keys list --resource-group ams-core-devops-p --account-name sa01devops --query [0].value -o tsv
u+eZ6b8wLyD31hwXjBlQh6nl/VxRrAVGl5LxQhRscRXEWG/6V3GLrpSfxwdjH9eacmQo6SCTYlb7ISuwPCeNmg==

adminph@Azure:~$ az storage container create --name container01-azuredevops --account-name sa01devops --account-key "u+eZ6b8wLyD31hwXjBlQh6nl/VxRrAVGl5LxQhRscRXEWG/6V3GLrpSfxwdjH9eacmQo6SCTYlb7ISuwPCeNmg=="
{
  "created": true
}

adminph@Azure:~$ az keyvault create -n devops01-kv-p -g ams-core-devops-p -l "West Europe"
{- Finished ..
  "id": "/subscriptions/67d97890-89f4-4294-9de2-81f74a631242/resourceGroups/ams-core-devops-p/providers/Microsoft.KeyVault/vaults/devops01-kv-p",
  "location": "westeurope",
  "name": "devops01-kv-p",
  "properties": {
    "accessPolicies": [
      {
        "applicationId": null,
        "objectId": "db5a2cde-111f-47a6-a8e4-c53b56c60fe1",
        "permissions": {
          "certificates": [
            "get",
            "list",
            "delete",
            "create",
            "import",
            "update",
            "managecontacts",
            "getissuers",
            "listissuers",
            "setissuers",
            "deleteissuers",
            "manageissuers",
            "recover"
          ],
          "keys": [
            "get",
            "create",
            "delete",
            "list",
            "update",
            "import",
            "backup",
            "restore",
            "recover"
          ],
          "secrets": [
            "get",
            "list",
            "set",
            "delete",
            "backup",
            "restore",
            "recover"
          ],
          "storage": [
            "get",
            "list",
            "delete",
            "set",
            "update",
            "regeneratekey",
            "setsas",
            "listsas",
            "getsas",
            "deletesas"
          ]
        },
        "tenantId": "5a783410-682d-4564-b908-bb78d5afb2fe"
      }
    ],
    "createMode": null,
    "enablePurgeProtection": null,
    "enableRbacAuthorization": null,
    "enableSoftDelete": true,
    "enabledForDeployment": false,
    "enabledForDiskEncryption": null,
    "enabledForTemplateDeployment": null,
    "networkAcls": null,
    "privateEndpointConnections": null,
    "provisioningState": "Succeeded",
    "sku": {
      "name": "standard"
    },
    "softDeleteRetentionInDays": 90,
    "tenantId": "5a783410-682d-4564-b908-bb78d5afb2fe",
    "vaultUri": "https://devops01-kv-p.vault.azure.net/"
  },
  "resourceGroup": "ams-core-devops-p",
  "tags": {},
  "type": "Microsoft.KeyVault/vaults"
}

adminph@Azure:~$ az keyvault secret set --vault-name "devops01-kv-p" --name "sa01devops-accesskey" --value "u+eZ6b8wLyD31hwXjBlQh6nl/VxRrAVGl5LxQhRscRXEWG/6V3GLrpSfxwdjH9eacmQo6SCTYlb7ISuwPCeNmg=="
{
  "attributes": {
    "created": "2020-07-24T12:27:12+00:00",
    "enabled": true,
    "expires": null,
    "notBefore": null,
    "recoveryLevel": "Recoverable+Purgeable",
    "updated": "2020-07-24T12:27:12+00:00"
  },
  "contentType": null,
  "id": "https://devops01-kv-p.vault.azure.net/secrets/sa01devops-accesskey/959dca899a65404291c3200ce8fc6392",
  "kid": null,
  "managed": null,
  "name": "sa01devops-accesskey",
  "tags": {
    "file-encoding": "utf-8"
  },
  "value": "u+eZ6b8wLyD31hwXjBlQh6nl/VxRrAVGl5LxQhRscRXEWG/6V3GLrpSfxwdjH9eacmQo6SCTYlb7ISuwPCeNmg=="
}

adminph@Azure:~$ az keyvault secret set --vault-name "devops01-kv-p" --name "spn-azuredevops-password" --value "AnngYK8sKduCA567ZjTivz5bbN-RCeKx1_"
{
  "attributes": {
    "created": "2020-07-24T12:29:05+00:00",
    "enabled": true,
    "expires": null,
    "notBefore": null,
    "recoveryLevel": "Recoverable+Purgeable",
    "updated": "2020-07-24T12:29:05+00:00"
  },
  "contentType": null,
  "id": "https://devops01-kv-p.vault.azure.net/secrets/spn-azuredevops-password/1a2373350b8d4c3ba6445abccdc3947d",
  "kid": null,
  "managed": null,
  "name": "spn-azuredevops-password",
  "tags": {
    "file-encoding": "utf-8"
  },
  "value": "AnngYK8sKduCA567ZjTivz5bbN-RCeKx1_"
}

adminph@Azure:~$ az keyvault secret set --vault-name "devops01-kv-p" --name "flsadin" --value "AMxx2iQ7,2017"
{
  "attributes": {
    "created": "2020-07-24T12:30:12+00:00",
    "enabled": true,
    "expires": null,
    "notBefore": null,
    "recoveryLevel": "Recoverable+Purgeable",
    "updated": "2020-07-24T12:30:12+00:00"
  },
  "contentType": null,
  "id": "https://devops01-kv-p.vault.azure.net/secrets/flsadin/f1d96419359744cea1ea33d243efa972",
  "kid": null,
  "managed": null,
  "name": "flsadin",
  "tags": {
    "file-encoding": "utf-8"
  },
  "value": "AMxx2iQ7,2017"
}

adminph@Azure:~$ az keyvault set-policy --name "devops01-kv-p" --spn "d04933eb-0b23-44eb-9e23-3045de43a67f" --secret-permissions get list
{- Finished ..
  "id": "/subscriptions/67d97890-89f4-4294-9de2-81f74a631242/resourceGroups/ams-core-devops-p/providers/Microsoft.KeyVault/vaults/devops01-kv-p",
  "location": "westeurope",
  "name": "devops01-kv-p",
  "properties": {
    "accessPolicies": [
      {
        "applicationId": null,
        "objectId": "db5a2cde-111f-47a6-a8e4-c53b56c60fe1",
        "permissions": {
          "certificates": [
            "get",
            "list",
            "delete",
            "create",
            "import",
            "update",
            "managecontacts",
            "getissuers",
            "listissuers",
            "setissuers",
            "deleteissuers",
            "manageissuers",
            "recover"
          ],
          "keys": [
            "get",
            "create",
            "delete",
            "list",
            "update",
            "import",
            "backup",
            "restore",
            "recover"
          ],
          "secrets": [
            "get",
            "list",
            "set",
            "delete",
            "backup",
            "restore",
            "recover"
          ],
          "storage": [
            "get",
            "list",
            "delete",
            "set",
            "update",
            "regeneratekey",
            "setsas",
            "listsas",
            "getsas",
            "deletesas"
          ]
        },
        "tenantId": "5a783410-682d-4564-b908-bb78d5afb2fe"
      },
      {
        "applicationId": null,
        "objectId": "7f3b9f4f-6498-47f9-a100-0124e5862400",
        "permissions": {
          "certificates": null,
          "keys": null,
          "secrets": [
            "get",
            "list"
          ],
          "storage": null
        },
        "tenantId": "5a783410-682d-4564-b908-bb78d5afb2fe"
      }
    ],
    "createMode": null,
    "enablePurgeProtection": null,
    "enableRbacAuthorization": null,
    "enableSoftDelete": true,
    "enabledForDeployment": false,
    "enabledForDiskEncryption": null,
    "enabledForTemplateDeployment": null,
    "networkAcls": null,
    "privateEndpointConnections": null,
    "provisioningState": "Succeeded",
    "sku": {
      "name": "standard"
    },
    "softDeleteRetentionInDays": 90,
    "tenantId": "5a783410-682d-4564-b908-bb78d5afb2fe",
    "vaultUri": "https://devops01-kv-p.vault.azure.net/"
  },
  "resourceGroup": "ams-core-devops-p",
  "tags": {},
  "type": "Microsoft.KeyVault/vaults"
}


