#!/bin/bash
echo "[server]" > ../inventory/ctwacademy/hosts
az network public-ip list --resource-group cicd-academy-rg  --query "[].{ip: ipAddress, name: name}[?name=='prometheusPublicIP']" -o tsv | awk '{print $1}' >> ../inventory/ctwacademy/hosts

echo "[clients]" >> ../inventory/ctwacademy/hosts
az network public-ip list --resource-group cicd-academy-rg  --query "[].{ip: ipAddress, name: name}[?name!='prometheusPublicIP']" -o tsv | grep -v "None" | awk '{print $1}' >> ../inventory/ctwacademy/hosts
