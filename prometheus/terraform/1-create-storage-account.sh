#!/bin/bash

RESOURCE_GROUP_NAME=cicd-academy-rg
STORAGE_ACCOUNT_NAME=tfstateprometheus
CONTAINER_NAME=tfstate

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

# Get Account Key
echo "ACCOUNT_KEY"
echo ""
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
echo $ACCOUNT_KEY

echo "Please run \"export ARM_ACCOUNT_KEY=${ACCOUNT_KEY}\""
