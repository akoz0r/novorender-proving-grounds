@minLength(3)
@maxLength(40)
param staticWebAppName string
param location string = resourceGroup().location

var contentStorageName = 'novopgjtcontent'
var staticAppSku = 'Free'

resource contentStorage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
    name: contentStorageName
    location: location
    sku: {
    name: 'Standard_LRS'
    }
    kind: 'StorageV2'
    properties: {
        supportsHttpsTrafficOnly: true
    }
}

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
    name: staticWebAppName
    location: location
    sku: {
        name: staticAppSku 
        size: staticAppSku 
    }
    tags: null
    properties: {}
}