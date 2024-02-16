#!/bin/bash

RESOURCE_GROUP_NAME=cybersecurity-rg
STORAGE_ACCOUNT_NAME=paocomchourico$RANDOM
CONTAINER_NAME=paocomchourico


# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --auth-mode login --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME