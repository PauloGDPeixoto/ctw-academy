terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cybersecurity-rg"
    storage_account_name = "paocomchourico2385"
    container_name       = "paocomchourico"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id            = var.azure_subscription_id
  tenant_id                  = var.arm_tenant_id
  skip_provider_registration = true
}
