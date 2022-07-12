# Random identifier to avoid collisions
resource "random_string" "number" {
  length  = 4
  upper   = false
  lower   = false
  numeric = true
  special = false
}

# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "vnet${random_string.number.result}"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}