terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id            = var.azure_subscription_id
  tenant_id                  = var.arm_tenant_id
  skip_provider_registration = true
}
