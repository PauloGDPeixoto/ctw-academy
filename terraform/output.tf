output "public_ip_address" {
  value = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}

output "account_id" {
  value = data.azurerm_client_config.current.client_id
}

output "fqdn" {
  value = azurerm_public_ip.myterraformpublicip.fqdn
}
